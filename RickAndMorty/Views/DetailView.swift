//
//  DetailView.swift
//  RickAndMorty
//
//  Created by selim on 23.04.2023.
//

import SwiftUI

struct DetailView: View {
    
    var characterDetail: Result
    @State private var episodesID = ""
    @State private var date = ""
    
    var body: some View {
        VStack(spacing: 5) {
            Text(characterDetail.name)
                       .font(.custom("Avenir", size: 25))
                       .fontWeight(.bold)
                        AsyncImage(url: URL(string: characterDetail.image)){ image in
                            image.resizable()
                            .frame(width: 275, height: 275)
                            .padding(.horizontal, 50)
                            .padding(.vertical, 20)
                        } placeholder: {
                            ProgressView()
                        }
            VStack(spacing: 0) {
                HStack {
                        Text("Status:      ")
                            .font(.custom("Avenir", size: 22))
                            .fontWeight(.bold)
                        
                    Text(characterDetail.status)
                            .font(.custom("Avenir", size: 22))
                            .fontWeight(.regular)
                            .padding(.leading, 20)
                    Spacer()
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 5)
                    
                HStack {
                        Text("Specy:      ")
                            .font(.custom("Avenir", size: 22))
                            .fontWeight(.bold)
                        
                    Text(characterDetail.species)
                            .font(.custom("Avenir", size: 22))
                            .fontWeight(.regular)
                            .padding(.leading, 20)
                    Spacer()
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 5)
                
                HStack {
                        Text("Gender:    ")
                            .font(.custom("Avenir", size: 22))
                            .fontWeight(.bold)
                        
                    Text(characterDetail.gender)
                            .font(.custom("Avenir", size: 22))
                            .fontWeight(.regular)
                            .padding(.leading, 20)
                    Spacer()
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 5)
                
                HStack {
                        Text("Origin:      ")
                            .font(.custom("Avenir", size: 22))
                            .fontWeight(.bold)
                        
                    Text("\(characterDetail.location.name)")
                            .font(.custom("Avenir", size: 22))
                            .fontWeight(.regular)
                            .padding(.leading, 20)
                    Spacer()
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 5)
                
                HStack {
                    Text("Location:   ")
                        .font(.custom("Avenir", size: 22))
                        .fontWeight(.bold)
                    
                    Text("\(characterDetail.location.name)")
                        .font(.custom("Avenir", size: 22))
                        .fontWeight(.regular)
                        .padding(.leading, 20)
                    
                    Spacer()
                }
                .padding(.horizontal, 20)
                .padding(.top, 5)
                HStack {
                    Text("Episodes:  ")
                        .font(.custom("Avenir", size: 22))
                        .fontWeight(.bold)
                    
                    Text(episodesID)
                        .font(.custom("Avenir", size: 22))
                        .fontWeight(.regular)
                        .padding(.leading, 20)
                    
                    Spacer()
                }
                .padding(.horizontal, 20)
                .padding(.top, 5)
                HStack {
                    Text("Created at:")
                        .font(.custom("Avenir", size: 22))
                        .fontWeight(.bold)
                    
                    Text(formatDate(dateString: characterDetail.created))
                        .font(.custom("Avenir", size: 22))
                        .fontWeight(.regular)
                        .padding(.leading, 20)
                    
                        Spacer()
                }
                .padding(.bottom,20)
                .padding(.horizontal, 20)
                .padding(.top, 5)
                
                }
               }
                .onAppear{
                    parseEpisodes(urls: characterDetail.episode)
                }
            
            
            Spacer()
        
        
        
        }
    
    func formatDate(dateString: String) -> String {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
            guard let date = dateFormatter.date(from: dateString) else { return "" }
            
            dateFormatter.dateFormat = "dd.MM.yyyy HH:mm"
            return dateFormatter.string(from: date)
        }
    
    func parseEpisodes (urls: [String]) {
        var episodes = [String]()
        for url in urls {
            let components = url.components(separatedBy: "episode/")
            if urls.count == 1 {
                episodes.append(components[1])
            }
            
            else if components.count > 1 {
                episodes.append(components[1])
            }
        }
        episodesID = episodes.joined(separator: ",")
        
    }
   
    
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView( characterDetail: Result(
            id: 1,
            name: "Rick Sanchez",
            status: "Alive",
            species: "Human",
            type: "",
            gender: "Male",
            origin: Locations(name: "Earth (C-137)", url: "https://rickandmortyapi.com/api/location/1"),
            location: Locations(name: "Earth (Replacement Dimension)", url:"https://rickandmortyapi.com/api/location/20"),
            image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg",
            episode:["https://rickandmortyapi.com/api/episode/6"],
            url: "https://rickandmortyapi.com/api/character/1",
            created: "2017-11-04T18:48:46.250Z"
        )
        )
    }
}
    
