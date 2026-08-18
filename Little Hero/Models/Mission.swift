import SwiftUI

struct Mission: Identifiable, Hashable {
    let id: String
    let title: String
    let summary: String
    let symbol: String
    let illustrationName: String
    let color: Color
    let badge: HeroBadge
    let uniform: Uniform
    let scenarios: [Scenario]
}

struct Scenario: Identifiable, Hashable {
    let id: String
    let story: String
    let prompt: String
    let symbol: String
    var imageName: String? = nil
    let choices: [Choice]
}

struct Choice: Identifiable, Hashable {
    let id: String
    let text: String
    let symbol: String
    let isCorrect: Bool
    let feedback: String
}

struct HeroBadge: Identifiable, Hashable {
    let id: String
    let name: String
    let symbol: String
    let imageName: String
}

struct Uniform: Identifiable, Hashable {
    let id: String
    let name: String
    let symbol: String
    let imageName: String
}

enum AppSection: String, CaseIterable, Identifiable {
    case missions = "Missions"
    case uniforms = "Uniforms"
    case badges = "Badges"

    var id: String { rawValue }
    var symbol: String {
        switch self {
        case .missions: "map.fill"
        case .uniforms: "tshirt.fill"
        case .badges: "medal.fill"
        }
    }
}
