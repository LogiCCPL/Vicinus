//
//  Login+ViewModel.swift
//  Vicinus
//
//  Created by Robert Adamczyk on 31.05.23.
//

import SwiftUI

extension LoginView {

    final class ViewModel: ObservableObject {

        @Published var email: String = ""
        @Published var password: String = ""
        @Published var focusedField: AppTextField.TextField?

        private let coordinator: Coordinator

        init(coordinator: Coordinator) {
            self.coordinator = coordinator
        }

        func onLoginTapped() {
            
        }

        func onForgotPasswordTapped() {

        }

        func onRegisterTapped() {

        }
    }
}
