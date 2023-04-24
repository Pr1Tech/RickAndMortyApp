//
//  SplashView.swift
//  RickAndMorty
//
//  Created by selim on 24.04.2023.
//

import SwiftUI

struct SplashView: View {
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    @AppStorage("isFirstLaunch") var isFirstLaunch: Bool = true
    
    var body: some View {
        
        if isActive {
            ContentView()
        } else {
            VStack {
                VStack {
                    Image("RickAndMortyHeader")
                        .resizable()
                        .frame(width: 250, height: 250)
                        .font(.system(size: 80))
                        
                        .padding()
                    Text(isFirstLaunch ? "Welcome!" : "Hello!")
                        .font(Font.custom("Avenir", size: 30))
                        .foregroundColor(.black.opacity(0.80))
                        .font(.largeTitle)
                        .fontWeight(.bold)
                }
                .scaleEffect(size)
                .opacity(opacity)
                .onAppear {
                    withAnimation(.easeIn(duration: 1.2)) {
                        self.size = 0.9
                        self.opacity = 1.0
                    }
                   
                }
            }
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0 ) {
                    self.isActive = true
                }
                if isFirstLaunch {
                    isFirstLaunch = false
                }
            }
        }
        
        
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
