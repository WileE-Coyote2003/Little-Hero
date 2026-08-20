import SwiftUI

struct ChoiceButton: View {
    let choice: Choice
    let selectedChoice: Choice?
    let color: Color
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack(spacing: 16) {
                Image(systemName: choice.symbol)
                    .interfaceSymbol(size: 23)
                    .frame(width: 52, height: 52)
                    .background(color.opacity(0.12), in: Circle())
                    .foregroundStyle(color)
                Text(choice.text).font(.title3.weight(.semibold)).multilineTextAlignment(.leading).foregroundStyle(HeroTheme.ink)
                Spacer()
                stateIcon
            }
            .padding(16)
            .frame(maxWidth: .infinity, minHeight: 82)
            .background(.white, in: RoundedRectangle(cornerRadius: 20))
            .overlay(RoundedRectangle(cornerRadius: 20).stroke(borderColor, lineWidth: selectedChoice == choice ? 3 : 1))
        }
        .buttonStyle(.plain)
        .disabled(selectedChoice != nil)
        .opacity(selectedChoice == nil || selectedChoice == choice ? 1 : 0.5)
    }

    @ViewBuilder private var stateIcon: some View {
        if let selectedChoice {
            if selectedChoice == choice {
                Image(systemName: choice.isCorrect ? "checkmark.circle.fill" : "xmark.circle.fill")
                    .interfaceSymbol(size: 30).foregroundStyle(choice.isCorrect ? .green : .red)
            } else { Image(systemName: "circle").interfaceSymbol(size: 22).foregroundStyle(HeroTheme.line) }
        } else { Image(systemName: "chevron.right").interfaceSymbol(size: 20).foregroundStyle(HeroTheme.muted) }
    }

    private var borderColor: Color {
        guard selectedChoice == choice else { return HeroTheme.line }
        return choice.isCorrect ? .green : .red
    }
}
