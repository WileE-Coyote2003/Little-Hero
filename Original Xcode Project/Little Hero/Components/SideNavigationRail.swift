import SwiftUI

struct SideNavigationRail: View {
    @Binding var selection: AppSection

    var body: some View {
        VStack(spacing: 24) {
            Spacer()

            ForEach(AppSection.allCases) { section in
                Button { selection = section } label: {
                    VStack(spacing: 7) {
                        Image(systemName: section.symbol).interfaceSymbol(size: 24, weight: .semibold)
                        Text(section.rawValue).font(.caption2.weight(.semibold))
                    }
                    .foregroundStyle(selection == section ? .white : HeroTheme.muted)
                    .frame(width: 76, height: 72)
                    .background(selection == section ? HeroTheme.ink : Color.clear, in: RoundedRectangle(cornerRadius: 18, style: .continuous))
                }
                .buttonStyle(.plain)
                .accessibilityLabel(section.rawValue)
            }

            Spacer()
        }
        .padding(.vertical, 26)
        .frame(width: HeroTheme.railWidth)
        .background(.white)
        .overlay(alignment: .trailing) { Rectangle().fill(HeroTheme.line).frame(width: 1) }
    }
}
