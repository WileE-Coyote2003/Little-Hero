import Foundation
import Combine

@MainActor
final class ProgressStore: ObservableObject {
    @Published private(set) var completedMissionIDs: Set<String>
    @Published var equippedUniformID: String? {
        didSet { defaults.set(equippedUniformID, forKey: Keys.equippedUniform) }
    }

    private let defaults: UserDefaults
    private enum Keys {
        static let completedMissions = "littleHero.completedMissions"
        static let equippedUniform = "littleHero.equippedUniform"
    }

    init(defaults: UserDefaults = .standard) {
        self.defaults = defaults
        completedMissionIDs = Set(defaults.stringArray(forKey: Keys.completedMissions) ?? [])
        equippedUniformID = defaults.string(forKey: Keys.equippedUniform)
    }

    func complete(_ mission: Mission) {
        completedMissionIDs.insert(mission.id)
        defaults.set(Array(completedMissionIDs), forKey: Keys.completedMissions)
        if equippedUniformID == nil { equippedUniformID = mission.uniform.id }
    }

    func isComplete(_ mission: Mission) -> Bool { completedMissionIDs.contains(mission.id) }
    func isUnlocked(_ uniform: Uniform) -> Bool {
        uniform.id == "school" || MissionLibrary.missions.contains { $0.uniform == uniform && isComplete($0) }
    }
}
