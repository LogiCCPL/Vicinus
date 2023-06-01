//
//  VicinusApp.swift
//  Vicinus
//
//  Created by Robert Adamczyk on 30.05.23.
//

import SwiftUI

@main
struct VicinusApp: App {

    @StateObject var coordinator: Coordinator

    init() {
        _coordinator = .init(wrappedValue: .init())
    }

    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $coordinator.presentedView) {
                HomeView(coordinator: coordinator)
                    .navigationDestination(for: StackView.self) {
                        DestinationView(stackView: $0)
                    }
            }
            .fullScreenCover(item: $coordinator.presentedFullCoverSheet) {
                FullCoverSheetView(fullCoverSheet: $0, parentCoordinator: coordinator)
            }
            .sheet(item: $coordinator.presentedStandardSheet) {
                StandardSheetView(standardSheet: $0)
            }
            .preferredColorScheme(.light)
        }
    }
}
