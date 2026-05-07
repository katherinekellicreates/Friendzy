//
//  Results.swift
//  Friensy
//
//  Created by Katherine Pizzirusso on 4/21/26.
//

import SwiftUI

struct Results: View {
    
    @EnvironmentObject var appState: AppStateManager
    var ideas: [Activity] {
        ActivityData.generateIdeas(from: appState.state)
    }
    
    var body: some View {
        ZStack {
            Color("Teal").ignoresSafeArea(.all)
            VStack {
                Text("Your Ideas:")
                    .foregroundStyle(.white)
                    .font(Font.custom("BPreplay", size: 35))
                Text("\(ideas.count) ways to spend your day!")
                       .foregroundStyle(.white.opacity(0.8))
                       .font(Font.custom("BPreplay", size: 20))
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
    }
}

#Preview {
    NavigationStack {
        Results()
            .environmentObject(AppStateManager())
    }
}
