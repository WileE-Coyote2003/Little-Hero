import SwiftUI

struct MissionsView: View {
    @ObservedObject var progress: ProgressStore
    @EnvironmentObject private var router: AppRouter

    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    PageHeader(
                        eyebrow: "LEARN • PRACTICE • BE READY",
                        title: "Choose a mission",
                        subtitle: "Learn how to stay calm and make safe choices during an emergency."
                    )
                    LazyVGrid(columns: columns(for: geometry.size.width), spacing: 18) {
                        ForEach(MissionLibrary.missions) { mission in
                            Button { router.showMission(mission) } label: {
                                MissionCard(mission: mission, isComplete: progress.isComplete(mission))
                            }.buttonStyle(.plain)
                        }
                    }
                }
                .frame(maxWidth: HeroTheme.contentMaxWidth, alignment: .leading)
                .padding(.horizontal, 44).padding(.vertical, 28)
                .frame(maxWidth: .infinity)
            }
        }
    }

    private func columns(for width: CGFloat) -> [GridItem] {
        let count = width > 900 ? 2 : 1
        return Array(repeating: GridItem(.flexible(), spacing: 24), count: count)
    }
}

struct PageHeader: View {
    let eyebrow: String
    let title: String
    let subtitle: String

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(eyebrow).font(.subheadline.weight(.heavy)).tracking(1.2).foregroundStyle(HeroTheme.accent)
            Text(title).font(.system(.largeTitle, design: .rounded, weight: .bold)).foregroundStyle(HeroTheme.ink)
            Text(subtitle).font(.title3).foregroundStyle(HeroTheme.muted)
        }
    }
}
