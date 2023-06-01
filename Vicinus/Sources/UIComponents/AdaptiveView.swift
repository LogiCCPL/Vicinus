//
//  AdaptiveView.swift
//  Vicinus
//
//  Created by Robert Adamczyk on 01.06.23.
//

import SwiftUI

struct AdaptiveView<Content: View>: View {

    var content: () -> Content

    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }

    var body: some View {
        ViewThatFits(in: .vertical) {
            content()

            ScrollView {
                content()
            }
        }
    }
}
