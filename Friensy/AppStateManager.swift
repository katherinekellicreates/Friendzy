//
//  AppStateManager.swift
//  Friensy
//
//  Created by Katherine Pizzirusso on 4/22/26.
//

import Foundation
import SwiftUI
import Combine

class AppStateManager: ObservableObject {
    
    @Published var state = AppState() {
            didSet {
                saveIdeas()
            }
        }
        
        init() {
            loadIdeas()
        }
        
        private func saveIdeas() {
            if let encoded = try? JSONEncoder().encode(state.ideas) {
                UserDefaults.standard.set(encoded, forKey: "ideas")
            }
        }
        
        private func loadIdeas() {
            if let data = UserDefaults.standard.data(forKey: "ideas"),
               let decoded = try? JSONDecoder().decode([String].self, from: data) {
                state.ideas = decoded
            }
        }
    }
