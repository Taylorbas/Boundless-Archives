//
//  LoadingView.swift
//  Boundless Archives
//
//  Created by Bassil Taylor on 4/3/24.
//
import SwiftUI

struct LoadingView: View {
    @State private var isLoading = true
    @State private var loadingText = "Loading..."
    @State private var colors: [Color] = []
    @State private var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State private var currentIndex = 0
    @State private var showDots = true // State to control visibility of dots
    @State private var animationIndex = 0 // State to manage animation index
    
    @State private var animationTimer: Timer? // Timer for animation
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: colors), startPoint: .topLeading, endPoint: .bottomTrailing)
                .animation(.easeInOut(duration: 2))
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                Spacer()
                
                // Text with animation
                Text(loadingText)
                    .font(.system(size: 30))
                    .foregroundColor(.black)
                    .opacity(loadingText.isEmpty ? 0 : 1)
                    .animation(Animation.easeInOut(duration: 0.5).repeatForever())
                
                Spacer()
            }
        }
        .onReceive(timer) { _ in
            // Update loading text animation
            updateLoadingTextAnimation()
            
            if currentIndex < loadingText.count {
                // Check if character is a dot and toggle visibility
                if loadingText[loadingText.index(loadingText.startIndex, offsetBy: currentIndex)] == "." {
                    showDots.toggle()
                }
                currentIndex += 1
            } else {
                currentIndex = 0
                loadingText = "Loading..."
            }
        }
        .onAppear {
            setupColors()
            
            
            // Start animation timer
            animationTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                animationIndex = (animationIndex + 1) % 3
            }
            
            // Stop animation timer after 10 seconds
            DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
                animationTimer?.invalidate()
                animationTimer = nil
                isLoading = false
            }
        }
        .fullScreenCover(isPresented: $isLoading, content: ContentView.init)
        .onAppear {
                    // Schedule transition to ContentView after 10 seconds
                    DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
                        withAnimation {
                            self.isLoading = false
                        }
                    }
                }
                .fullScreenCover(isPresented: $isLoading) {
                    ContentView()
                }
    }
    
    private func setupColors() {
        var randomColors: [Color] = []
        for _ in 0..<8 {
            let red = Double.random(in: 0...1)
            let green = Double.random(in: 0...1)
            let blue = Double.random(in: 0...1)
            randomColors.append(Color(red: red, green: green, blue: blue))
        }
        colors = randomColors
    }
    
   
    private func updateLoadingTextAnimation() {
        switch animationIndex {
        case 0:
            loadingText = "Loading"
        case 1:
            loadingText = "Loading."
        case 2:
            loadingText = "Loading.."
        default:
            break
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
