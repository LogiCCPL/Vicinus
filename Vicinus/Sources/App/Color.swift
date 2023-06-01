//
//  Color.swift
//  Vicinus
//
//  Created by Robert Adamczyk on 30.05.23.
//

import SwiftUI

enum AppColor: String {
    case background
    case buttonBackground
    case buttonText
    case textDark
    case currentPageIndicator
    case pageIndicator
    case textFieldStroke
    case textLight
    case textAction

    var rawValue: String {
        switch self {
        case .background: return "Light"
        case .buttonBackground: return "LightGreen"
        case .buttonText: return "White"
        case .textDark: return "DarkGreen"
        case .currentPageIndicator: return "DarkGreen"
        case .pageIndicator: return "LightGreen"
        case .textFieldStroke: return "LightGreen"
        case .textLight: return "LightGreen"
        case .textAction: return "Green"
        }
    }
}

func appColor(_ appColor: AppColor) -> Color {
    .init(appColor.rawValue)
}
