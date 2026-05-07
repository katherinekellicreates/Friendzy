//
//  ActivityData.swift
//  Friensy
//
//  Created by Katherine Pizzirusso on 4/22/26.
//

import Foundation

enum Season: String {
    case winter
    case spring
    case summer
    case fall
}

enum LocationRequirement {
    case indoor
    case outdoor
    case flexible
}

enum EnergyLevel {
    case lowest
    case low
    case medium
    case high
}

enum PriceLevel {
    case free
    case low
    case medium
    case high
}

//model
struct Activity {
    let name: String
    let minPeople: Int
    let isDate: Bool
    let locationRequirement: LocationRequirement
    let goOut: Bool
    
    let types: Set<ActivityType>
    let energyLevel: EnergyLevel
    let priceLevel: PriceLevel
    let requiresFocus: Bool
    
    let seasons: [Season]
    
}

struct ActivityData {
    
    static let allActivities: [Activity] = [
        
        //////////////////////////////////////////////////////////////////////////
        ////////////////////////////////!STAY IN!/////////////////////////////////
        //////////////////////////////////////////////////////////////////////////
        
        Activity(
            name: "Movie night",
            minPeople: 1,
            isDate: true,
            locationRequirement: .indoor,
            goOut: false,
            types: [.entertainment, .chill],
            energyLevel: .lowest,
            priceLevel: .free,
            requiresFocus: false,
            seasons: [.winter, .spring, .summer, .fall]
        ),
        
        Activity(
            name: "Monopoly",
            minPeople: 4,
            isDate: false,
            locationRequirement: .indoor,
            goOut: false,
            types: [.entertainment, .social],
            energyLevel: .medium,
            priceLevel: .free,
            requiresFocus: false,
            seasons: [.winter, .spring, .summer, .fall]
        ),
        
        Activity(
            name: "Scrabble",
            minPeople: 2,
            isDate: false,
            locationRequirement: .indoor,
            goOut: false,
            types: [.social],
            energyLevel: .medium,
            priceLevel: .free,
            requiresFocus: true,
            seasons: [.winter, .spring, .summer, .fall]
        ),
        
        Activity(
            name: "Binge Night",
            minPeople: 1,
            isDate: false,
            locationRequirement: .indoor,
            goOut: false,
            types: [.entertainment],
            energyLevel: .low,
            priceLevel: .free,
            requiresFocus: false,
            seasons: [.winter, .spring, .summer, .fall]
        ),
        
        Activity(
            name: "Card Games",
            minPeople: 3,
            isDate: false,
            locationRequirement: .indoor,
            goOut: false,
            types: [.social],
            energyLevel: .medium,
            priceLevel: .free,
            requiresFocus: false,
            seasons: [.winter, .spring, .summer, .fall]
        ),
        
        Activity(
            name: "Board games",
            minPeople: 2,
            isDate: false,
            locationRequirement: .indoor,
            goOut: false,
            types: [.social,.chill],
            energyLevel: .low,
            priceLevel: .free,
            requiresFocus: false,
            seasons: [.winter, .spring, .summer, .fall]
        ),
        
        Activity(
            name: "Puzzles",
            minPeople: 1,
            isDate: false,
            locationRequirement: .indoor,
            goOut: false,
            types: [.social],
            energyLevel: .low,
            priceLevel: .free,
            requiresFocus: true,
            seasons: [.winter, .spring, .summer, .fall]
        ),
        
        Activity(
            name: "Minecraft",
            minPeople: 1,
            isDate: false,
            locationRequirement: .indoor,
            goOut: false,
            types: [.gaming, .entertainment, .social],
            energyLevel: .lowest,
            priceLevel: .free,
            requiresFocus: false,
            seasons: [.winter, .spring, .summer, .fall]
        ),
        
        Activity(
            name: "Roblox",
            minPeople: 1,
            isDate: false,
            locationRequirement: .indoor,
            goOut: false,
            types: [.gaming, .entertainment, .social],
            energyLevel: .lowest,
            priceLevel: .free,
            requiresFocus: false,
            seasons: [.winter, .spring, .summer, .fall]
        ),
        
        Activity(
            name: "Call of Duty",
            minPeople: 1,
            isDate: false,
            locationRequirement: .indoor,
            goOut: false,
            types: [.gaming, .entertainment, .social],
            energyLevel: .low,
            priceLevel: .low,
            requiresFocus: false,
            seasons: [.winter, .spring, .summer, .fall]
        ),
        
        Activity(
            name: "Poker",
            minPeople: 4,
            isDate: false,
            locationRequirement: .indoor,
            goOut: false,
            types: [.social],
            energyLevel: .medium,
            priceLevel: .medium,
            requiresFocus: false,
            seasons: [.winter, .spring, .summer, .fall]
        ),
        Activity(
            name: "Bake Something",
            minPeople: 1,
            isDate: false,
            locationRequirement: .indoor,
            goOut: false,
            types: [.food ],
            energyLevel: .low,
            priceLevel: .low,
            requiresFocus: false,
            seasons: [.winter, .spring, .summer, .fall]
            
        ),
        
        Activity(
            name: "Read a book",
            minPeople: 1,
            isDate: false,
            locationRequirement: .indoor,
            goOut: false,
            types: [.chill,.productive],
            energyLevel: .low,
            priceLevel: .low,
            requiresFocus: true,
            seasons: [.winter, .spring, .summer, .fall]
            
        ),
        //////////////////////////////////////////////////////////////////////////
        
        
        //////////////////////////////////////////////////////////////////////////
        /////////////////////////////////!OUTDOOR!////////////////////////////////
        //////////////////////////////////////////////////////////////////////////
        
        Activity(
            name: "Hiking",
            minPeople: 1,
            isDate: true,
            locationRequirement: .outdoor,
            goOut: true,
            types: [.active, .experiences],
            energyLevel: .high,
            priceLevel: .free,
            requiresFocus: false,
            seasons: [.spring, .summer, .fall]
        ),
        
        Activity(
            name: "Picnic",
            minPeople: 2,
            isDate: true,
            locationRequirement: .indoor,
            goOut: true,
            types: [.food, .social],
            energyLevel: .medium,
            priceLevel: .free,
            requiresFocus: false,
            seasons: [.winter, .spring, .summer, .fall]
        ),
        
        
        Activity(
            name: "Mini golf",
            minPeople: 2,
            isDate: true,
            locationRequirement: .outdoor,
            goOut: true,
            types: [.entertainment],
            energyLevel: .medium,
            priceLevel: .medium,
            requiresFocus: false,
            seasons: [.spring, .summer, .fall]
        ),
        
        Activity(
            name: "Amusement Park",
            minPeople: 2,
            isDate: true,
            locationRequirement: .outdoor,
            goOut: true,
            types: [.social, .experiences],
            energyLevel: .high,
            priceLevel: .high,
            requiresFocus: false,
            seasons: [.spring, .summer, .fall]
        ),
        
        Activity(
            name: "Roller Skating",
            minPeople: 2,
            isDate: true,
            locationRequirement: .outdoor,
            goOut: true,
            types: [.social, .active],
            energyLevel: .high,
            priceLevel: .high,
            requiresFocus: false,
            seasons: [.winter, .spring, .summer, .fall]
        ),
        
        Activity(
            name: "Ice Skating",
            minPeople: 2,
            isDate: true,
            locationRequirement: .outdoor,
            goOut: true,
            types: [.social, .active],
            energyLevel: .high,
            priceLevel: .medium,
            requiresFocus: false,
            seasons: [.winter]
        ),
        
        Activity(
            name: "Festival",
            minPeople: 2,
            isDate: true,
            locationRequirement: .outdoor,
            goOut: true,
            types: [.social, .entertainment],
            energyLevel: .high,
            priceLevel: .high,
            requiresFocus: false,
            seasons: [.winter, .spring, .summer, .fall]
        ),
        
        Activity(
            name: "Zoo",
            minPeople: 2,
            isDate: true,
            locationRequirement: .outdoor,
            goOut: true,
            types: [.social],
            energyLevel: .medium,
            priceLevel: .medium,
            requiresFocus: false,
            seasons: [.winter, .spring, .summer, .fall]
        ),
        
        Activity(
            name: "Nature Walk",
            minPeople: 1,
            isDate: false,
            locationRequirement: .outdoor,
            goOut: true,
            types: [.spontaneous,.active],
            energyLevel: .medium,
            priceLevel: .free,
            requiresFocus: false,
            seasons: [.winter, .spring, .summer, .fall]
        ),
        
        Activity(
            name: "Beach Day",
            minPeople: 2,
            isDate: false,
            locationRequirement: .outdoor,
            goOut: true,
            types: [.social],
            energyLevel: .medium,
            priceLevel: .free,
            requiresFocus: false,
            seasons: [.spring, .summer]
        ),
        
        //////////////////////////////////////////////////////////////////////////
        
       
        //////////////////////////////////////////////////////////////////////////
        ////////////////////////////////!FLEXIBLE!////////////////////////////////
        //////////////////////////////////////////////////////////////////////////
        
        Activity(
            name: "People watching",
            minPeople: 2,
            isDate: true,
            locationRequirement: .flexible,
            goOut: true,
            types: [.spontaneous],
            energyLevel: .lowest,
            priceLevel: .free,
            requiresFocus: false,
            seasons: [.winter, .spring, .summer, .fall]
        ),
        
        Activity(
            name: "Karaoke",
            minPeople: 2,
            isDate: true,
            locationRequirement: .indoor,
            goOut: false,
            types: [.social,.music],
            energyLevel: .medium,
            priceLevel: .high,
            requiresFocus: false,
            seasons: [.winter, .spring, .summer, .fall]
        ),
        
        Activity(
            name: "Painting",
            minPeople: 1,
            isDate: true,
            locationRequirement: .flexible,
            goOut: false,
            types: [.creative],
            energyLevel: .medium,
            priceLevel: .medium,
            requiresFocus: false,
            seasons: [.winter, .spring, .summer, .fall]
        ),
        
        Activity(
            name: "Concert",
            minPeople: 2,
            isDate: false,
            locationRequirement: .outdoor,
            goOut: true,
            types: [.music,.creative],
            energyLevel: .high,
            priceLevel: .high,
            requiresFocus: false,
            seasons: [.winter, .spring, .summer, .fall]
        ),
        
        Activity(
            name: "Go To a Sports Game",
            minPeople: 2,
            isDate: true,
            locationRequirement: .indoor,
            goOut: true,
            types: [.sports, .social],
            energyLevel: .medium,
            priceLevel: .high,
            requiresFocus: false,
            seasons: [.winter, .spring, .summer, .fall]
        ),
        
        Activity(
            name: "Watch the sunset",
            minPeople: 2,
            isDate: true,
            locationRequirement: .indoor,
            goOut: true,
            types: [.social],
            energyLevel: .low,
            priceLevel: .free,
            requiresFocus: false,
            seasons: [.spring, .summer, .fall]
        ),
        
        //////////////////////////////////////////////////////////////////////////
        
        
        //////////////////////////////////////////////////////////////////////////
        /////////////////////////////!GO OUT - INDOOR!////////////////////////////
        //////////////////////////////////////////////////////////////////////////
        
        Activity(
            name: "Bowling",
            minPeople: 2,
            isDate: true,
            locationRequirement: .indoor,
            goOut: true,
            types: [.sports, .entertainment],
            energyLevel: .medium,
            priceLevel: .medium,
            requiresFocus: false,
            seasons: [.winter, .spring, .summer, .fall]
        ),
        
        Activity(
            name: "Museum",
            minPeople: 2,
            isDate: true,
            locationRequirement: .indoor,
            goOut: true,
            types: [.experiences,.creative],
            energyLevel: .medium,
            priceLevel: .medium,
            requiresFocus: false,
            seasons: [.winter, .spring, .summer, .fall]
        ),
        
        Activity(
            name: "Aquarium",
            minPeople: 2,
            isDate: true,
            locationRequirement: .indoor,
            goOut: true,
            types: [.experiences],
            energyLevel: .medium,
            priceLevel: .high,
            requiresFocus: false,
            seasons: [.winter, .spring, .summer, .fall]
        ),
        
        Activity(
            name: "Workout",
            minPeople: 1,
            isDate: false,
            locationRequirement: .indoor,
            goOut: true,
            types: [.active],
            energyLevel: .high,
            priceLevel: .medium,
            requiresFocus: true,
            seasons: [.winter, .spring, .summer, .fall]
        ),
        
        Activity(
            name: "Thrift Shopping",
            minPeople: 1,
            isDate: true,
            locationRequirement: .indoor,
            goOut: true,
            types: [.shopping],
            energyLevel: .high,
            priceLevel: .medium,
            requiresFocus: false,
            seasons: [.winter, .spring, .summer, .fall]
        ),
        
        Activity(
            name: "Bookstore Shopping",
            minPeople: 1,
            isDate: true,
            locationRequirement: .indoor,
            goOut: true,
            types: [.shopping],
            energyLevel: .medium,
            priceLevel: .medium,
            requiresFocus: false,
            seasons: [.winter, .spring, .summer, .fall]
        ),
        
        Activity(
            name: "Arcade",
            minPeople: 2,
            isDate: true,
            locationRequirement: .indoor,
            goOut: true,
            types: [.gaming],
            energyLevel: .low,
            priceLevel: .medium,
            requiresFocus: false,
            seasons: [.winter, .spring, .summer, .fall]
        ),
       
        Activity(
            name: "Coffee Run",
            minPeople: 2,
            isDate: false,
            locationRequirement: .indoor,
            goOut: true,
            types: [.food],
            energyLevel: .low,
            priceLevel: .medium,
            requiresFocus: false,
            seasons: [.winter, .spring, .summer, .fall]
        ),
        
        Activity(
            name: "Escape room",
            minPeople: 2,
            isDate: true,
            locationRequirement: .indoor,
            goOut: true,
            types: [.experiences,.problemsolving,.social],
            energyLevel: .medium,
            priceLevel: .medium,
            requiresFocus: true,
            seasons: [.winter, .spring, .summer, .fall]
        ),
        Activity(
            name: "Laser tag",
            minPeople: 4,
            isDate: true,
            locationRequirement: .indoor,
            goOut: true,
            types: [.experiences],
            energyLevel: .high,
            priceLevel: .medium,
            requiresFocus: false,
            seasons: [.winter, .spring, .summer, .fall]
        )
    ]
    

