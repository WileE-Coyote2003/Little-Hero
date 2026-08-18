import SwiftUI

struct CharacterView: View {
    let uniform: Uniform?
    var large = true

    var body: some View {
        ZStack {
            Circle().fill(LinearGradient(colors: [HeroTheme.accent.opacity(0.16), .cyan.opacity(0.08)], startPoint: .top, endPoint: .bottom))
            if let uniform {
                Image(uniform.imageName)
                    .resizable()
                    .scaledToFit()
                    .padding(large ? 12 : 8)
            } else {
                ArtworkPlaceholder(title: "Little Hero character")
                    .padding(large ? 36 : 22)
            }
        }
        .aspectRatio(1, contentMode: .fit)
        .accessibilityLabel(uniform.map { "Hero wearing \($0.name)" } ?? "Little Hero character")
    }
}
