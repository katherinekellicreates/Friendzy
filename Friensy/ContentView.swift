//
//  ContentView.swift
//  Friensy
//
//  Created by Katherine Pizzirusso on 4/17/26.


import SwiftUI
import MapKit

struct ContentView: View {
    
    @EnvironmentObject var appState: AppStateManager
    
    @State private var devTapCount = 0
    @State private var showDevMode = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color("Teal").ignoresSafeArea(.all)
                
                VStack {
                    
                    Image("main2")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 350, height: 300)
                    
                    NavigationLink(destination: WhosComing()) {
                        Text("Plan")
                            .frame(width: 100)
                            .font(Font.custom("BPreplay-Bold", size: 45))
                            .padding()
                            .background(Color("Teal2"))
                            .foregroundStyle(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                    
                    Spacer()
                        .padding()
                    NavigationLink(destination: IdeaInputView()) {
                        Text("App Suggestions")
                            .frame(width: 150)
                            .font(Font.custom("BPreplay-Bold", size: 23))
                            .padding()
                            .background(Color("Teal2"))
                            .foregroundStyle(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                    
                    Spacer()
                }
                .padding()
                
                // (top-right corner)
                VStack {
                    HStack {
                        Spacer()
                        
                        Rectangle()
                            .fill(Color.clear)
                            .frame(width: 80, height: 80)
                            .contentShape(Rectangle())
                            .onTapGesture {
                                devTapCount += 1
                                
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                                    devTapCount = 0
                                }
                                
                                
                                if devTapCount >= 3 {
                                    showDevMode = true
                                    devTapCount = 0
                                }
                            }
                    }
                    Spacer()
                }
            }
        }
        
        
        .sheet(isPresented: $showDevMode) {
            NavigationStack {
                DebugIdeasView()
            }
            .environmentObject(appState)
        }
    }
}
#Preview {
    ContentView()
        .environmentObject(AppStateManager())
}

