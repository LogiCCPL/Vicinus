//
//  Home+View.swift
//  Vicinus
//
//  Created by Robert Adamczyk on 30.05.23.
//

import SwiftUI

struct HomeView: View {

    @StateObject var viewModel: ViewModel

    init(coordinator: Coordinator) {
        _viewModel = .init(wrappedValue: .init(coordinator: coordinator))
    }

    var body: some View {
        ZStack {
            if viewModel.isLoggedIn {
                Text("MAP")
            } else {
                LoginView(coordinator: viewModel.coordinator)
            }
        }
        .onAppear(perform: viewModel.onViewAppear)
    }
}
