import SwiftUI

enum HeroTheme {
    static let background = Color(red: 0.965, green: 0.972, blue: 0.985)
    static let surface = Color.white
    static let ink = Color(red: 0.11, green: 0.14, blue: 0.22)
    static let muted = Color(red: 0.42, green: 0.47, blue: 0.57)
    static let line = Color(red: 0.86, green: 0.88, blue: 0.92)
    static let accent = Color(red: 0.18, green: 0.42, blue: 0.91)
    static let railWidth: CGFloat = 104
    static let contentMaxWidth: CGFloat = 1180
}

extension View {
    func heroCard(cornerRadius: CGFloat = 26) -> some View {
        background(HeroTheme.surface, in: RoundedRectangle(cornerRadius: cornerRadius, style: .continuous))
            .overlay(RoundedRectangle(cornerRadius: cornerRadius, style: .continuous).stroke(HeroTheme.line, lineWidth: 1))
            .shadow(color: HeroTheme.ink.opacity(0.06), radius: 14, y: 7)
    }

    func interfaceSymbol(size: CGFloat = 22, weight: Font.Weight = .semibold) -> some View {
        font(.system(size: size, weight: weight))
            .symbolRenderingMode(.hierarchical)
    }
}
