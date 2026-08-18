import SwiftUI

struct MissionIntroView: View {
    let mission: Mission
    @ObservedObject var progress: ProgressStore
    @EnvironmentObject private var router: AppRouter

    var body: some View {
        GeometryReader { geometry in
            HStack(spacing: 0) {
                ZStack {
                    LinearGradient(colors: [mission.color.opacity(0.2), mission.color.opacity(0.05)], startPoint: .topLeading, endPoint: .bottomTrailing)
                    VStack(spacing: 24) {
                        Image(mission.illustrationName)
                            .resizable()
                            .scaledToFit()
                            .clipShape(RoundedRectangle(cornerRadius: 28, style: .continuous))
                            .frame(width: min(geometry.size.width * 0.45, 570))
                            .accessibilityLabel("\(mission.title) mission illustration")
                    }
                }
                .frame(width: geometry.size.width * 0.52)

                VStack(alignment: .leading, spacing: 24) {
                    Text("MISSION").font(.subheadline.weight(.heavy)).tracking(1.4).foregroundStyle(mission.color)
                    Text(mission.title).font(.system(size: 46, weight: .bold, design: .rounded)).foregroundStyle(HeroTheme.ink)
                    Text(mission.summary).font(.title2.weight(.semibold)).foregroundStyle(HeroTheme.muted)
                    Text("Help Little Hero make safe decisions through \(mission.scenarios.count) short story scenes. Every choice teaches an important safety skill.")
                        .font(.title3).foregroundStyle(HeroTheme.ink).lineSpacing(5)
                    HStack(spacing: 12) {
                        Label(mission.uniform.name, systemImage: "tshirt.fill")
                        Label("\(mission.scenarios.count) scenes", systemImage: "book.pages")
                        Label(mission.badge.name, systemImage: "medal.fill")
                    }.font(.subheadline.weight(.semibold)).foregroundStyle(HeroTheme.muted)
                    Spacer()
                    Button { router.startMission(mission) } label: {
                        Label(progress.isComplete(mission) ? "Play Again" : "Start Mission", systemImage: "play.fill")
                            .font(.title3.weight(.bold)).frame(maxWidth: .infinity, minHeight: 62).foregroundStyle(.white)
                            .background(mission.color, in: RoundedRectangle(cornerRadius: 18))
                    }.buttonStyle(.plain)
                }
                .padding(48).frame(maxWidth: .infinity, alignment: .leading).background(.white)
            }
        }
        .navigationTitle(mission.title).navigationBarTitleDisplayMode(.inline)
    }
}
