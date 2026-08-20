import SwiftUI

struct MissionCard: View {
    let mission: Mission
    let isComplete: Bool

    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                LinearGradient(colors: [mission.color.opacity(0.18), mission.color.opacity(0.06)], startPoint: .topLeading, endPoint: .bottomTrailing)
                Image(mission.illustrationName)
                    .resizable()
                    .scaledToFill()
                    .clipped()
                if isComplete {
                    Image(systemName: "checkmark.circle.fill").interfaceSymbol(size: 34).foregroundStyle(.white, .green)
                        .padding(18).frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                }
            }
            .frame(height: 220)
            .clipped()
            .clipShape(
                UnevenRoundedRectangle(
                    topLeadingRadius: 26,
                    bottomLeadingRadius: 0,
                    bottomTrailingRadius: 0,
                    topTrailingRadius: 26,
                    style: .continuous
                )
            )

            HStack(alignment: .center, spacing: 16) {
                VStack(alignment: .leading, spacing: 7) {
                    HStack(spacing: 9) {
                        Image(systemName: mission.symbol).interfaceSymbol(size: 22).foregroundStyle(mission.color)
                        Text(mission.title).font(.title2.weight(.bold)).foregroundStyle(HeroTheme.ink)
                    }
                    Text(mission.summary).font(.body).foregroundStyle(HeroTheme.muted).lineLimit(2)
                }
                Spacer()
                Image(systemName: "arrow.right.circle.fill").interfaceSymbol(size: 38).foregroundStyle(mission.color)
            }
            .padding(22)
        }
        .frame(height: 320)
        .clipShape(RoundedRectangle(cornerRadius: 26, style: .continuous))
        .heroCard()
        .contentShape(RoundedRectangle(cornerRadius: 26))
    }
}
