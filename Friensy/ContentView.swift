//
//  ContentView.swift
//  Friensy
//
//  Created by Katherine Pizzirusso on 4/17/26.


import SwiftUI
import MapKit

struct ContentView: View {
    
    @EnvironmentObject var appState: AppStateManager
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color("Teal").ignoresSafeArea(.all)
                VStack {
                    Image("main2")
                        .resizable().scaledToFit().frame(width: 350, height: 300)
                   // Text("Friendzy")
                       // .font(Font.custom("Bodoni 72 Oldstyle", size: 45))
                    NavigationLink(destination: WhosComing()) {
                        Text("Plan")
                            .frame(width: 100)
                            .font(Font.custom("Bodoni 72 Oldstyle", size: 45))
                            .padding()
                            .background(Color("OurYellow"))
                            .foregroundStyle(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                    .simultaneousGesture(TapGesture().onEnded { withAnimation(.none) {} })
                    Spacer()
                }
                .padding()
            }
            .navigationViewStyle(.stack)
        }
    }
}
#Preview {
    ContentView()
        .environmentObject(AppStateManager())
}

