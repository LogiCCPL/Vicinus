//
//  ViewFactory.swift
//  Vicinus
//
//  Created by Robert Adamczyk on 30.05.23.
//

import SwiftUI

struct FullCoverSheetView: View {

    @StateObject var coordinator: Coordinator = .init()

    let fullCoverSheet: FullCoverSheet
    let parentCoordinator: Coordinator

    var body: some View {
        NavigationStack(path: $coordinator.presentedView) {
            makeFullCoverSheet(fullCoverSheet)
        }
    }

    @ViewBuilder
    private func makeFullCoverSheet(_ fullCoverSheet: FullCoverSheet) -> some View {
        switch fullCoverSheet {
        case .register: Text("REGISTER VIEW")
        case .onboarding: OnboardingView(parentCoordinator: parentCoordinator)
        }
    }
}

struct StandardSheetView: View {

    let standardSheet: StandardSheet

    var body: some View {
        makeStandardSheet(standardSheet)
    }

    @ViewBuilder
    private func makeStandardSheet(_ standardSheet: StandardSheet) -> some View {
        switch standardSheet {
        case .detail: Text("DETAIL")
        }
    }
}

struct DestinationView: View {

    let stackView: StackView

    var body: some View {
        makeDestination(stackView)
    }

    @ViewBuilder
    private func makeDestination(_ view: StackView) -> some View {
        switch view {
        case .chat: Text("CHAT")
        }
    }
}
