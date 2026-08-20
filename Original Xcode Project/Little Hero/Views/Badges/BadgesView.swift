import SwiftUI

struct BadgesView: View {
    @ObservedObject var progress: ProgressStore

    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack(alignment: .leading, spacing: 28) {
                    PageHeader(
                        eyebrow: "HERO COLLECTION",
                        title: "Badges",
                        subtitle: "Complete missions to fill your collection and celebrate what you learned."
                    )
                    HStack(spacing: 14) {
                        Image(systemName: "medal.fill").interfaceSymbol(size: 24).foregroundStyle(.yellow)
                        Text("\(progress.completedMissionIDs.count) of \(MissionLibrary.missions.count) badges earned").font(.title3.weight(.bold))
                        Spacer()
                        ProgressView(value: Double(progress.completedMissionIDs.count), total: Double(MissionLibrary.missions.count))
                            .frame(maxWidth: 280).tint(HeroTheme.accent)
                    }.padding(20).heroCard(cornerRadius: 20)

                    LazyVGrid(columns: columns(for: geometry.size.width), spacing: 24) {
                        ForEach(MissionLibrary.missions) { mission in
                            HeroBadgeView(badge: mission.badge, color: mission.color, isUnlocked: progress.isComplete(mission))
                        }
                    }
                }
                .frame(maxWidth: HeroTheme.contentMaxWidth, alignment: .leading)
                .padding(.horizontal, 44).padding(.vertical, 38).frame(maxWidth: .infinity)
            }
        }
    }

    private func columns(for width: CGFloat) -> [GridItem] {
        let count = width > 1000 ? 3 : 2
        return Array(repeating: GridItem(.flexible(), spacing: 24), count: count)
    }
}
