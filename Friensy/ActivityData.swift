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
            types: [.entertainment, .chill, .digital],
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
            types: [.entertainment, .social, .competitive],
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
            types: [.social, .competitive, .entertainment],
            energyLevel: .medium,
            priceLevel: .free,
            requiresFocus: true,
            seasons: [.winter, .spring, .summer, .fall]
        ),
        
        Activity(
            name: "Clue",
            minPeople: 3,
            isDate: false,
            locationRequirement: .indoor,
            goOut: false,
            types: [.social,.problemsolving,],
            energyLevel: .medium,
            priceLevel: .free,
            requiresFocus: false,
            seasons: [.winter, .spring, .summer, .fall]
        ),
        
        Activity(
            name: "Risk",
            minPeople: 2,
            isDate: false,
            locationRequirement: .indoor,
            goOut: false,
            types: [.problemsolving,.strategy],
            energyLevel: .medium,
            priceLevel: .medium,
            requiresFocus: true,
            seasons: [.winter, .spring, .summer, .fall]
        ),
        
        Activity(
            name: "Battleship",
            minPeople: 2,
            isDate: false,
            locationRequirement: .indoor,
            goOut: false,
            types: [.problemsolving,.strategy],
            energyLevel: .medium,
            priceLevel: .medium,
            requiresFocus: true,
            seasons: [.winter, .spring, .summer, .fall]
        ),
        
        Activity(
            name: "Sorry",
            minPeople: 2,
            isDate: false,
            locationRequirement: .indoor,
            goOut: false,
            types: [.social,],
            energyLevel: .medium,
            priceLevel: .free,
            requiresFocus: false,
            seasons: [.winter, .spring, .summer, .fall]
        ),
        
        Activity(
            name: "Catan",
            minPeople: 3,
            isDate: false,
            locationRequirement: .indoor,
            goOut: false,
            types: [.strategy],
            energyLevel: .medium,
            priceLevel: .medium,
            requiresFocus: true,
            seasons: [.winter, .spring, .summer, .fall]
        ),
        
        Activity(
            name: "Chess",
            minPeople: 2,
            isDate: false,
            locationRequirement: .indoor,
            goOut: false,
            types: [.strategy],
            energyLevel: .medium,
            priceLevel: .medium,
            requiresFocus: true,
            seasons: [.winter, .spring, .summer, .fall]
        ),
        Activity(
            name: "Binge Watch",
            minPeople: 1,
            isDate: false,
            locationRequirement: .indoor,
            goOut: false,
            types: [.entertainment, .digital, .fun],
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
            types: [.social, .competitive, .entertainment],
            energyLevel: .medium,
            priceLevel: .free,
            requiresFocus: false,
            seasons: [.winter, .spring, .summer, .fall]
        ),
        
        Activity(
            name: "Uno",
            minPeople: 2,
            isDate: false,
            locationRequirement: .indoor,
            goOut: false,
            types: [.social,.fun, .competitive],
            energyLevel: .medium,
            priceLevel: .free,
            requiresFocus: false,
            seasons: [.winter, .spring, .summer, .fall]
        ),
        
        Activity(
            name: "Sequence",
            minPeople: 4,
            isDate: false,
            locationRequirement: .indoor,
            goOut: false,
            types: [.strategy,.problemsolving],
            energyLevel: .medium,
            priceLevel: .medium,
            requiresFocus: true,
            seasons: [.winter, .spring, .summer, .fall]
        ),
        
        Activity(
            name: "Cards Against Humanity",
            minPeople: 4,
            isDate: false,
            locationRequirement: .indoor,
            goOut: false,
            types: [.social,.fun,.entertainment],
            energyLevel: .medium,
            priceLevel: .medium,
            requiresFocus: false,
            seasons: [.winter, .spring, .summer, .fall]
        ),
        
        Activity(
            name: "Apples to Apples",
            minPeople: 4,
            isDate: false,
            locationRequirement: .indoor,
            goOut: false,
            types: [.social,.fun,.entertainment],
            energyLevel: .medium,
            priceLevel: .medium,
            requiresFocus: false,
            seasons: [.winter, .spring, .summer, .fall]
        ),
        
        Activity(
            name: "Board games",
            minPeople: 2,
            isDate: false,
            locationRequirement: .indoor,
            goOut: false,
            types: [.social,.chill,.competitive,.entertainment,.strategy],
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
            types: [.social, .chill, .fun],
            energyLevel: .low,
            priceLevel: .free,
            requiresFocus: true,
            seasons: [.winter, .spring, .summer, .fall]
        ),
        
        Activity(
            name: "Shared Pinterest board",
            minPeople: 2,
            isDate: false,
            locationRequirement: .indoor,
            goOut: false,
            types: [.social,.art,.creative,.digital,.chill,.aesthetic],
            energyLevel: .low,
            priceLevel: .free,
            requiresFocus: false,
            seasons: [.winter, .spring, .summer, .fall]
        ),
        
        Activity(
            name: "Scrapbooking",
            minPeople: 1,
            isDate: false,
            locationRequirement: .indoor,
            goOut: false,
            types: [.social,.art,.creative,.aesthetic],
            energyLevel: .low,
            priceLevel: .free,
            requiresFocus: false,
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
            name: "Fortnite",
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
            name: "GTA",
            minPeople: 1,
            isDate: false,
            locationRequirement: .indoor,
            goOut: false,
            types: [.gaming, .entertainment, .digital],
            energyLevel: .lowest,
            priceLevel: .free,
            requiresFocus: false,
            seasons: [.winter, .spring, .summer, .fall]
        ),
        
        Activity(
            name: "Apex Legends",
            minPeople: 1,
            isDate: false,
            locationRequirement: .indoor,
            goOut: false,
            types: [.gaming, .entertainment, .digital],
            energyLevel: .lowest,
            priceLevel: .free,
            requiresFocus: false,
            seasons: [.winter, .spring, .summer, .fall]
        ),
        
        Activity(
            name: "Rocket League",
            minPeople: 1,
            isDate: false,
            locationRequirement: .indoor,
            goOut: false,
            types: [.gaming, .entertainment, .digital],
            energyLevel: .lowest,
            priceLevel: .free,
            requiresFocus: false,
            seasons: [.winter, .spring, .summer, .fall]
        ),
        
        Activity(
            name: "The Sims 4",
            minPeople: 1,
            isDate: false,
            locationRequirement: .indoor,
            goOut: false,
            types: [.gaming, .entertainment, .digital],
            energyLevel: .lowest,
            priceLevel: .free,
            requiresFocus: false,
            seasons: [.winter, .spring, .summer, .fall]
        ),
        Activity(
            name: "NBA 2K24",
            minPeople: 1,
            isDate: false,
            locationRequirement: .indoor,
            goOut: false,
            types: [.gaming, .entertainment,.sports],
            energyLevel: .lowest,
            priceLevel: .free,
            requiresFocus: false,
            seasons: [.winter, .spring, .summer, .fall]
        ),
        Activity(
            name: "FIFA 23",
            minPeople: 1,
            isDate: false,
            locationRequirement: .indoor,
            goOut: false,
            types: [.gaming, .entertainment,.sports],
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
            types: [.social, .competitive, .experiences],
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
            types: [.food, .creative, .fun],
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
            types: [.chill,.productive, .entertainment],
            energyLevel: .low,
            priceLevel: .low,
            requiresFocus: true,
            seasons: [.winter, .spring, .summer, .fall]
            
        ),
        
        Activity(
            name: "Karaoke",
            minPeople: 2,
            isDate: false,
            locationRequirement: .indoor,
            goOut: false,
            types: [.social,.music,.fun],
            energyLevel: .medium,
            priceLevel: .high,
            requiresFocus: false,
            seasons: [.winter, .spring, .summer, .fall]
        ),
        
        Activity(
            name: "Hot Chocolate & Movies",
            minPeople: 1,
            isDate: false,
            locationRequirement: .indoor,
            goOut: false,
            types: [.seasonal,.food,.entertainment],
            energyLevel: .lowest,
            priceLevel: .low,
            requiresFocus: false,
            seasons: [.winter, .fall]
        ),
        
        Activity(
            name: "Organize",
            minPeople: 1,
            isDate: false,
            locationRequirement: .indoor,
            goOut: false,
            types: [.productive,.learning, .aesthetic],
            energyLevel: .medium,
            priceLevel: .free,
            requiresFocus: false,
            seasons: [.winter, .spring, .summer, .fall]
        ),
        
        Activity(
            name: "Study",
            minPeople: 1,
            isDate: false,
            locationRequirement: .indoor,
            goOut: false,
            types: [.productive,.learning, .digital],
            energyLevel: .medium,
            priceLevel: .free,
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
            types: [.active, .experiences, .adventurous,.scenic],
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
            types: [.food, .social,.scenic,.romantic],
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
            types: [.entertainment, .active, .strategy],
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
            types: [.social, .experiences, .active],
            energyLevel: .high,
            priceLevel: .high,
            requiresFocus: false,
            seasons: [.spring, .summer, .fall]
        ),
        
        Activity(
            name: "Water Park",
            minPeople: 2,
            isDate: true,
            locationRequirement: .outdoor,
            goOut: true,
            types: [.social, .experiences, .active],
            energyLevel: .high,
            priceLevel: .high,
            requiresFocus: false,
            seasons: [.spring, .summer]
        ),
        
        Activity(
            name: "Roller Skating",
            minPeople: 2,
            isDate: true,
            locationRequirement: .outdoor,
            goOut: true,
            types: [.social, .active, .fun],
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
            types: [.social, .active, .competitive],
            energyLevel: .high,
            priceLevel: .medium,
            requiresFocus: false,
            seasons: [.winter]
        ),
        
        Activity(
            name: "Sledding",
            minPeople: 2,
            isDate: true,
            locationRequirement: .outdoor,
            goOut: true,
            types: [.social, .active,.seasonal],
            energyLevel: .high,
            priceLevel: .medium,
            requiresFocus: false,
            seasons: [.winter]
        ),
        
        Activity(
            name: "Skiing",
            minPeople: 2,
            isDate: true,
            locationRequirement: .outdoor,
            goOut: true,
            types: [.social, .active,.sports,.seasonal],
            energyLevel: .high,
            priceLevel: .medium,
            requiresFocus: false,
            seasons: [.winter]
        ),
       
        Activity(
            name: "Build a snowman",
            minPeople: 2,
            isDate: true,
            locationRequirement: .outdoor,
            goOut: true,
            types: [.social, .fun,.seasonal],
            energyLevel: .high,
            priceLevel: .medium,
            requiresFocus: false,
            seasons: [.winter]
        ),
        
        Activity(
            name: "Snowboarding",
            minPeople: 2,
            isDate: true,
            locationRequirement: .outdoor,
            goOut: true,
            types: [.social, .active,.sports,.seasonal],
            energyLevel: .high,
            priceLevel: .medium,
            requiresFocus: false,
            seasons: [.winter]
        ),
        
        Activity(
            name: "Snowball fight",
            minPeople: 2,
            isDate: true,
            locationRequirement: .outdoor,
            goOut: true,
            types: [.social, .active,.seasonal],
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
            types: [.social, .entertainment, .competitive],
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
            types: [.social,.experiences, .entertainment],
            energyLevel: .medium,
            priceLevel: .medium,
            requiresFocus: false,
            seasons: [.winter, .spring, .summer, .fall]
        ),
        
        Activity(
            name: "Drive-in Movie",
            minPeople: 2,
            isDate: true,
            locationRequirement: .outdoor,
            goOut: true,
            types: [.chill,.experiences,.entertainment,.aesthetic],
            energyLevel: .medium,
            priceLevel: .medium,
            requiresFocus: false,
            seasons: [.spring, .summer, .fall]
        ),
        
        Activity(
            name: "Stargazing",
            minPeople: 2,
            isDate: true,
            locationRequirement: .outdoor,
            goOut: true,
            types: [.chill,.experiences,.romantic,.scenic],
            energyLevel: .low,
            priceLevel: .free,
            requiresFocus: false,
            seasons: [.spring, .summer]
        ),
        
        Activity(
            name: "Nature Walk",
            minPeople: 1,
            isDate: false,
            locationRequirement: .outdoor,
            goOut: true,
            types: [.spontaneous,.active,.adventurous,.scenic],
            energyLevel: .medium,
            priceLevel: .free,
            requiresFocus: false,
            seasons: [.winter, .spring, .summer, .fall]
        ),
        
        Activity(
            name: "Apple Picking",
            minPeople: 1,
            isDate: false,
            locationRequirement: .outdoor,
            goOut: true,
            types: [.scenic,.seasonal,.food],
            energyLevel: .medium,
            priceLevel: .medium,
            requiresFocus: false,
            seasons: [.fall]
        ),
        
        Activity(
            name: "Corn Maze",
            minPeople: 1,
            isDate: false,
            locationRequirement: .outdoor,
            goOut: true,
            types: [.scenic,.seasonal, .problemsolving],
            energyLevel: .medium,
            priceLevel: .medium,
            requiresFocus: false,
            seasons: [.fall]
        ),
        
        Activity(
            name: "Pumpkin Patch",
            minPeople: 1,
            isDate: false,
            locationRequirement: .outdoor,
            goOut: true,
            types: [.scenic,.seasonal,.social],
            energyLevel: .medium,
            priceLevel: .medium,
            requiresFocus: false,
            seasons: [.fall]
        ),
        Activity(
            name: "Rooftop Dinner",
            minPeople: 2,
            isDate: true,
            locationRequirement: .outdoor,
            goOut: true,
            types: [.food,.fancy,.romantic,.aesthetic],
            energyLevel: .medium,
            priceLevel: .high,
            requiresFocus: false,
            seasons: [.spring, .summer, .fall]
        ),
        
        Activity(
            name: "Go Downtown",
            minPeople: 2,
            isDate: true,
            locationRequirement: .outdoor,
            goOut: true,
            types: [.romantic,.social,.food,.experiences],
            energyLevel: .medium,
            priceLevel: .medium,
            requiresFocus: false,
            seasons: [.winter, .spring, .summer, .fall]
        ),
        
        Activity(
            name: "Beach Day",
            minPeople: 2,
            isDate: false,
            locationRequirement: .outdoor,
            goOut: true,
            types: [.social,.experiences,.scenic],
            energyLevel: .medium,
            priceLevel: .free,
            requiresFocus: false,
            seasons: [.spring, .summer]
        ),
        
        Activity(
            name: "Watch the sunset",
            minPeople: 2,
            isDate: true,
            locationRequirement: .outdoor,
            goOut: true,
            types: [.social,.experiences,.romantic,.scenic,.aesthetic],
            energyLevel: .low,
            priceLevel: .free,
            requiresFocus: false,
            seasons: [.spring, .summer, .fall]
        ),
        
        Activity(
            name: "Water Balloon fight",
            minPeople: 2,
            isDate: false,
            locationRequirement: .outdoor,
            goOut: true,
            types: [.experiences,.spontaneous,.active,.fun],
            energyLevel: .low,
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
            types: [.spontaneous,.silly, .aesthetic],
            energyLevel: .lowest,
            priceLevel: .free,
            requiresFocus: false,
            seasons: [.winter, .spring, .summer, .fall]
        ),
        
        
        Activity(
            name: "Painting",
            minPeople: 1,
            isDate: true,
            locationRequirement: .flexible,
            goOut: false,
            types: [.creative,.art, .fun],
            energyLevel: .medium,
            priceLevel: .medium,
            requiresFocus: false,
            seasons: [.winter, .spring, .summer, .fall]
        ),
        
        Activity(
            name: "Concert",
            minPeople: 2,
            isDate: false,
            locationRequirement: .flexible,
            goOut: true,
            types: [.music,.entertainment,.experiences],
            energyLevel: .high,
            priceLevel: .high,
            requiresFocus: false,
            seasons: [.winter, .spring, .summer, .fall]
        ),
        
        Activity(
            name: "Learn a new skill",
            minPeople: 1,
            isDate: false,
            locationRequirement: .flexible,
            goOut: true,
            types: [.experiences,.learning,.fun],
            energyLevel: .medium,
            priceLevel: .medium,
            requiresFocus: false,
            seasons: [.winter, .spring, .summer, .fall]
        ),
        
        Activity(
            name: "Go To a Sports Game",
            minPeople: 2,
            isDate: true,
            locationRequirement: .flexible,
            goOut: true,
            types: [.sports, .social,.entertainment],
            energyLevel: .medium,
            priceLevel: .high,
            requiresFocus: false,
            seasons: [.winter, .spring, .summer, .fall]
        ),
        
        Activity(
            name: "Rock Climbing",
            minPeople: 2,
            isDate: true,
            locationRequirement: .flexible,
            goOut: true,
            types: [.adventurous, .social,.active],
            energyLevel: .medium,
            priceLevel: .medium,
            requiresFocus: false,
            seasons: [.winter, .spring, .summer, .fall]
        ),
        
        Activity(
            name: "See a live-action show",
            minPeople: 2,
            isDate: true,
            locationRequirement: .flexible,
            goOut: true,
            types: [.experiences,.art,.entertainment,.music],
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
            types: [.sports, .entertainment,.social],
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
            types: [.experiences,.art,.fancy,.aesthetic],
            energyLevel: .medium,
            priceLevel: .medium,
            requiresFocus: false,
            seasons: [.winter, .spring, .summer, .fall]
        ),
        
        Activity(
            name: "Haunted House",
            minPeople: 2,
            isDate: true,
            locationRequirement: .indoor,
            goOut: true,
            types: [.experiences,.seasonal],
            energyLevel: .medium,
            priceLevel: .medium,
            requiresFocus: false,
            seasons: [.fall]
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
            name: "Pottery",
            minPeople: 2,
            isDate: true,
            locationRequirement: .indoor,
            goOut: true,
            types: [.experiences,.art,.creative],
            energyLevel: .medium,
            priceLevel: .medium,
            requiresFocus: false,
            seasons: [.winter, .spring, .summer, .fall]
        ),
        
        Activity(
            name: "Workout",
            minPeople: 1,
            isDate: false,
            locationRequirement: .indoor,
            goOut: true,
            types: [.active,.competitive,.experiences],
            energyLevel: .high,
            priceLevel: .medium,
            requiresFocus: false,
            seasons: [.winter, .spring, .summer, .fall]
        ),
        
        Activity(
            name: "Trampoline Park",
            minPeople: 1,
            isDate: false,
            locationRequirement: .indoor,
            goOut: true,
            types: [.active,.spontaneous,.silly],
            energyLevel: .high,
            priceLevel: .medium,
            requiresFocus: false,
            seasons: [.winter, .spring, .summer, .fall]
        ),
        
        Activity(
            name: "Thrift Shopping",
            minPeople: 1,
            isDate: true,
            locationRequirement: .indoor,
            goOut: true,
            types: [.shopping,.fun,.aesthetic],
            energyLevel: .medium,
            priceLevel: .medium,
            requiresFocus: false,
            seasons: [.winter, .spring, .summer, .fall]
        ),
        
        Activity(
            name: "Record Store",
            minPeople: 1,
            isDate: false,
            locationRequirement: .indoor,
            goOut: true,
            types: [.shopping,.fun,.music,],
            energyLevel: .medium,
            priceLevel: .medium,
            requiresFocus: false,
            seasons: [.winter, .spring, .summer, .fall]
        ),
        
        Activity(
            name: "Book Shopping",
            minPeople: 1,
            isDate: false,
            locationRequirement: .indoor,
            goOut: true,
            types: [.shopping,.chill,.learning],
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
            types: [.gaming, .fun,.entertainment],
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
            types: [.food,.chill,.fun],
            energyLevel: .low,
            priceLevel: .medium,
            requiresFocus: false,
            seasons: [.winter, .spring, .summer, .fall]
        ),
        
        Activity(
            name: "Restaurant",
            minPeople: 2,
            isDate: false,
            locationRequirement: .indoor,
            goOut: true,
            types: [.food,.fancy,.romantic],
            energyLevel: .medium,
            priceLevel: .high,
            requiresFocus: false,
            seasons: [.winter, .spring, .summer, .fall]
        ),
        Activity(
            name: "Opera House",
            minPeople: 2,
            isDate: true,
            locationRequirement: .indoor,
            goOut: true,
            types: [.fancy,.romantic,.music],
            energyLevel: .medium,
            priceLevel: .high,
            requiresFocus: false,
            seasons: [.winter, .spring, .summer, .fall]
        ),
        Activity(
            name: "Murder mystery dinner",
            minPeople: 2,
            isDate: true,
            locationRequirement: .indoor,
            goOut: true,
            types: [.fun,.social,.experiences],
            energyLevel: .medium,
            priceLevel: .high,
            requiresFocus: false,
            seasons: [.winter, .spring, .summer, .fall]
        ),
        Activity(
            name: "Shopping",
            minPeople: 2,
            isDate: false,
            locationRequirement: .indoor,
            goOut: true,
            types: [.shopping,.social,.creative],
            energyLevel: .medium,
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
            types: [.experiences,.problemsolving,.social,.competitive,.strategy],
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
            types: [.experiences,.competitive,.strategy],
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


          
            for type in state.selectedTypes {
                if activity.types.contains(type) {
                    matchedTypes += 1
                }
            }


            
            score += matchedTypes * 10


            
            if !state.selectedTypes.isEmpty && matchedTypes == 0 {
                score -= 15
            }


            
            if activity.locationRequirement == .flexible {
                score += 2
            }


            
            let extraPeople = state.number - activity.minPeople

            if extraPeople == 0 {
                score += 4
            }
            else if extraPeople <= 2 {
                score += 2
            }


           
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
