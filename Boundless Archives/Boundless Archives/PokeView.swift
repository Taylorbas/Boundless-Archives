//
//  PokeView.swift
//  Boundless 
//
//  Created by Bassil Taylor on 4/11/24.
//

import SwiftUI
import Firebase

struct PokeView: View {
    @State private var pokemonList: [Pokemon] = []
    @State private var searchText: String = ""
    @State private var selectedPokemon: Pokemon?
    @State private var capturedPokemons: [Pokemon] = []
    @State private var showCapturedTab: Bool = false
    
    var body: some View {
        VStack {
            Text("Pokemon Collection")
                .font(.largeTitle)
                .padding()
            
            TextField("Search", text: $searchText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            List(pokemonList.filter { pokemon in
                searchText.isEmpty ? true : pokemon.name.lowercased().contains(searchText.lowercased())
            }, id: \.id) { pokemon in
                PokemonRowView(pokemon: pokemon)
                    .onTapGesture {
                        selectedPokemon = pokemon
                    }
            }
            .padding()
            
            if let selectedPokemon = selectedPokemon {
                Button(action: {
                    addPokemonToCapturedList(selectedPokemon)
                }) {
                    Image(systemName: "plus.circle.fill")
                        .font(.title)
                        .foregroundColor(.blue)
                }
                .padding()
            }
            
            if showCapturedTab {
                Button(action: {
                    // Action to switch to the captured Pokemon collection
                }) {
                    Text("Captured Pokemon")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding()
            }
        }
        .background(Color(red: 1, green: 0.8, blue: 0.8))
        .onAppear {
            readPokemonData()
        }
        .onChange(of: capturedPokemons) { _ in
            showCapturedTab = !capturedPokemons.isEmpty
        }
    }
    
    private func readPokemonData() {
        let db = Firestore.firestore()
        
        db.collection("Pokemon").getDocuments { (snapshot, error) in
            if let error = error {
                print("Error getting Pokemon documents: \(error)")
            } else {
                var pokemonArray: [Pokemon] = []
                for document in snapshot!.documents {
                    let data = document.data()
                    let id = document.documentID
                    let name = data["name"] as? String ?? ""
                    let type = data["type"] as? String ?? ""
                    
                    let pokemon = Pokemon(id: id, name: name, type: type)
                    pokemonArray.append(pokemon)
                }
                self.pokemonList = pokemonArray
            }
        }
    }
    
    private func addPokemonToCapturedList(_ pokemon: Pokemon) {
        capturedPokemons.append(pokemon)
        selectedPokemon = nil // Deselect the selected Pokemon after adding it to the captured list
    }
}

struct PokemonRowView: View {
    let pokemon: Pokemon
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("ID: \(pokemon.id)")
                .font(.headline)
            Text("Name: \(pokemon.name)")
                .font(.subheadline)
            Text("Type: \(pokemon.type)")
                .font(.subheadline)
        }
    }
}


struct PokeView_Previews: PreviewProvider {
    static var previews: some View {
        PokeView()
    }
}
