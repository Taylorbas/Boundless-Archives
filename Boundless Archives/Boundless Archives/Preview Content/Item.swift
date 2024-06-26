//
//  Item.swift
//  Boundless Archives
//
//  Created by Bassil Taylor on 4/3/24.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
