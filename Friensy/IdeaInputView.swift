//
//  IdeaInputView.swift
//  Friensy
//
//  Created by Katherine Pizzirusso on 5/6/26.
//

import SwiftUI

struct IdeaInputView: View {
    
    @EnvironmentObject var appState: AppStateManager
    
    @State private var ideaText = ""
    @State private var savedMessage = false
    
    var body: some View {
        ZStack {
            Color("Teal").ignoresSafeArea()
            
            VStack(spacing: 20) {
                
                Text("Add a suggestion")
                    .font(Font.custom("BPreplay-Bold", size: 40))
                    .foregroundStyle(.white)
                
                TextField("Type your suggestion...", text: $ideaText)
                    .padding()
                    .background(.white)
                    .cornerRadius(10)
                    .padding(.horizontal)
                
                Button("Save suggestion") {
                    guard !ideaText.isEmpty else { return }
                    
                    appState.state.ideas.append(ideaText)
                    
                    ideaText = ""
                    
                   
                    savedMessage = true
                    
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                        savedMessage = false
                    }
                }
                .font(Font.custom("BPreplay-Bold", size: 25))
                .padding()
                .background(Color("Teal2"))
                .foregroundStyle(.white)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                
               
                if savedMessage {
                    Text("Saved ✓")
                        .foregroundStyle(.white)
                        .font(Font.custom("BPreplay-Bold", size: 18))
                        .transition(.opacity)
                }
                
                Spacer()
            }
            .padding()
        }
    }
}
#Preview {
    IdeaInputView()
        .environmentObject(AppStateManager())
}
