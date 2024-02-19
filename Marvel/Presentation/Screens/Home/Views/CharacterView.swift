//
//  CharacterView.swift
//  Marvel
//
//  Created by Emerson Sampaio on 12/02/24.
//

import SwiftUI

struct CharacterView: View {
    
    let character: Character
    
    var body: some View {
        ZStack(alignment: .bottom) {
            
            AsyncImage(url: character.thumbnailURL) { image in
                image
                    .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 120)
                        .clipped()

                
            } placeholder: {
            }
            
            ZStack {
                Text(character.name ?? "")
                    .font(.body)
                    .foregroundColor(.white)
                    .fontWeight(.bold)
            }
            .frame(height: 32)
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            .background(Color(.black))
            .opacity(0.6)
        }
    }
}

struct CharacterView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterView(character: Character.dummyCharacter())
    }
}

