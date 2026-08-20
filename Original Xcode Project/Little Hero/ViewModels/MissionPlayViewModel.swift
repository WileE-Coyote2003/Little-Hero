import Foundation
import Combine

@MainActor
final class MissionPlayViewModel: ObservableObject {
    let mission: Mission
    @Published private(set) var scenarioIndex = 0
    @Published private(set) var selectedChoice: Choice?
    @Published private(set) var correctAnswers = 0
    @Published private(set) var isComplete = false

    init(mission: Mission) { self.mission = mission }
    var scenario: Scenario { mission.scenarios[scenarioIndex] }
    var progress: Double { Double(scenarioIndex + 1) / Double(mission.scenarios.count) }

    func choose(_ choice: Choice) {
        guard selectedChoice == nil else { return }
        selectedChoice = choice
        if choice.isCorrect { correctAnswers += 1 }
    }

    func continueStory() {
        if scenarioIndex + 1 < mission.scenarios.count {
            scenarioIndex += 1
            selectedChoice = nil
        } else {
            isComplete = true
        }
    }

    func retryScenario() {
        selectedChoice = nil
    }
}
