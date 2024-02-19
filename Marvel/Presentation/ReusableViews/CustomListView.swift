//
//  CustomListView.swift
//  Marvel
//
//  Created by Emerson Sampaio on 13/02/24.
//

import SwiftUI

struct CustomListView<Items, Destination, ItemView>: View
where Items: Identifiable, Items: Equatable, Destination: View, ItemView: View {
    
    let items: [Items]
    let navigationDestination: (Items) -> Destination
    let itemView: (Items) -> ItemView
    
    init(items: [Items],
         @ViewBuilder navigationDestination: @escaping (Items) -> Destination,
         @ViewBuilder itemView: @escaping (Items) -> ItemView) {
        self.items = items
        self.navigationDestination = navigationDestination
        self.itemView = itemView
    }
    
    var body: some View {
        List {
            ForEach(items) { item in
                ZStack(
                    content: {
                        itemView(item)
                        NavigationLink(
                            destination: navigationDestination(item)
                                .toolbar(.hidden, for: .tabBar)
                        ) {
                            EmptyView()
                        }
                        .opacity(0)
                        .buttonStyle(PlainButtonStyle())
                    }
                )
                .listRowSeparator(.hidden)
                .listRowInsets(EdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 0))
            }
        }
        .listStyle(PlainListStyle())
        .scrollIndicators(.hidden)
    }
}
