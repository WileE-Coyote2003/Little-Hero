import SwiftUI

struct AppRootView: View {
    @StateObject private var progress = ProgressStore()
    @StateObject private var router = AppRouter()
    @State private var section: AppSection = .missions

    var body: some View {
        NavigationStack(path: $router.path) {
            HStack(spacing: 0) {
                SideNavigationRail(selection: $section)
                Group {
                    switch section {
                    case .missions: MissionsView(progress: progress)
                    case .uniforms: UniformsView(progress: progress)
                    case .badges: BadgesView(progress: progress)
                    }
                }
                .id(section)
                .transition(.opacity)
            }
            .background(HeroTheme.background)
            .animation(.easeInOut(duration: 0.18), value: section)
            .toolbar(.hidden, for: .navigationBar)
            .navigationDestination(for: AppRoute.self) { route in
                switch route {
                case .missionIntroduction(let mission):
                    MissionIntroView(mission: mission, progress: progress)
                case .scenario(let mission):
                    ScenarioView(mission: mission, progress: progress)
                }
            }
        }
        .environmentObject(router)
        .tint(HeroTheme.accent)
        .preferredColorScheme(.light)
    }
}

struct AppRootView_Previews: PreviewProvider {
    static var previews: some View {
        AppRootView().previewInterfaceOrientation(.landscapeLeft)
    }
}
