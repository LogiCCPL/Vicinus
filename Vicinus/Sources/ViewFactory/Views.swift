//
//  Views.swift
//  Vicinus
//
//  Created by Robert Adamczyk on 30.05.23.
//

import Foundation

enum Sheet {
    case fullCoverSheet(FullCoverSheet)
    case standardSheet(StandardSheet)
}

enum FullCoverSheet: Identifiable {
    case register
    case onboarding

    var id: String {
        switch self {
        case .register: return "1"
        case .onboarding: return "2"
        }
    }
}

enum StandardSheet: Identifiable {
    case detail

    var id: String {
        switch self {
        case .detail: return "1"
        }
    }
}

enum StackView {
    case chat
}
