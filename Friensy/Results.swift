//
//  Results.swift
//  Friensy
//
//  Created by Katherine Pizzirusso on 4/21/26.
//

import SwiftUI

struct Results: View {
    
    @EnvironmentObject var appState: AppStateManager
    @State private var showingFilters = false
    @State private var selectedPrice: PriceLevel?
    @State private var selectedEnergy: EnergyLevel?
    @State private var focusOnly = false
    var ideas: [Activity] {
        
        ActivityData.generateIdeas(from: appState.state)
            .filter { activity in
                
                let matchesPrice =
                selectedPrice == nil ||
                activity.priceLevel == selectedPrice
                
                let matchesEnergy =
                selectedEnergy == nil ||
                activity.energyLevel == selectedEnergy
                
                let matchesFocus =
                !focusOnly ||
                activity.requiresFocus
                
                return matchesPrice &&
                matchesEnergy &&
                matchesFocus
            }
    }
    
    var body: some View {
        ZStack {
            Color("Teal").ignoresSafeArea(.all)
            VStack {
                HStack {
                    
                    Spacer()
                    
                    Button {
                        showingFilters = true
                    } label: {
                        Image(systemName: "line.3.horizontal.decrease.circle")
                            .font(.system(size: 28))
                            .foregroundStyle(.white)
                    }
                }
                .padding(.horizontal)
                .padding(.top)
                Text("Your Ideas:")
                    .foregroundStyle(.white)
                    .font(Font.custom("BPreplay", size: 35))
                
                if !ideas.isEmpty {
                    Text(
                        ideas.count == 1
                        ? "1 way to spend your day!"
                        :"\(ideas.count) ways to spend your day!"
                    )
                    .foregroundStyle(.white.opacity(0.8))
                    .font(Font.custom("BPreplay", size: 20))
                }
                
                if ideas.isEmpty {
                    Text("No matches — try different settings")
                        .foregroundStyle(.white.opacity(0.8))
                        .font(Font.custom("BPreplay", size: 20))
                    
                    
                } else {
                    ScrollView {
                        LazyVStack(spacing: 0) {
                            
                            ForEach(ideas, id: \.name) { activity in
                                
                                NavigationLink(
                                    destination: ActivityDetailView(
                                        appState: appState,
                                        activity: activity
                                    )
                                ) {
                                    HStack {
                                        
                                        VStack(alignment: .leading) {
                                            Text(activity.name)
                                                .font(Font.custom("BPreplay", size: 25))
                                                .foregroundStyle(.white)
                                            
                                            HStack {
                                                Text(activity.energyLevel.emoji)
                                                    .font(Font.custom("BPreplay", size: 22))
                                                    .foregroundStyle(.white)
                                                Text(activity.priceLevel.display)
                                                    .font(Font.custom("BPreplay", size: 22))
                                                    .foregroundStyle(.white)
                                                
                                                if activity.requiresFocus {
                                                    Text("🧠")
                                                        .font(Font.custom("BPreplay", size: 22))
                                                        .foregroundStyle(.white)
                                                }
                                            }
                                        }
                                        
                                        Spacer()
                                        
                                        Image(systemName: "chevron.right")
                                            .foregroundStyle(.white)
                                            .font(.system(size: 14, weight: .semibold))
                                    }
                                    .padding()
                                }
                                
                                Divider()
                                    .padding(.leading)
                            }
                        }
                    }
                }
            }
        }
        .sheet(isPresented: $showingFilters) {
            
            NavigationStack {
                
                VStack(spacing: 25) {
                    
                    Text("Filters")
                        .font(Font.custom("BPreplay-Bold", size: 35))
                    
                    VStack(alignment: .leading, spacing: 10) {
                        
                        Text("Price")
                            .font(Font.custom("BPreplay", size: 22))
                        
                        Picker("Price", selection: $selectedPrice) {
                            
                            Text("Any")
                                .tag(nil as PriceLevel?)
                            Text("Free")
                                .tag(PriceLevel.free as PriceLevel?)
                            Text("$")
                                .tag(PriceLevel.low as PriceLevel?)
                            Text("$$")
                                .tag(PriceLevel.medium as PriceLevel?)
                            Text("$$$")
                                .tag(PriceLevel.high as PriceLevel?)
                        }
                        .pickerStyle(.segmented)
                    }
                    
                    VStack(alignment: .leading, spacing: 10) {
                        
                        Text("Energy")
                            .font(Font.custom("BPreplay", size: 22))
                        
                        Picker("Energy", selection: $selectedEnergy) {
                            Text("Any")
                                .tag(nil as EnergyLevel?)
                            Text("⚡️")
                                .tag(EnergyLevel.lowest as EnergyLevel?)
                            Text("⚡️⚡️")
                                .tag(EnergyLevel.low as EnergyLevel?)
                            Text("⚡️⚡️⚡️")
                                .tag(EnergyLevel.medium as EnergyLevel?)
                            Text("⚡️⚡️⚡️⚡️")
                                .tag(EnergyLevel.high as EnergyLevel?)
                        }
                        .pickerStyle(.segmented)
                    }
                    
                    Toggle("🧠 Focus Activities Only", isOn: $focusOnly)
                        .font(Font.custom("BPreplay", size: 20))
                    
                    Button("Clear Filters") {
                        
                        selectedPrice = nil
                        selectedEnergy = nil
                        focusOnly = false
                    }
                    .font(Font.custom("BPreplay-Bold", size: 22))
                    .padding()
                    .background(Color.teal2.opacity(0.2))
                    .cornerRadius(12)
                    
                    Spacer()
                }
                .padding()
            }
        }
    }
}
#Preview {
    NavigationStack {
        Results()
            .environmentObject(AppStateManager())
    }
}
