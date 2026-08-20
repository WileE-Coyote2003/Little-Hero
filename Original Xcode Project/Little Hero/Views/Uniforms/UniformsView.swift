import SwiftUI

struct UniformsView: View {
    @ObservedObject var progress: ProgressStore
    private let schoolUniform = Uniform(id: "school", name: "School Uniform", symbol: "backpack.fill", imageName: "UniformSchool")

    private var uniforms: [Uniform] { [schoolUniform] + MissionLibrary.missions.map(\.uniform) }
    private var equipped: Uniform? { uniforms.first { $0.id == progress.equippedUniformID } ?? schoolUniform }

    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack(alignment: .leading, spacing: 28) {
                    PageHeader(
                        eyebrow: "MY LITTLE HERO",
                        title: "Uniforms",
                        subtitle: "Choose an outfit earned from your completed safety missions."
                    )
                    HStack(alignment: .top, spacing: 34) {
                        VStack(spacing: 14) {
                            CharacterView(uniform: equipped)
                            Text("Little Hero").font(.title2.weight(.bold)).foregroundStyle(HeroTheme.ink)
                            Text(equipped?.name ?? schoolUniform.name).font(.headline).foregroundStyle(HeroTheme.muted)
                        }
                        .padding(28).frame(width: min(geometry.size.width * 0.34, 400)).heroCard()

                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                            ForEach(uniforms) { uniform in
                                UniformCard(
                                    uniform: uniform,
                                    unlocked: uniform.id == schoolUniform.id || progress.isUnlocked(uniform),
                                    selected: equipped?.id == uniform.id
                                ) {
                                    progress.equippedUniformID = uniform.id
                                }
                            }
                        }
                    }
                }
                .frame(maxWidth: HeroTheme.contentMaxWidth, alignment: .leading)
                .padding(.horizontal, 44).padding(.vertical, 38).frame(maxWidth: .infinity)
            }
        }
        .onAppear {
            if progress.equippedUniformID == nil { progress.equippedUniformID = schoolUniform.id }
        }
    }
}

private struct UniformCard: View {
    let uniform: Uniform
    let unlocked: Bool
    let selected: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            VStack(spacing: 15) {
                ZStack {
                    RoundedRectangle(cornerRadius: 20).fill(unlocked ? HeroTheme.accent.opacity(0.09) : Color(.systemGray6))
                    if unlocked {
                        Image(uniform.imageName)
                            .resizable()
                            .scaledToFit()
                            .padding(8)
                    } else {
                        Image(systemName: "lock.fill").interfaceSymbol(size: 38).foregroundStyle(HeroTheme.muted)
                    }
                }.aspectRatio(1.45, contentMode: .fit)
                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        Text(uniform.name).font(.headline).foregroundStyle(HeroTheme.ink)
                        Text(unlocked ? (selected ? "Wearing now" : "Tap to wear") : "Complete mission to unlock")
                            .font(.caption).foregroundStyle(selected ? .green : HeroTheme.muted)
                    }
                    Spacer()
                    if selected { Image(systemName: "checkmark.circle.fill").interfaceSymbol(size: 24).foregroundStyle(.green) }
                }
            }.padding(18)
        }
        .buttonStyle(.plain).disabled(!unlocked)
        .background(.white, in: RoundedRectangle(cornerRadius: 24))
        .overlay(RoundedRectangle(cornerRadius: 24).stroke(selected ? HeroTheme.accent : HeroTheme.line, lineWidth: selected ? 3 : 1))
        .opacity(unlocked ? 1 : 0.62)
    }
}
