import SwiftUI

struct MissionCompleteView: View {
    let mission: Mission
    let score: Int
    @ObservedObject var progress: ProgressStore
    @EnvironmentObject private var router: AppRouter

    var body: some View {
        HStack(spacing: 56) {
            Image(mission.badge.imageName)
                .resizable()
                .scaledToFit()
                .frame(maxWidth: 430)
                .aspectRatio(1, contentMode: .fit)
                .accessibilityLabel("\(mission.badge.name) badge reward")
            VStack(alignment: .leading, spacing: 22) {
                Text("MISSION COMPLETE").font(.headline.weight(.heavy)).tracking(1.5).foregroundStyle(mission.color)
                Text("You did it, Hero!").font(.system(size: 48, weight: .bold, design: .rounded)).foregroundStyle(HeroTheme.ink)
                Text("You earned the \(mission.badge.name) badge and unlocked the \(mission.uniform.name).")
                    .font(.title2).foregroundStyle(HeroTheme.muted).lineSpacing(5)
                Label("\(score) of \(mission.scenarios.count) safe choices", systemImage: "checkmark.circle.fill")
                    .font(.title3.weight(.bold)).foregroundStyle(.green)
                Text("A real hero stays calm, finds a trusted adult, and follows the safety plan.")
                    .font(.title3).padding(20).background(.yellow.opacity(0.14), in: RoundedRectangle(cornerRadius: 20))
                Spacer()
                Button { router.returnToMissions() } label: {
                    Label("Choose Another Mission", systemImage: "map.fill").font(.title3.bold()).frame(maxWidth: .infinity, minHeight: 60)
                        .foregroundStyle(.white).background(mission.color, in: RoundedRectangle(cornerRadius: 18))
                }.buttonStyle(.plain)
            }.frame(maxWidth: 560, alignment: .leading)
        }
        .padding(54).frame(maxWidth: .infinity, maxHeight: .infinity).background(HeroTheme.background)
        .navigationBarBackButtonHidden()
    }
}
