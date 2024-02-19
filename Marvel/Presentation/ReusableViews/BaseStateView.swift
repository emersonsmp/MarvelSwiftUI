//
//  BaseStateView.swift
//  Marvel
//
//  Created by Emerson Sampaio on 12/02/24.
//

import SwiftUI

struct BaseStateView<VM, SuccessView, NoItemsView, ErrorView, LoadingView>: View
where VM: ViewModel, SuccessView: View, NoItemsView: View, ErrorView: View,
      LoadingView: View {
    
    @ObservedObject var viewModel: VM
    let successView: () -> SuccessView
    let emptyView: () -> NoItemsView
    let errorView: (String) -> ErrorView
    let loadingView: () -> LoadingView
    
    
    init(viewModel: VM,
         @ViewBuilder successView: @escaping () -> SuccessView,
         @ViewBuilder emptyView: @escaping () -> NoItemsView
         = { MessageView(message: "noDataFound".localized()) },
         @ViewBuilder errorView: @escaping (String) -> ErrorView
         = {MessageView(message: $0)},
         @ViewBuilder loadingView: @escaping () -> LoadingView
         = { ProgressView() }) {
        self.viewModel = viewModel
        self.successView = successView
        self.emptyView = emptyView
        self.errorView = errorView
        self.loadingView = loadingView
    }
    
    var body: some View {
        ZStack {
            successView()
            switch viewModel.state {
            case .initial,
                 .loading:
                loadingView()
            case .error(let errorMessage):
                errorView(errorMessage)
            case .empty:
                emptyView()
            default:
                EmptyView()
            }
        }
    }
}
