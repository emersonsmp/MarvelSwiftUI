//
//  HeroProfile.swift
//  Marvel
//
//  Created by Emerson Sampaio on 13/02/24.
//

import Foundation
import SwiftUI

struct CharacterProfileView: View {
    let character: Character
    @StateObject var viewModel = Resolver.shared.resolve(CharacterProfileViewModel.self)
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        NavigationStack{
            ScrollView{
                ZStack(alignment: .topLeading){
                    coverImageView
                    contentView
                }
            }
            .scrollIndicators(.hidden)
            .ignoresSafeArea()
            .onAppear {
                Task {
                    viewModel.checkFavorite(character: character)
                    await viewModel.loadComics(forCharacter: character.id ?? 0)
                }
            }
        }
    }
    
    private var coverImageView: some View {
        AsyncImage(url: character.thumbnailURL) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(
                    height: 350,
                    alignment: .center
                )
        } placeholder: {
            ProgressView()
        }
    }
    
    private var contentView: some View {
        LazyVStack(alignment: .leading) {
            Spacer().frame(height: 380)
            
            HStack{
                Text(character.name ?? "")
                    .font(.system(.largeTitle, weight: .bold))
                
                Button {
                    viewModel.toggleFavorite(character: character)
                } label: {
                    Image(
                        systemName: viewModel.isFavorite ?
                        "heart.fill" : "heart"
                    )
                    .foregroundColor(
                        viewModel.isFavorite ?
                            .red : .gray
                    )
                    .font(.system(size: 25))
                }
            }
            .padding([.bottom], 10)
            
            Text(character.safeDescription)
                .font(.body)
                .padding([.bottom], 10)
                .multilineTextAlignment(.leading)
            
            comicsSection
        }
        .padding([.leading,.trailing, .bottom], 20)
    }
    
    private var comicsSection: some View {
        BaseStateView(viewModel: viewModel) {
            VStack(alignment: .leading) {
                
                Text("comics".localized())
                    .font(.system(.title2, weight: .bold))
                    .padding([.bottom], 5)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack {
                        ForEach(viewModel.comics) { item in
                            ComicItemView(comic: item)
                        }
                    }
                }
            }
        }
    }
    
}

#Preview {
    CharacterProfileView(character: Character.dummyCharacter())
}
