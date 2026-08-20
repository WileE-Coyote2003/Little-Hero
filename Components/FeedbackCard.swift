import SwiftUI

struct FeedbackCard: View {
    let choice: Choice

    var body: some View {
        HStack(alignment: .top, spacing: 16) {
            Image(systemName: choice.isCorrect ? "checkmark.circle.fill" : "xmark.circle.fill")
                .interfaceSymbol(size: 30, weight: .semibold)
            VStack(alignment: .leading, spacing: 6) {
                Text(choice.isCorrect ? "Safe choice!" : "Let’s learn from that")
                    .font(.title3.weight(.bold))
                Text(choice.feedback).font(.body).foregroundStyle(HeroTheme.ink)
            }
        }
        .foregroundStyle(choice.isCorrect ? Color.green : Color.orange)
        .padding(20).frame(maxWidth: .infinity, alignment: .leading)
        .background((choice.isCorrect ? Color.green : Color.orange).opacity(0.11), in: RoundedRectangle(cornerRadius: 20))
    }
}
