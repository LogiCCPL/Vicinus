//
//  Storage.swift
//  Vicinus
//
//  Created by Robert Adamczyk on 30.05.23.
//

import Foundation

enum Storage {

    case shouldShowOnboarding

    var key: String {
        switch self {
        case .shouldShowOnboarding: return "shouldShowOnboarding"
        }
    }
}
