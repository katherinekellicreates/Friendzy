//
//  Tellmemore.swift
//  Friensy
//
//  Created by Katherine Pizzirusso on 4/22/26.
//

import SwiftUI

struct Tellmemore: View {
    
    @EnvironmentObject var appState: AppStateManager
    
    var body: some View {
        ScrollView {
            ZStack {
                VStack(spacing: 25) {
                    Text("Tell Me More")
                        .font(Font.custom("BPreplay-Bold", size: 40))
                        .foregroundStyle(.white)
                    
                    Text("Activity Type")
                        .font(Font.custom("BPreplay", size: 30))                .foregroundStyle(.white)
                    
                    LazyVGrid(columns: [
                        GridItem(.adaptive(minimum: 150))
                    ], spacing: 10) {
                        
                        ForEach(ActivityType.allCases, id: \.self) { type in
                            if type == .romantic && !appState.state.isDate {
                                EmptyView()
                            } else {
                                typeChip(type)
                            }
                        }
                    }
                    Color("Teal").ignoresSafeArea(.all)
                    NavigationLink(destination: Results()) {
                        Text("See Results")
                            .font(Font.custom("BPreplay-Bold", size: 25))
                            .frame(width: 250)
                            .padding()
                            .background(Color.ourYellow)
                            .foregroundColor(.teal)
                            .cornerRadius(12)
                    }
                }
                .padding()
            }
            .background(Color("Teal").ignoresSafeArea())
            .scrollContentBackground(.hidden)
        }
        .background(Color("Teal").ignoresSafeArea())
    }
    
    func typeChip(_ type: ActivityType) -> some View {
        Button(action: {
            toggleType(type)
        }) {
            Text(type.rawValue)
                .font(Font.custom("BPreplay", size: 18))
                .lineLimit(1)
                .frame(maxWidth: .infinity, minHeight: 30)
                .modifier(ChipStyle(
                    isSelected: appState.state.selectedTypes.contains(type)
                ))
        }
    }
    func toggleType(_ type: ActivityType) {
        if appState.state.selectedTypes.contains(type) {
            appState.state.selectedTypes.remove(type)
        } else {
            appState.state.selectedTypes.insert(type)
        }
    }
}

struct ChipStyle: ViewModifier {
    var isSelected: Bool
    
    func body(content: Content) -> some View {
        content
            .font(Font.custom("BPreplay", size: 18))
            .lineLimit(1)
            .minimumScaleFactor(0.9)
            .padding(.vertical, 15)
            .padding(.horizontal, 25)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(isSelected ? Color.ourYellow : Color.teal2.opacity(0.25))
            )
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.white.opacity(0.2), lineWidth: 0)
            )
            .foregroundColor(isSelected ? .teal : .white)
    }
}
    
#Preview {
    Tellmemore()
        .environmentObject(AppStateManager())
}
