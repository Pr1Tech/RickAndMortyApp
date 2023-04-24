//
//  LocationModel.swift
//  RickAndMorty
//
//  Created by selim on 17.04.2023.
//

import Foundation

struct Location: Codable {
    let results: [Results]
}


// MARK: - Result
struct Results: Codable,Hashable {
    let id: Int
    let name: String
    let residents: [String]
    let url: String
}
