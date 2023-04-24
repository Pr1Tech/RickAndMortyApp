//
//  LocationViewModel.swift
//  RickAndMorty
//
//  Created by selim on 21.04.2023.
//

import Foundation

@MainActor
class LocationViewModel : ObservableObject {
    
    
    
    @Published var urlLocation = "https://rickandmortyapi.com/api/location"
    @Published var locations : [Results] = []
    
    func getLocationData() async {
    
        print("We are accessing the url \(urlLocation)")
        
        guard let url = URL(string: urlLocation) else {
            print("Error: Could not create a Url From \(urlLocation)")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            guard let location = try? JSONDecoder().decode(Location.self, from: data) else {
                print("Json Error: Could not decode returned Json data")
                return
            }
            self.locations = location.results
            
        } catch {
            print("Error: Could not get data From \(urlLocation)")
        }
        
        
        
    }
    
}
