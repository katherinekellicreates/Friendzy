//
//  DebugIdeasView.swift
//  Friensy
//
//  Created by Katherine Pizzirusso on 5/6/26.
//

import SwiftUI

struct DebugIdeasView: View {
    
    @EnvironmentObject var appState: AppStateManager
    
    var body: some View {
        VStack(spacing: 0) {
            

            VStack(alignment: .leading, spacing: 8) {
                Text("DASHBOARD (LIVE)")
                    .font(.headline)
                
                Text("Suggestion count: \(appState.state.ideas.count)")
                    .font(.subheadline)
                    .foregroundStyle(.gray)
            }
            .padding()
            
            Divider()
            
            
            List {
                ForEach(appState.state.ideas, id: \.self) { idea in
                    Text(idea)
                }
                .onDelete(perform: deleteIdea)
            }
        }
        .navigationTitle("Suggestions")
    }
    
    
    func deleteIdea(at offsets: IndexSet) {
        appState.state.ideas.remove(atOffsets: offsets)
    }
}
#Preview {
    DebugIdeasView()
        .environmentObject(AppStateManager())
}
