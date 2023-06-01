//
//  Coordinator.swift
//  Vicinus
//
//  Created by Robert Adamczyk on 30.05.23.
//

import SwiftUI

final class Coordinator: ObservableObject {

    @Published var presentedView: [StackView] = []
    @Published var presentedStandardSheet: StandardSheet?
    @Published var presentedFullCoverSheet: FullCoverSheet?

    func showSheet(_ sheet: Sheet) {
        switch sheet {
        case .fullCoverSheet(let fullCoverSheet): presentedFullCoverSheet = fullCoverSheet
        case .standardSheet(let standardSheet): presentedStandardSheet = standardSheet
        }
    }

    func dismissSheet() {
        presentedStandardSheet = nil
        presentedFullCoverSheet = nil
    }

    func pushView(_ view: StackView) {
        presentedView.append(view)
    }

    func popView() {
        presentedView.removeLast()
    }
}
