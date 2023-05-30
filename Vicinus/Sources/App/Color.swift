//
//  Color.swift
//  Vicinus
//
//  Created by Robert Adamczyk on 30.05.23.
//

import SwiftUI

enum AppColor: String {
    case background = "background"
    case buttonBackground = "buttonBackground"
    case buttonText = "buttonText"
    case textDark = "textDark"
}

func appColor(_ appColor: AppColor) -> Color {
    .init(appColor.rawValue)
}
