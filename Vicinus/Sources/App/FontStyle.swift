//
//  FontStyle.swift
//  Vicinus
//
//  Created by Robert Adamczyk on 30.05.23.
//

import SwiftUI

enum FontStyle {

    case regularS
    case regularM
    case regularL
    case mediumM
    case mediumL
    case boldM
    case boldH1

    var size: CGFloat {
        switch self {
        case .regularS: return Size.S.value
        case .regularM, .boldM, .mediumM: return Size.M.value
        case .regularL, .mediumL: return Size.L.value
        case .boldH1: return Size.H1.value
        }
    }

    var font: AppFont {
        switch self {
        case .regularS, .regularM, .regularL: return .robotoRegular
        case .mediumL, .mediumM: return .robotoMedium
        case .boldM, .boldH1: return .robotoBold
        }
    }

    func makeFontStyle(scaling: Scaling) -> Font {
        switch scaling {
        case .dynamic: return .custom(font.rawValue, size: size)
        case .fixed: return .custom(font.rawValue, fixedSize: size)
        }
    }
}

extension FontStyle {

    enum Size {
        case S
        case M
        case L
        case H1

        var value: CGFloat {
            switch self {
            case .S: return 16
            case .M: return 18
            case .L: return 20
            case .H1: return 32
            }
        }
    }

    enum Scaling {
        case dynamic
        case fixed
    }

    enum AppFont: String {
        case robotoBold = "Roboto-Bold"
        case robotoMedium = "Roboto-Medium"
        case robotoRegular = "Roboto-Regular"
    }
}

extension View {

    func apply(_ fontStyle: FontStyle, color: AppColor, scaling: FontStyle.Scaling = .dynamic) -> some View {
        self
            .font(fontStyle.makeFontStyle(scaling: scaling))
            .foregroundColor(appColor(color))
    }
}
