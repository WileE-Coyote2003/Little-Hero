import SwiftUI

struct HeroBadgeView: View {
    let badge: HeroBadge
    let color: Color
    let isUnlocked: Bool

    var body: some View {
        VStack(spacing: 18) {
            ZStack {
                if isUnlocked {
                    Image(badge.imageName)
                        .resizable()
                        .scaledToFit()
                        .padding(12)
                } else {
                    RoundedRectangle(cornerRadius: 22).fill(Color(.systemGray6))
                    Image(systemName: "lock.fill").interfaceSymbol(size: 44).foregroundStyle(HeroTheme.muted)
                }
            }.aspectRatio(1.15, contentMode: .fit)
            Text(badge.name).font(.title3.weight(.bold)).foregroundStyle(HeroTheme.ink)
            Text(isUnlocked ? "Earned" : "Complete the mission to unlock")
                .font(.subheadline).foregroundStyle(isUnlocked ? .green : HeroTheme.muted).multilineTextAlignment(.center)
        }
        .padding(22).frame(maxWidth: .infinity).heroCard()
    }
}
