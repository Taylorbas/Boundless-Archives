//
//  ContentView.swift
//  Boundless Archives
//
//  Created by Bassil Taylor on 4/3/24.
//

import SwiftUI
import Foundation
import AVFoundation

struct ContentView: View {
    @State private var isDark = false
    
    var body: some View {
        NavigationView {
            ZStack {
                BlackHoleBackground()
                
                VStack {
                    HStack {
                        Spacer() // Add spacer to move trophy icon to the right
                        NavigationLink(destination: AchievementBoard()) {
                            Image(systemName: "trophy")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 25, height: 25)
                                .foregroundColor(.yellow)
                                .padding()
                        }
                    }
                    
                    AnimatedText(text: "Select A card game to edit!!")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .shadow(color: .black, radius: 2, x: 0, y: 2)
                        .padding(.bottom, 20)
                        .multilineTextAlignment(.center) // Center-align the text
                        .padding()
                        .onAppear {
                            isDark = true
                        }
                    
                    Spacer()
                    
                    NavigationLink(destination: PokeView()) {
                        SectionButton(title: "Pokemon", color: .black, outlineColor: .red) // Pass outline color
                    }
                    .buttonStyle(PlainButtonStyle())
                    
                    Spacer()
                    
                    NavigationLink(destination: MagicView()) {
                        SectionButton(title: "Magic", color: .black, outlineColor: .blue) // Pass outline color
                    }
                    .buttonStyle(PlainButtonStyle())
                    
                    Spacer()
                    
                    NavigationLink(destination: SportsView()) {
                        SectionButton(title: "Sports", color: .black, outlineColor: .green) // Pass outline color
                    }
                    .buttonStyle(PlainButtonStyle())
                    
                    Spacer()
                }
            }
            .navigationViewStyle(StackNavigationViewStyle()) // Use StackNavigationViewStyle to prevent navigation bar from appearing on iPad
        }
    }
}

struct SectionButton: View {
    var title: String
    var color: Color
    var outlineColor: Color // Added property to specify the outline color
    
    var body: some View {
        Text(title)
            .font(.title)
            .fontWeight(.bold)
            .foregroundColor(outlineColor) // Set text color to outline color
            .shadow(color: .black, radius: 2, x: 0, y: 2)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.black) // Set background color to black
            .cornerRadius(15)
            .overlay(Star(corners: 5, smoothness: 0.45).foregroundColor(.white.opacity(0.5))) // Add star overlay
            .scaleEffect(2/3) // Cut by 1/3 of the size
            .overlay(
                RoundedRectangle(cornerRadius: 15) // Add rounded rectangle overlay for outline
                    .stroke(outlineColor, lineWidth: 2) // Set stroke color to original outline color
            )
    }
}

struct AnimatedText: View {
    let text: String
    let colors: [Color] = [.red, .orange, .yellow, .green, .blue, .purple]
    
    @State private var currentIndex = 0
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(0..<text.count) { index in
                Text(String(text[text.index(text.startIndex, offsetBy: index)]))
                    .foregroundColor(colors[(currentIndex + index) % colors.count])
                    .transition(.opacity)
            }
        }
        .onAppear {
            withAnimation(Animation.linear(duration: 1.5).repeatForever()) {
                currentIndex = text.count - 1
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
