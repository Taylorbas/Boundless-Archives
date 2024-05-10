//
//  MagicView.swift
//  Boundless 
//
//  Created by Bassil Taylor on 4/11/24.
//


import SwiftUI
import Firebase

struct MagicView: View {
    @State private var magicList: [Magic] = []
    @State private var searchText: String = ""
    @State private var showTab: Bool = false
    
    var body: some View {
        VStack {
            Text("Magic Collection")
                .font(.largeTitle)
                .padding()
            
            TextField("Search", text: $searchText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            List(magicList.filter { magic in
                searchText.isEmpty ? true : magic.name.lowercased().contains(searchText.lowercased())
            }, id: \.id) { magic in
                MagicRowView(magic: magic)
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
        .background(Color(red: 0.8, green: 0.8, blue: 1))
        .onAppear {
            readMagicData()
        }
        .onChange(of: searchText) { newValue in
            showTab = !newValue.isEmpty && magicList.contains { $0.name.lowercased() == newValue.lowercased() }
        }
    }
    
    
    private func readMagicData() {
        let db = Firestore.firestore()
        
        db.collection("Magic").getDocuments { (snapshot, error) in
            if let error = error {
                print("Error getting Magic documents: \(error)")
            } else {
                var magicArray: [Magic] = []
                for document in snapshot!.documents {
                    let data = document.data()
                    let cost = data["cost"] as? String ?? ""
                    let name = data["name"] as? String ?? ""
                    let type = data["type"] as? String ?? ""
                    
                    let magic = Magic(cost: cost, name: name, type: type)
                    magicArray.append(magic)
                }
                self.magicList = magicArray
            }
        }
    }
}

struct MagicRowView: View {
    let magic: Magic
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Name: \(magic.name)")
                .font(.subheadline)
            Text("Type: \(magic.type)")
                .font(.subheadline)
            Text("Cost: \(magic.cost)")
                .font(.headline)
        }
    }
}

struct MagicView_Previews: PreviewProvider {
    static var previews: some View {
        MagicView()
    }
}
