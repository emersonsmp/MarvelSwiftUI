//
//  MessageView.swift
//  Marvel
//
//  Created by Emerson Sampaio on 13/02/24.
//

import Foundation
import SwiftUI

struct MessageView: View {
    let message: String

    var body: some View {
        VStack {
            Spacer()
            Text(message)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.gray)
            Spacer()
        }
    }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView(message: "Hello World!")
    }
}
