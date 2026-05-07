//
//  FriensyApp.swift
//  Friensy
//
//  Created by Katherine Pizzirusso on 4/17/26.
//

import SwiftUI

@main
struct FriensyApp: App {
    @StateObject var appState = AppStateManager()
    
    init() {
        let normalFont = UIFont(name: "BPreplay", size: 15)!
        let selectedFont = UIFont(name: "BPreplay-Bold", size: 15)!
        
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(Color("OurYellow"))
        
       // UISegmentedControl.appearance().backgroundColor =
        //UIColor(Color("Teal").opacity(0.3))
        
        UISegmentedControl.appearance().setTitleTextAttributes([
            .font: normalFont,
            .foregroundColor: UIColor.white
        ], for: .normal)

        UISegmentedControl.appearance().setTitleTextAttributes([
            .font: selectedFont,
            .foregroundColor: UIColor.teal
        ], for: .selected)
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(appState)
        }
    }
}
