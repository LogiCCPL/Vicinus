//
//  Assets.swift
//  Vicinus
//
//  Created by Robert Adamczyk on 31.05.23.
//

import SwiftUI

enum AppIllustration: String {
    case chooseYourDestination = "choose_your_destination"
    case globalConversations = "global_conversations"
    case nearbyConnections = "nearby_connections"
    case personalizeYourProfile = "personalize_your_profile"
    case login = "login_illustration"

    var image: Image {
        .init(rawValue)
    }
}

enum SFSymbol: String {
    case eye = "eye"
    case eyeSlash = "eye.slash"

    var image: Image {
        .init(systemName: rawValue)
    }
}
