//
//  CharacterViewModel.swift
//  RickAndMorty
//
//  Created by selim on 21.04.2023.
//

import Foundation
import Alamofire

class CharacterViewModel : ObservableObject {
    
    @Published var characters : [Result] = []
    
    init() {
        getCharacters()
    }
    
    func getCharacters(characterIDs: String = "38,45,71,82,83,92,112,114,116,117,120,127,155,169,175,179,186,201,216,239,271,302,303,338,343,356,394") {
        
        AF.request("https://rickandmortyapi.com/api/character/\(characterIDs)", method: .get)
            .validate()
            .responseDecodable(of: [Result].self) { response in
                switch response.result {
                case .success(let character):
                    self.characters = character
                case .failure(let error):
                    print("Error: \(error)")
                }
            }
    }
}

