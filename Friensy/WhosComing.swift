//
//  WhosComing.swift
//  Friensy
//
//  Created by Maya Krishnan on 4/21/26.
//

import SwiftUI
import MapKit

struct WhosComing: View {
    @EnvironmentObject var appState: AppStateManager
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color("Teal").ignoresSafeArea(.all)
                ScrollView {
                    VStack(spacing: 20) {
                        
                        Text("Who's Coming")
                            .font(Font.custom("BPreplay-Bold", size: 45))
                            .foregroundStyle(.white)
                        
                        HStack {
                            Text("Attendees")
                                .font(Font.custom("BPreplay", size: 20))
                                .foregroundStyle(.white)
                            Picker("", selection: $appState.state.number) {
                                Text("1").tag(1)
                                Text("2").tag(2)
                                Text("3").tag(3)
                                Text("4").tag(4)
                                Text("5").tag(5)
                                Text("6").tag(6)
                                Text("7+").tag(7)
                            }
                            .pickerStyle(.segmented)
                           // .tint(Color("Teal"))
                            .scaleEffect(1.13)
                            .frame(width: 250, height: 30)
                            .padding()
                        }
                        
                        VStack(spacing: 5) {
                            Text("Who's coming?")
                                .font(Font.custom("BPreplay-Bold", size: 25))
                                .foregroundStyle(.white)
                            Picker("", selection: $appState.state.gender) {
                                Text("Guys").tag("Males")
                                Text("Gals").tag("Females")
                                Text("Both").tag("Both")
                            }
                            .pickerStyle(.segmented)
                            .scaleEffect(1.3)
                            .frame(width: 250, height: 40)
                        }
                        
                        VStack(spacing: 5) {
                            Text("Is this a date?")
                                .font(Font.custom("BPreplay-Bold", size: 25))
                                .foregroundStyle(.white)
                            Picker("", selection: $appState.state.isDate) {
                                Text("No").tag(false)
                                Text("Yes").tag(true)
                            }
                            .pickerStyle(.segmented)
                            .scaleEffect(1.2)
                            .frame(width: 200, height: 35)
                        }
                        .padding(10)
                        
                        HStack {
                            Text("Stay In")
                                .font(Font.custom("BPreplay", size: 20))
                                .foregroundStyle(.white)
                                .fontWeight(appState.state.goOut ? .regular : .bold)
                                .foregroundColor(appState.state.goOut ? .secondary : .primary)
                            
                            
                            Toggle("", isOn: $appState.state.goOut)
                                .tint(.teal2)
                                .frame(width: 60)
                            
                            Text("Go Out")
                                .font(Font.custom("BPreplay", size: 20))
                                .foregroundStyle(.white)
                                .fontWeight(appState.state.goOut ? .bold : .regular)
                                .foregroundColor(appState.state.goOut ? .primary : .secondary)
                        }
                        .padding()
                        
                        
                        if appState.state.goOut {
                            NavigationLink(destination: Where(appState: appState)) {
                                nextButton
                            }
                        } else {
                            NavigationLink(destination: Tellmemore()) {
                                nextButton
                            }
                        }
                    }
                }
                .background(Color("Teal"))
                .navigationViewStyle(.stack)
                .padding(.bottom, 40)
            }
        }
    }
        
        var nextButton: some View {
            Text("Next")
                .frame(width: 100)
                .font(Font.custom("BPreplay-bold", size: 45))
                .padding()
                .background(Color("Teal2"))
                .foregroundStyle(.white)
                .clipShape(RoundedRectangle(cornerRadius: 10))
        }
    }
#Preview {
    WhosComing()
        .environmentObject(AppStateManager())
}
