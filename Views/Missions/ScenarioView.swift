import SwiftUI

struct ScenarioView: View {
    @ObservedObject var progress: ProgressStore
    @StateObject private var viewModel: MissionPlayViewModel

    init(mission: Mission, progress: ProgressStore) {
        self.progress = progress
        _viewModel = StateObject(wrappedValue: MissionPlayViewModel(mission: mission))
    }

    var body: some View {
        Group {
            if viewModel.isComplete {
                MissionCompleteView(mission: viewModel.mission, score: viewModel.correctAnswers, progress: progress)
                    .onAppear { progress.complete(viewModel.mission) }
            } else {
                GeometryReader { geometry in
                    HStack(spacing: 0) {
                        storyPanel(width: geometry.size.width * 0.52)
                        decisionPanel
                    }
                }
            }
        }
        .navigationTitle(viewModel.mission.title)
        .navigationBarTitleDisplayMode(.inline)
    }

    private func storyPanel(width: CGFloat) -> some View {
        VStack(spacing: 22) {
            HStack {
                Text("SCENE \(viewModel.scenarioIndex + 1) OF \(viewModel.mission.scenarios.count)").font(.subheadline.weight(.heavy)).tracking(1)
                Spacer()
                Text("\(Int(viewModel.progress * 100))%").font(.headline)
            }.foregroundStyle(viewModel.mission.color)
            ProgressView(value: viewModel.progress).tint(viewModel.mission.color)
            Spacer()
            Image(viewModel.scenario.imageName ?? viewModel.mission.illustrationName)
                .resizable()
                .scaledToFill()
                .frame(width: 380, height: 255)
                .clipShape(RoundedRectangle(cornerRadius: 26, style: .continuous))
                .accessibilityLabel("\(viewModel.mission.title) story illustration")
            Text(viewModel.scenario.story).font(.system(.title, design: .rounded, weight: .bold)).multilineTextAlignment(.center).foregroundStyle(HeroTheme.ink).lineSpacing(5)
            Spacer()
        }
        .padding(38).frame(width: width).background(viewModel.mission.color.opacity(0.11))
    }

    private var decisionPanel: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text("What should you do?").font(.system(.largeTitle, design: .rounded, weight: .bold)).foregroundStyle(HeroTheme.ink)
                Text(viewModel.scenario.prompt).font(.title3).foregroundStyle(HeroTheme.muted)
                ForEach(viewModel.scenario.choices) { choice in
                    ChoiceButton(choice: choice, selectedChoice: viewModel.selectedChoice, color: viewModel.mission.color) {
                        withAnimation(.easeInOut(duration: 0.2)) { viewModel.choose(choice) }
                    }
                }
                if let choice = viewModel.selectedChoice {
                    FeedbackCard(choice: choice).transition(.move(edge: .bottom).combined(with: .opacity))
                    if choice.isCorrect {
                        PrimaryButton(
                            title: viewModel.scenarioIndex + 1 == viewModel.mission.scenarios.count ? "Finish Mission" : "Continue Story",
                            systemImage: "arrow.right", color: viewModel.mission.color
                        ) { withAnimation { viewModel.continueStory() } }
                    } else {
                        PrimaryButton(
                            title: "Retry",
                            systemImage: "arrow.counterclockwise",
                            color: .orange
                        ) { withAnimation { viewModel.retryScenario() } }
                    }
                }
            }.padding(38)
        }.background(HeroTheme.background)
    }
}
