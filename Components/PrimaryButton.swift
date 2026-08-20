import SwiftUI

struct PrimaryButton: View {
    let title: String
    var systemImage: String = "arrow.right"
    var color: Color = HeroTheme.accent
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Label(title, systemImage: systemImage)
                .font(.title3.weight(.bold))
                .frame(maxWidth: .infinity, minHeight: 58)
        }
        .buttonStyle(.plain)
        .foregroundStyle(.white)
        .background(color, in: RoundedRectangle(cornerRadius: 18, style: .continuous))
        .contentShape(RoundedRectangle(cornerRadius: 18))
    }
}
