//
//  AchiveView.swift
//  Boundless Archives
//
//  Created by Bassil Taylor on 4/4/24.
//

import SwiftUI

struct Achievement: Identifiable { // Conforming to Identifiable protocol
    let id: Int
    let name: String
    var isUnlocked: Bool
}

struct AchievementBoard: View {
    @State private var achievements: [Achievement] = [
        Achievement(id: 1, name: "Add ten cards to the Pokemon Collection", isUnlocked: false),
        Achievement(id: 2, name: "Add ten cards to the Magic Collection", isUnlocked: false),
        Achievement(id: 3, name: "Add ten cards to the Sports Collection", isUnlocked: false),
        Achievement(id: 4, name: "Add Five different element types to the Pokemon Collection", isUnlocked: false),
        Achievement(id: 5, name: "Add Five different element types to the Magic Collection", isUnlocked: false),
        Achievement(id: 6, name: "Add three cards with different years to the Sports Collection", isUnlocked: false),
        Achievement(id: 7, name: "Add three NFL cards to the Sports Collection", isUnlocked: false),
        Achievement(id: 8, name: "Add three MLB cards to the Sports Collection", isUnlocked: false),
        Achievement(id: 9, name: "Add three NBA cards to the Sports Collection", isUnlocked: false),
        Achievement(id: 10, name: "Add 20 cards all collections", isUnlocked: false),
    ]
    
    var body: some View {
        ZStack {
            Color(red: 0.0, green: 0.8, blue: 0.8) // Light red background
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Achievement Board ⭐️") // Title with cursive font and gold star
                    .font(.custom("Cursive", size: 30)) // Larger and bold title
                    .fontWeight(.bold)
                    .foregroundColor(.yellow) // Yellow color
                    .padding()
                
                List {
                    ForEach(achievements.indices, id: \.self) { index in
                        AchievementRow(achievement: achievements[index], achievements: $achievements)
                    }
                }
                .listStyle(PlainListStyle())
            }
        }
    }
}

struct AchievementRow: View {
    var achievement: Achievement
    @Binding var achievements: [Achievement] // Binding to the array of achievements
    
    var body: some View {
        HStack {
            Image(systemName: achievement.isUnlocked ? "lock.open.fill" : "lock.fill") // Gold lock
                .foregroundColor(.yellow)
                .onTapGesture {
                    unlockAchievement(achievement)
                }
            
            Text(achievement.name)
                .foregroundColor(achievement.isUnlocked ? .green : .white) // Change text color if unlocked
                .strikethrough(!achievement.isUnlocked) // Add strikethrough if unlocked
                .opacity(achievement.isUnlocked ? 0.5 : 1.0) // Reduce opacity if unlocked
                .animation(.easeInOut(duration: 0.5)) // Add animation for opacity change
            
            Spacer()
        }
        .padding()
    }
    
    private func unlockAchievement(_ achievement: Achievement) {
        if let index = achievements.firstIndex(where: { $0.id == achievement.id }) {
            achievements[index].isUnlocked = true
        }
    }
}

struct AchievementBoard_Previews: PreviewProvider {
    static var previews: some View {
        AchievementBoard()
    }
}
