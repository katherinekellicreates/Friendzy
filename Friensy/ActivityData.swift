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
    
    let types: Set<String>
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
            types: ["Entertainment", "Food & Drinks", "Chill"],
            energyLevel: .lowest,
            priceLevel: .free,
            requiresFocus: false,
            seasons: [.winter, .spring, .summer, .fall]
        ),
        
        Activity(
            name: "Monopoly",
            minPeople: 2,
            isDate: true,
            locationRequirement: .indoor,
            goOut: false,
            types: ["Entertainment","Social","Goofy"],
            energyLevel: .medium,
            priceLevel: .free,
            requiresFocus: true,
            seasons: [.winter, .spring, .summer, .fall]
        ),
        
        Activity(
            name: "Scrabble",
            minPeople: 2,
            isDate: true,
            locationRequirement: .indoor,
            goOut: false,
            types: ["Entertainment", "Social", "Brain"],
            energyLevel: .medium,
            priceLevel: .free,
            requiresFocus: true,
            seasons: [.winter, .spring, .summer, .fall]
        ),
        
        Activity(
            name: "Binge Night",
            minPeople: 1,
            isDate: true,
            locationRequirement: .indoor,
            goOut: false,
            types: ["Goofy","Social","Enertainment"],
            energyLevel: .low,
            priceLevel: .free,
            requiresFocus: false,
            seasons: [.winter, .spring, .summer, .fall]
        ),
        
        Activity(
            name: "Card Games",
            minPeople: 2,
            isDate: true,
            locationRequirement: .indoor,
            goOut: false,
            types: ["Experiences","Brain"],
            energyLevel: .medium,
            priceLevel: .free,
            requiresFocus: true,
            seasons: [.winter, .spring, .summer, .fall]
        ),
        
        Activity(
            name: "Board games",
            minPeople: 2,
            isDate: true,
            locationRequirement: .indoor,
            goOut: false,
            types: ["Social", "Food & Drinks","Chill"],
            energyLevel: .low,
            priceLevel: .free,
            requiresFocus: false,
            seasons: [.winter, .spring, .summer, .fall]
        ),
        
        Activity(
            name: "Puzzles",
            minPeople: 1,
            isDate: true,
            locationRequirement: .indoor,
            goOut: false,
            types: ["Social", "Food & Drinks","Chill"],
            energyLevel: .low,
            priceLevel: .free,
            requiresFocus: true,
            seasons: [.winter, .spring, .summer, .fall]
        ),
        
        Activity(
            name: "Minecraft",
            minPeople: 1,
            isDate: true,
            locationRequirement: .indoor,
            goOut: false,
            types: ["Gaming","Entertainment","Fun","Social"],
            energyLevel: .lowest,
            priceLevel: .free,
            requiresFocus: false,
            seasons: [.winter, .spring, .summer, .fall]
        ),
        
        Activity(
            name: "Roblox",
            minPeople: 1,
            isDate: true,
            locationRequirement: .indoor,
            goOut: false,
            types: ["Gaming","Entertainment","Fun","Social"],
            energyLevel: .lowest,
            priceLevel: .free,
            requiresFocus: false,
            seasons: [.winter, .spring, .summer, .fall]
        ),
        
        Activity(
            name: "Call of Duty",
            minPeople: 1,
            isDate: true,
            locationRequirement: .indoor,
            goOut: false,
            types: ["Gaming","Entertainment","Fun","Social"],
            energyLevel: .low,
            priceLevel: .low,
            requiresFocus: false,
            seasons: [.winter, .spring, .summer, .fall]
        ),
        
        Activity(
            name: "Bake Something",
            minPeople: 1,
            isDate: true,
            locationRequirement: .indoor,
            goOut: false,
            types: ["Creativity","Food & Drinks","Fun","Social"],
            energyLevel: .low,
            priceLevel: .low,
            requiresFocus: false,
            seasons: [.winter, .spring, .summer, .fall]
            
            ),
        
        Activity(
            name: "Read a book",
            minPeople: 1,
            isDate: true,
            locationRequirement: .indoor,
            goOut: false,
            types: ["Chill","Study/Productive"],
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
            types: ["Sports & Fitness", "Experiences"],
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
            types: ["Goofy","Food & Drinks", "Social", "Artsy/Creativity"],
            energyLevel: .medium,
            priceLevel: .free,
            requiresFocus: false,
            seasons: [.winter, .spring, .summer, .fall]
        ),
        
        Activity(
            name: "Concert",
            minPeople: 2,
            isDate: true,
            locationRequirement: .outdoor,
            goOut: true,
            types: ["Social","Music","Artsy/Creativity"],
            energyLevel: .high,
            priceLevel: .high,
            requiresFocus: true,
            seasons: [.winter, .spring, .summer, .fall]
        ),
        
        Activity(
            name: "Mini golf",
            minPeople: 2,
            isDate: true,
            locationRequirement: .outdoor,
            goOut: true,
            types: ["Sports & Fitness", "Entertainment"],
            energyLevel: .medium,
            priceLevel: .medium,
            requiresFocus: false,
            seasons: [.spring, .summer, .fall]
        ),
        
        Activity(
            name: "Go to a Sports Game",
            minPeople: 2,
            isDate: true,
            locationRequirement: .outdoor,
            goOut: true,
            types: ["Sports & Fitness","Social"],
            energyLevel: .medium,
            priceLevel: .high,
            requiresFocus: true,
            seasons: [.winter, .spring, .summer, .fall]
        ),
        
        Activity(
            name: "Amusement Park",
            minPeople: 2,
            isDate: true,
            locationRequirement: .outdoor,
            goOut: true,
            types: ["Social", "Experiences","Fun","Food & Drinks"],
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
            types: ["Social", "Sports & Fitness"],
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
            types: ["Social", "Sports & Fitness"],
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
            types: ["Food & Drinks", "Artsy/Creativity", "Social", "Adventure", "Goofy"],
            energyLevel: .high,
            priceLevel: .high,
            requiresFocus: true,
            seasons: [.winter, .spring, .summer, .fall]
        ),
        
        Activity(
            name: "Zoo",
            minPeople: 2,
            isDate: true,
            locationRequirement: .outdoor,
            goOut: true,
            types: ["Social","Goofy"],
            energyLevel: .medium,
            priceLevel: .medium,
            requiresFocus: true,
            seasons: [.winter, .spring, .summer, .fall]
        ),
        
        Activity(
            name: "Nature Walk",
            minPeople: 1,
            isDate: true,
            locationRequirement: .outdoor,
            goOut: true,
            types: ["Adventure","Spontaneous","Sports & Fitness"],
            energyLevel: .medium,
            priceLevel: .free,
            requiresFocus: true,
            seasons: [.winter, .spring, .summer, .fall]
        ),
        
        Activity(
            name: "Beach Day",
            minPeople: 2,
            isDate: true,
            locationRequirement: .outdoor,
            goOut: true,
            types: ["Social","Fun","Food & Drinks"],
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
            types: ["Spontaneous", "Fun", "Silly"],
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
            goOut: true,
            types: ["Social","Music","Goofy"],
            energyLevel: .medium,
            priceLevel: .high,
            requiresFocus: true,
            seasons: [.winter, .spring, .summer, .fall]
        ),
        
        Activity(
            name: "Painting",
            minPeople: 1,
            isDate: true,
            locationRequirement: .flexible,
            goOut: false,
            types: ["Creativity", "Fun"],
            energyLevel: .medium,
            priceLevel: .medium,
            requiresFocus: false,
            seasons: [.winter, .spring, .summer, .fall]
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
            types: ["Sports & Fitness", "Entertainment"],
            energyLevel: .medium,
            priceLevel: .medium,
            requiresFocus: false,
            seasons: [.winter, .spring, .summer, .fall]
        ),
        
        Activity(
            name: "Poker",
            minPeople: 2,
            isDate: true,
            locationRequirement: .indoor,
            goOut: true,
            types: ["Experiences", "Social", "Entertainment"],
            energyLevel: .medium,
            priceLevel: .medium,
            requiresFocus: true,
            seasons: [.winter, .spring, .summer, .fall]
        ),
        
        Activity(
            name: "Museum",
            minPeople: 2,
            isDate: true,
            locationRequirement: .indoor,
            goOut: true,
            types: ["Experiences","Artsy/Creativity"],
            energyLevel: .medium,
            priceLevel: .medium,
            requiresFocus: true,
            seasons: [.winter, .spring, .summer, .fall]
        ),
        
        Activity(
            name: "Aquarium",
            minPeople: 2,
            isDate: true,
            locationRequirement: .indoor,
            goOut: true,
            types: ["Adventure","Artys/Creativity"],
            energyLevel: .medium,
            priceLevel: .high,
            requiresFocus: true,
            seasons: [.winter, .spring, .summer, .fall]
        ),
        
        Activity(
            name: "Concert",
            minPeople: 2,
            isDate: true,
            locationRequirement: .indoor,
            goOut: true,
            types: ["Social","Music","Artsy/Creativity"],
            energyLevel: .high,
            priceLevel: .high,
            requiresFocus: true,
            seasons: [.winter, .spring, .summer, .fall]
        ),
        
        Activity(
            name: "Go To a Sports Game",
            minPeople: 2,
            isDate: true,
            locationRequirement: .indoor,
            goOut: true,
            types: ["Sports & Fitness", "Social"],
            energyLevel: .medium,
            priceLevel: .high,
            requiresFocus: true,
            seasons: [.winter, .spring, .summer, .fall]
        ),
        
        Activity(
            name: "Workout",
            minPeople: 1,
            isDate: true,
            locationRequirement: .indoor,
            goOut: true,
            types: ["Experiences","Adventure","Sports & Fitness"],
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
            types: ["Social", "Shopping","Fun"],
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
            types: ["Study/Productive", "Entertainment"],
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
            types: ["Entertainment", "Fun","Food & Drinks"],
            energyLevel: .low,
            priceLevel: .medium,
            requiresFocus: false,
            seasons: [.winter, .spring, .summer, .fall]
        ),
       
        Activity(
            name: "Coffee Run",
            minPeople: 2,
            isDate: true,
            locationRequirement: .indoor,
            goOut: true,
            types: ["Experiences","food & Drinks"],
            energyLevel: .low,
            priceLevel: .medium,
            requiresFocus: true,
            seasons: [.winter, .spring, .summer, .fall]
        ),
        
        Activity(
            name: "Escape room",
            minPeople: 2,
            isDate: true,
            locationRequirement: .indoor,
            goOut: true,
            types: ["Experiences"],
            energyLevel: .medium,
            priceLevel: .medium,
            requiresFocus: true,
            seasons: [.winter, .spring, .summer, .fall]
        ),
        Activity(
            name: "Laser tag",
            minPeople: 2,
            isDate: true,
            locationRequirement: .indoor,
            goOut: true,
            types: ["Experiences","Fun"],
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
            guard activity.seasons.contains(state.currentSeason) else { continue }
            guard state.number >= activity.minPeople else { continue }
            guard !state.isDate || activity.isDate else { continue }
            guard activity.goOut == state.goOut else { continue }
            
            var score = 0
            var typeMatch = false

            for type in state.selectedTypes {
                if activity.types.contains(type) {
                    score += 3
                    typeMatch = true
                }
            }

            // small penalty if user selected types but this doesn't match
            if !state.selectedTypes.isEmpty && !typeMatch {
                score -= 2 //1 once have more activites
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
