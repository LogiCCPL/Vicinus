//
//  FontStyle.swift
//  Vicinus
//
//  Created by Robert Adamczyk on 30.05.23.
//

import SwiftUI

private enum AppFont: String {
    case robotoBold = "Roboto-Bold"
    case robotoMedium = "Roboto-Medium"
    case robotoRegular = "Roboto-Regular"
}

enum FontStyle {

    case regularS
    case regularM
    case regularL

    case mediumL

    case boldM

    case boldH1

    var font: Font {
        switch self {
        case .regularS: return .custom(AppFont.robotoRegular.rawValue, size: 16)
        case .regularM: return .custom(AppFont.robotoRegular.rawValue, size: 18)
        case .regularL: return .custom(AppFont.robotoRegular.rawValue, size: 20)
        case .mediumL: return .custom(AppFont.robotoMedium.rawValue, size: 20)
        case .boldM: return .custom(AppFont.robotoBold.rawValue, size: 18)
        case .boldH1: return .custom(AppFont.robotoBold.rawValue, size: 32)
        }
    }
}

extension View {

    func apply(_ fontStyle: FontStyle, color: Color) -> some View {
        self
            .font(fontStyle.font)
            .foregroundColor(color)
    }
}
