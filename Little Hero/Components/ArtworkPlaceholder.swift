import SwiftUI

/// Replace with the matching custom artwork in Assets.xcassets when it is ready.
struct ArtworkPlaceholder: View {
    let title: String
    var tint: Color = HeroTheme.accent

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 24, style: .continuous)
                .fill(tint.opacity(0.08))
            RoundedRectangle(cornerRadius: 24, style: .continuous)
                .stroke(tint.opacity(0.28), style: StrokeStyle(lineWidth: 2, dash: [9, 7]))
            VStack(spacing: 8) {
                Text(title).font(.headline).foregroundStyle(HeroTheme.ink)
                Text("Custom artwork placeholder").font(.caption).foregroundStyle(HeroTheme.muted)
            }.multilineTextAlignment(.center).padding()
        }
        .accessibilityLabel("\(title) artwork placeholder")
    }
}
