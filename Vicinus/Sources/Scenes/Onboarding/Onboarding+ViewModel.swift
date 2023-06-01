//
//  Onboarding+ViewModel.swift
//  Vicinus
//
//  Created by Robert Adamczyk on 31.05.23.
//

import SwiftUI

extension OnboardingView {

    final class ViewModel: ObservableObject {

        @AppStorage(Storage.shouldShowOnboarding.key) private var shouldShowOnboarding = true

        @Published var currentPage: Int = 0

        let pages: [Page] = [
            .init(title: AppText.Onboarding.pageOneTitle,
                  description: AppText.Onboarding.pageOneDescription,
                  illustration: .nearbyConnections),
            .init(title: AppText.Onboarding.pageTwoTitle,
                  description: AppText.Onboarding.pageTwoDescription,
                  illustration: .globalConversations),
            .init(title: AppText.Onboarding.pageThreeTitle,
                  description: AppText.Onboarding.pageThreeDescription,
                  illustration: .chooseYourDestination),
            .init(title: AppText.Onboarding.pageFourTitle,
                  description: AppText.Onboarding.pageFourDescription,
                  illustration: .personalizeYourProfile,
                  buttonText: AppText.Onboarding.buttonText),
        ]

        private let parentCoordinator: Coordinator

        init(parentCoordinator: Coordinator) {
            self.parentCoordinator = parentCoordinator
        }

        func onButtonTapped() {
            shouldShowOnboarding = false
            parentCoordinator.dismissSheet()
        }
    }
}

extension OnboardingView {

    struct Page: Hashable {

        var title: String
        var description: String
        var illustration: AppIllustration
        var buttonText: String?
    }
}
