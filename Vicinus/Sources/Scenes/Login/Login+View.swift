//
//  Login+View.swift
//  Vicinus
//
//  Created by Robert Adamczyk on 31.05.23.
//

import SwiftUI

struct LoginView: View {

    @StateObject var viewModel: ViewModel

    init(coordinator: Coordinator) {
        _viewModel = .init(wrappedValue: .init(coordinator: coordinator))
    }

    var body: some View {
        ZStack {
            appColor(.background).ignoresSafeArea()
            ScrollView {
                VStack(alignment: .trailing, spacing: 24) {
                    VStack(spacing: 16) {
                        AppIllustration.login.image
                            .resizable()
                            .scaledToFit()
                        AppTextField(textField: .email, text: $viewModel.email, focusedField: $viewModel.focusedField)
                        AppTextField(textField: .password, text: $viewModel.password, focusedField: $viewModel.focusedField)
                    }
                    AppButton(style: .text(AppText.Auth.forgotPassword), action: viewModel.onForgotPasswordTapped)
                    AppButton(style: .fill(AppText.Auth.login), action: viewModel.onLoginTapped)
                    Spacer()
                    HStack {
                        Text(AppText.Auth.doNotHaveAccount)
                            .apply(.mediumM, color: .textDark)
                        AppButton(style: .text(AppText.Auth.register), action: viewModel.onRegisterTapped)
                    }
                    .frame(maxWidth: .infinity)
                }
                .padding(16)
            }
            .scrollBounceBehavior(.basedOnSize)
        }
    }
}
