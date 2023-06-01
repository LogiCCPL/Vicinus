//
//  Button.swift
//  Vicinus
//
//  Created by Robert Adamczyk on 31.05.23.
//

import SwiftUI

struct AppButton: View {

    let style: Style
    let action: () -> Void

    var body: some View {
        SwiftUI.Button {
            action()
        } label: {
            makeBody()
        }
    }

    @ViewBuilder
    private func makeBody() -> some View {
        switch style {
        case .fill(let text):
            Text(text)
                .apply(.boldM, color: .buttonText)
                .frame(height: 54)
                .frame(maxWidth: .infinity, alignment: .center)
                .background {
                    RoundedRectangle(cornerRadius: 16)
                        .foregroundColor(appColor(.buttonBackground))
                }
        case .text(let text):
            Text(text)
                .apply(.mediumM, color: .textAction)
        }
    }
}

extension AppButton {

    enum Style {
        case fill(String)
        case text(String)
    }
}
