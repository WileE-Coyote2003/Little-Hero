import SwiftUI
import Combine

enum AppRoute: Hashable {
    case missionIntroduction(Mission)
    case scenario(Mission)
}

@MainActor
final class AppRouter: ObservableObject {
    @Published var path = NavigationPath()

    func showMission(_ mission: Mission) {
        path.append(AppRoute.missionIntroduction(mission))
    }

    func startMission(_ mission: Mission) {
        path.append(AppRoute.scenario(mission))
    }

    func returnToMissions() {
        path = NavigationPath()
    }
}
