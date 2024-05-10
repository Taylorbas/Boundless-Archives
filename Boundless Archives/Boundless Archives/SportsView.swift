//
//  SportsView.swift
//  Boundless 
//
//  Created by Bassil Taylor on 4/11/24.
//

import SwiftUI
import Firebase

struct SportsView: View {
    @State private var sportsList: [Sports] = []
    @State private var searchText: String = ""
    @State private var showTab: Bool = false
    
    var body: some View {
        VStack {
            Text("Sports Collection")
                .font(.largeTitle)
                .padding()
            
            TextField("Search", text: $searchText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            List(sportsList.filter { sports in
                searchText.isEmpty ? true : sports.name.lowercased().contains(searchText.lowercased())
            }, id: \.id) { sports in
                SportsRowView(sports: sports)
            }
            .padding()
            
            if showTab {
                Button(action: {
                    // Action when the tab is clicked
                }) {
                    Text("Clickable Tab")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding()
            }
        }
        .background(Color(red: 0.8, green: 1, blue: 0.8))
        .onAppear {
            readSportsData()
        }
        .onChange(of: searchText) { newValue in
            showTab = !newValue.isEmpty && sportsList.contains { $0.name.lowercased() == newValue.lowercased() }
        }
    }
    
    private func readSportsData() {
        let db = Firestore.firestore()
        
        db.collection("Sports").getDocuments { (snapshot, error) in
            if let error = error {
                print("Error getting Sports documents: \(error)")
            } else {
                var sportsArray: [Sports] = []
                for document in snapshot!.documents {
                    let data = document.data()
                    let name = data["name"] as? String ?? ""
                    let sport = data["sport"] as? String ?? ""
                    let year = data["year"] as? String ?? ""
                    let autograph = data["autograph"] as? Bool ?? false
                    
                    let sportsItem = Sports(name: name, sport: sport, year: year, autograph: autograph)
                    sportsArray.append(sportsItem)
                }
                self.sportsList = sportsArray
            }
        }
    }
}

struct SportsRowView: View {
    let sports: Sports
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Name: \(sports.name)")
                .font(.headline)
            Text("Sport: \(sports.sport)")
                .font(.subheadline)
            Text("Year: \(sports.year)")
                .font(.subheadline)
            Text("Autograph: \(sports.autograph ? "Yes" : "No")")
                .font(.subheadline)
        }
    }
}

struct SportsView_Previews: PreviewProvider {
    static var previews: some View {
        SportsView()
    }
}
