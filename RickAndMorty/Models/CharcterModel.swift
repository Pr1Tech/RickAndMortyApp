//
//  CharcterModel.swift
//  RickAndMorty
//
//  Created by selim on 17.04.2023.
//

// MARK: - Character
struct Character: Codable {
    let results: [Result]
}


// MARK: - Result
struct Result: Codable,Identifiable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let origin : Locations
    let location: Locations
    let image: String
    let episode: [String]
    let url: String
    let created: String
    
    
}

// MARK: - Location

struct Locations: Codable {
    let name: String
    let url: String
}