    //////////////////////////////////////////////////////////////////////////////
    
    static func generateIdeas(from state: AppState) -> [Activity] {
        
        var results: [(Activity, Int)] = []
        
        for activity in allActivities {
            
            
            
            if state.goOut {
                if activity.locationRequirement != state.selectedLocation &&
                    activity.locationRequirement != .flexible {
                    continue
                }
            }
            
            if !state.selectedTypes.isEmpty &&
               state.selectedTypes.allSatisfy({ !activity.types.contains($0) }) {
                continue
            }
            
            guard activity.seasons.contains(state.currentSeason) else { continue }
            guard state.number >= activity.minPeople else { continue }
            guard !state.isDate || activity.isDate else { continue }
            guard activity.goOut == state.goOut else { continue }
            
            var score = 0
            var matchedTypes = 0


            // TYPE MATCHING
            for type in state.selectedTypes {
                if activity.types.contains(type) {
                    matchedTypes += 1
                }
            }


            // BIG reward for matching selected vibes
            score += matchedTypes * 10


            // Penalty if nothing matched
            if !state.selectedTypes.isEmpty && matchedTypes == 0 {
                score -= 15
            }


            // Bonus if activity is flexible
            if activity.locationRequirement == .flexible {
                score += 2
            }


            // Better people fit bonus
            let extraPeople = state.number - activity.minPeople

            if extraPeople == 0 {
                score += 4
            }
            else if extraPeople <= 2 {
                score += 2
            }


            // Slight bonus for cheaper activities
            switch activity.priceLevel {
            case .free:
                score += 3
            case .low:
                score += 2
            case .medium:
                score += 1
            case .high:
                score += 0
            }


            // Slight bonus for lower energy
            switch activity.energyLevel {
            case .lowest:
                score += 3
            case .low:
                score += 2
            case .medium:
                score += 1
            case .high:
                score += 0
            }


            // Slight penalty for focus-heavy activities
            if activity.requiresFocus {
                score -= 2
            }
            results.append((activity, score))
        }
        
        return results
            .sorted { $0.1 > $1.1 }
            .map { $0.0 }
    }
}

extension EnergyLevel {
    var emoji: String {
        switch self {
        case .lowest: return "⚡️"
        case .low: return "⚡️⚡️"
        case .medium: return "⚡️⚡️⚡️"
        case .high: return "⚡️⚡️⚡️⚡️"
        }
    }
}
extension PriceLevel {
    var display: String {
        switch self {
        case .free: return "Free"
        case .low: return "$"
        case .medium: return "$$"
        case .high: return "$$$"
        }
    }
}
