import SwiftUI

enum MissionLibrary {
    static let missions: [Mission] = [
        Mission(
            id: "earthquake", title: "Earthquake", summary: "Drop, cover, and hold on.", symbol: "house.fill", illustrationName: "IllustrationEarthquake",
            color: Color(red: 0.96, green: 0.55, blue: 0.20),
            badge: HeroBadge(id: "steady-star", name: "Steady Star", symbol: "star.circle.fill", imageName: "BadgeEarthquake"),
            uniform: Uniform(id: "rescue", name: "Rescue Uniform", symbol: "cross.case.fill", imageName: "UniformRescue"),
            scenarios: [
                Scenario(id: "eq-1", story: "The room begins to shake. Books and toys wobble on the shelves.", prompt: "What should you do first?", symbol: "house.fill", imageName: "EarthquakeQuest1", choices: [
                    Choice(id: "eq-1-a", text: "Drop under a sturdy table", symbol: "arrow.down", isCorrect: true, feedback: "Great choice! Drop, cover your head and neck, and hold on until the shaking stops."),
                    Choice(id: "eq-1-b", text: "Run outside immediately", symbol: "figure.run", isCorrect: false, feedback: "Wait until the shaking stops. Running near glass and falling objects can be dangerous."),
                    Choice(id: "eq-1-c", text: "Stand beside a window", symbol: "window.vertical.closed", isCorrect: false, feedback: "Move away from windows because glass can break. Find cover instead.")
                ]),
                Scenario(id: "eq-2", story: "The shaking stops. A few things have fallen onto the floor.", prompt: "What is the safest next step?", symbol: "exclamationmark.triangle.fill", imageName: "EarthquakeQuest2", choices: [
                    Choice(id: "eq-2-a", text: "Follow an adult to an open area", symbol: "figure.walk", isCorrect: true, feedback: "Excellent! Watch for broken objects and move calmly to a clear open area."),
                    Choice(id: "eq-2-b", text: "Use the elevator", symbol: "arrow.up.arrow.down.square", isCorrect: false, feedback: "Elevators may lose power or be damaged. Use the stairs with a trusted adult."),
                    Choice(id: "eq-2-c", text: "Light a candle", symbol: "flame", isCorrect: false, feedback: "Never use a flame if gas may be leaking. Tell a trusted adult about unusual smells.")
                ])
            ]),
        Mission(
            id: "fire", title: "House Fire", summary: "Get low, get out, and stay out.", symbol: "flame.fill", illustrationName: "IllustrationFire",
            color: Color(red: 0.93, green: 0.27, blue: 0.24),
            badge: HeroBadge(id: "fire-fox", name: "Fire Fox", symbol: "flame.circle.fill", imageName: "BadgeFire"),
            uniform: Uniform(id: "firefighter", name: "Firefighter Uniform", symbol: "shield.lefthalf.filled", imageName: "UniformFirefighter"),
            scenarios: [
                Scenario(id: "fire-1", story: "The smoke alarm sounds and you see smoke coming under the door.", prompt: "How will you leave safely?", symbol: "smoke.fill", imageName: "FireQuest1", choices: [
                    Choice(id: "fire-1-a", text: "Stay low and use another exit", symbol: "figure.crawl", isCorrect: true, feedback: "Correct! Cleaner air is near the floor. Crawl low and use your second way out."),
                    Choice(id: "fire-1-b", text: "Hide in a closet", symbol: "door.left.hand.closed", isCorrect: false, feedback: "Never hide during a fire. Get outside so firefighters can find you safely."),
                    Choice(id: "fire-1-c", text: "Open the hot door", symbol: "hand.raised.fill", isCorrect: false, feedback: "A hot door can mean fire is behind it. Keep it closed and use another exit.")
                ]),
                Scenario(id: "fire-2", story: "You have reached the family meeting place outside.", prompt: "What should you do now?", symbol: "mappin.and.ellipse", imageName: "FireQuest2", choices: [
                    Choice(id: "fire-2-a", text: "Stay outside with your family", symbol: "person.2.fill", isCorrect: true, feedback: "Well done! Stay outside and let an adult call emergency services."),
                    Choice(id: "fire-2-b", text: "Go back for a toy", symbol: "teddybear.fill", isCorrect: false, feedback: "Never return to a burning building. Things can be replaced—you cannot."),
                    Choice(id: "fire-2-c", text: "Walk away alone", symbol: "figure.walk", isCorrect: false, feedback: "Stay at your meeting place so your family and firefighters know you are safe.")
                ])
            ]),
        Mission(
            id: "flood", title: "Flood", summary: "Stay high and stay dry.", symbol: "water.waves", illustrationName: "IllustrationFlood",
            color: Color(red: 0.14, green: 0.54, blue: 0.88),
            badge: HeroBadge(id: "river-ranger", name: "River Ranger", symbol: "drop.circle.fill", imageName: "BadgeFlood"),
            uniform: Uniform(id: "water-rescue", name: "Water Rescue Uniform", symbol: "sailboat.fill", imageName: "UniformFlood"),
            scenarios: [
                Scenario(id: "flood-1", story: "Rainwater covers the road ahead. It is hard to see how deep it is.", prompt: "What is the safe choice?", symbol: "car.fill", imageName: "FloodQuest1", choices: [
                    Choice(id: "flood-1-a", text: "Turn around and find higher ground", symbol: "arrow.uturn.backward", isCorrect: true, feedback: "Smart choice! Never walk, swim, or drive through floodwater."),
                    Choice(id: "flood-1-b", text: "Wade across slowly", symbol: "figure.walk", isCorrect: false, feedback: "Moving water can knock you down and hide dangerous objects. Stay out."),
                    Choice(id: "flood-1-c", text: "Play near the water", symbol: "beach.umbrella.fill", isCorrect: false, feedback: "Floodwater is not safe for play. Move away with a trusted adult.")
                ]),
                Scenario(id: "flood-2", story: "You are indoors with a trusted adult, but the water keeps rising.", prompt: "Where should you go?", symbol: "stairs", imageName: "FloodQuest2", choices: [
                    Choice(id: "flood-2-a", text: "Move to a higher floor", symbol: "arrow.up", isCorrect: true, feedback: "Yes! Take the emergency kit and move to a safe higher level."),
                    Choice(id: "flood-2-b", text: "Go to the basement", symbol: "arrow.down", isCorrect: false, feedback: "Water fills low places first. Move upward and listen for instructions."),
                    Choice(id: "flood-2-c", text: "Touch wet power cords", symbol: "bolt.fill", isCorrect: false, feedback: "Water and electricity are dangerous together. Stay away and tell an adult.")
                ])
            ]),
        Mission(
            id: "storm", title: "Severe Storm", summary: "Shelter away from windows.", symbol: "cloud.bolt.rain.fill", illustrationName: "IllustrationStorm",
            color: Color(red: 0.43, green: 0.35, blue: 0.78),
            badge: HeroBadge(id: "storm-shield", name: "Storm Shield", symbol: "shield.checkered", imageName: "BadgeStorm"),
            uniform: Uniform(id: "storm", name: "Storm Safety Uniform", symbol: "cloud.bolt.fill", imageName: "UniformStorm"),
            scenarios: [
                Scenario(id: "storm-1", story: "Thunder booms while you are playing outside.", prompt: "Where should you go?", symbol: "cloud.bolt.fill", imageName: "StormQuest1", choices: [
                    Choice(id: "storm-1-a", text: "Inside a sturdy building", symbol: "house.fill", isCorrect: true, feedback: "Exactly! When thunder roars, go indoors and stay away from windows."),
                    Choice(id: "storm-1-b", text: "Under a tall tree", symbol: "tree.fill", isCorrect: false, feedback: "Lightning can strike tall objects. Go inside a sturdy building."),
                    Choice(id: "storm-1-c", text: "Keep swimming", symbol: "figure.pool.swim", isCorrect: false, feedback: "Leave water immediately during a storm because water carries electricity.")
                ]),
                Scenario(id: "storm-2", story: "Strong wind rattles the windows of your home.", prompt: "Which place is safest?", symbol: "wind", imageName: "StormQuest2", choices: [
                    Choice(id: "storm-2-a", text: "An interior room downstairs", symbol: "shield.fill", isCorrect: true, feedback: "Great! Stay in a small interior room and protect your head."),
                    Choice(id: "storm-2-b", text: "Right beside a window", symbol: "window.vertical.open", isCorrect: false, feedback: "Strong wind can break glass. Move to an interior room away from windows."),
                    Choice(id: "storm-2-c", text: "Outside to take a photo", symbol: "camera.fill", isCorrect: false, feedback: "Stay sheltered. Lightning and flying debris make the outdoors dangerous.")
                ])
            ])
    ]
}
