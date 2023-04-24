//
//  ContentView.swift
//  RickAndMorty
//
//  Created by selim on 16.04.2023.
//

import SwiftUI



struct ContentView: View {
    @StateObject private var locationVM = LocationViewModel()
    @ObservedObject var characterVM = CharacterViewModel()
    
    @State private var characterID = ""
    @State private var selectedButtonIndex = 0
    @State private var genderImage = ""
    
    var body: some View {
        
        NavigationStack{
            VStack{
                Image("RickAndMortyHeader").resizable().frame(width:150,height: 100)
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(locationVM.locations.indices, id: \.self) { index  in
                            let location = locationVM.locations[index]
                            Button(action: {
                                
                                parseCharacterIDs(urls: location.residents)
                                charcaterCall(ids: characterID)
                                characterID = ""
                                selectedButtonIndex = index
                            } ){
                                Text(location.name)
                                    .padding(5.0)
                                    .foregroundColor(.black)
                                    
                                    .background(selectedButtonIndex == index ? Color.white : Color.gray)
                                    .frame(maxWidth: .infinity)
                                    .border(Color.black, width: 1)
                                    .cornerRadius(5)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 5,style: .continuous)
                                            .stroke(.black, lineWidth:2 )
                                        
                                    )
                                    .padding(4)
                            }
                            
                            
                        }
                    }
                    .padding(.leading,30)
                    .task {
                        await locationVM.getLocationData()
                    }
                }
                
                
                ScrollView(.vertical, showsIndicators: false){
                    ForEach(characterVM.characters, id: \.id) { characters in
                        
                        
                        
                        NavigationLink{
                            DetailView(characterDetail: characters)
                        } label: {
                            HStack {
                                AsyncImage(url: URL(string: characters.image)){ image in
                                    image.resizable()
                                    
                                } placeholder: {
                                    ProgressView()
                                }
                                .frame(width: 100, height: 100)

                                
                                VStack(alignment:.leading) {
                                    
                                    
                                    Text(characters.name)
                                        .font(.headline)
                                        .fontWeight(.medium)
                                        .font(Font.custom("Avenir", size: 22))
                                    
                                }
                                .foregroundColor(.black)
                                switch characters.gender {
                                case "Male":
                                    Image("MaleIcon")
                                        .resizable()
                                        .frame(width: 80, height: 80)
                                        .padding(.leading,30)
                                case "Female":
                                    Image("FemaleIcon")
                                        .resizable()
                                        .frame(width: 80, height: 80)
                                        .foregroundColor(.pink)
                                        .padding(.leading,30)
                                case "Genderless":
                                    Image("GenderlessIcon")
                                        .resizable()
                                        .frame(width: 80, height: 80)
                                        .padding(.leading,30)
                                default:
                                    Image("UnknowIcon")
                                        .resizable()
                                        .frame(width: 80, height: 80)
                                        .padding(.leading,30)
                                }
                                
                                
                            }
                            .frame(maxWidth:.infinity,maxHeight:.infinity,alignment:.leading)
                            .border(.black, width: 3)
                            .padding(10)
                            
                        }
                        
                    }
                    
                    
                }
                
                
            }
        }
    }
    
    func genders(gender :String) {
        if gender == "Female" {
            genderImage = "MaleIcon"
        } else if gender == "Female" {
            genderImage = "FemaleIcon"
        } else if gender == "Genderless" {
            genderImage = "GenderlessIcon"
        } else {
            genderImage = "UnknowIcon"
        }
    }
    
    func charcaterCall(ids: String){
        characterVM.getCharacters(characterIDs: ids)
    }
    
    func parseCharacterIDs (urls: [String]) {
        var characterIDs = [String]()
            for url in urls {
                let components = url.components(separatedBy: "character/")
                if components.count > 1 {
                    characterIDs.append(components[1])
                }
            }
            characterID = characterIDs.joined(separator: ",")    }
    
}
    
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

