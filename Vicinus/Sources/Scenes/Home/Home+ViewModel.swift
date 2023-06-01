//
//  Home+ViewModel.swift
//  Vicinus
//
//  Created by Robert Adamczyk on 30.05.23.
//

import SwiftUI

extension HomeView {

    final class ViewModel: ObservableObject {

        @AppStorage(Storage.shouldShowOnboarding.key) private var shouldShowOnboarding: Bool = true

        var isLoggedIn: Bool {
            return false
        }

        private(set) var coordinator: Coordinator

        init(coordinator: Coordinator) {
            self.coordinator = coordinator
        }

        func onViewAppear() {
            if shouldShowOnboarding {
                coordinator.showSheet(.fullCoverSheet(.onboarding))
            }
        }
    }
}
