//
//  ComicItemView.swift
//  Marvel
//
//  Created by Emerson Sampaio on 13/02/24.
//

import Foundation
import SwiftUI

struct ComicItemView: View {
    
    let comic: Comic
    
    var body: some View {
        VStack(alignment: .center) {
            AsyncImage(url: comic.thumbnailURL) { image in
                image
                    .resizable()
                    .aspectRatio(2/3, contentMode: .fit)
                    .cornerRadius(15)
                    .frame(height: 250)
            } placeholder: {
            }
            
            Text(comic.title ?? "")
                .lineLimit(2)
                .multilineTextAlignment(.center)
                .font(.headline)
                .frame(width: 150)
        }
        .padding([.leading], 10)
    }
}

struct ComicItemView_Previews: PreviewProvider {
    
    static var previews: some View {
        ComicItemView(comic: Comic.dummyComic())
    }
}
