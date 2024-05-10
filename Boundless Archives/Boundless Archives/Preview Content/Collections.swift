//
//  Collections.swift
//  Boundless 
//
//  Created by Bassil Taylor on 5/6/24.
//

import Foundation

struct Pokemon: Identifiable, Equatable {
    let id: String
    let name: String
    let type: String
}



// Define Magic class
struct Magic {
    let id = UUID()
    let cost: String
    let name: String
    let type: String
}

// Define Sports class
struct Sports {
    let id = UUID()
    let name: String
    let sport: String
    let year: String
    let autograph: Bool
}

