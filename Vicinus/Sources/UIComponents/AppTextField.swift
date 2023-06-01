//
//  TextField.swift
//  Vicinus
//
//  Created by Robert Adamczyk on 31.05.23.
//

import SwiftUI

struct AppTextField: View {

    let textField: TextField
    @Binding var text: String
    @Binding var focusedField: TextField?

    @State private var labelHeight: CGFloat = 0
    @State private var showSecureField: Bool = false
    @FocusState private var isFocused: Bool

    var body: some View {
        makeBody()
            .onChange(of: isFocused) { newValue in
                if newValue {
                    focusedField = textField
                }
            }
            .onChange(of: focusedField) { newValue in
                if newValue == textField {
                    isFocused = true
                }
            }
    }

    @ViewBuilder
    private func makeBody() -> some View {
        makeTextField()
            .focused($isFocused)
            .onSubmit(onSubmitTapped)
            .frame(height: 60)
            .padding(.horizontal, 16)
            .apply(.regularM, color: .textDark)
            .background(content: makeBackground)
            .padding(.top, labelHeight * 0.5)
            .overlay(alignment: .topLeading, content: makeLabel)
    }

    @ViewBuilder
    private func makeTextField() -> some View {
        switch textField {
        case .confirmPassword, .newPassword, .oldPassword, .password:
            HStack(spacing: 8) {
                ZStack {
                    SwiftUI.TextField("", text: $text)
                        .opacity(showSecureField ? 1 : 0)
                    SwiftUI.SecureField("", text: $text)
                        .opacity(showSecureField ? 0 : 1)
                }
                (showSecureField ? SFSymbol.eyeSlash.image : SFSymbol.eye.image)
                    .foregroundColor(appColor(.textAction))
                    .onTapGesture {
                        showSecureField.toggle()
                    }
            }
        default:
            SwiftUI.TextField("", text: $text)
        }
    }

    @ViewBuilder
    private func makeLabel() -> some View {
        Text(textField.localizedText)
            .apply(.regularS, color: .textLight, scaling: .fixed)
            .padding(.horizontal, 8)
            .background {
                appColor(.background)
            }
            .padding(.leading, 16)
            .readSize { size in
                labelHeight = size.height
            }
    }

    @ViewBuilder
    private func makeBackground() -> some View {
        RoundedRectangle(cornerRadius: 16)
            .stroke(lineWidth: 1)
            .foregroundColor(appColor(.textFieldStroke))
    }

    private func onSubmitTapped() {
        focusedField = nil
    }
}

extension AppTextField {

    enum TextField {
        case email
        case password
        case oldPassword
        case newPassword
        case confirmPassword

        var localizedText: String {
            switch self {
            case .email: return AppText.AppTextField.email
            case .password: return AppText.AppTextField.password
            case .oldPassword: return AppText.AppTextField.oldPassword
            case .newPassword: return AppText.AppTextField.newPassword
            case .confirmPassword: return AppText.AppTextField.confirmPassword
            }
        }
    }
}

struct AppTextField_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            appColor(.background).ignoresSafeArea()
            VStack(spacing: 16) {
                AppIllustration.login.image
                    .resizable()
                    .scaledToFit()
                AppTextField(textField: .email,
                             text: .constant("email@gmail.com"),
                             focusedField: .constant(nil))
                AppTextField(textField: .password,
                             text: .constant("email@gmail.com"),
                             focusedField: .constant(nil))
                AppTextField(textField: .confirmPassword,
                             text: .constant("email@gmail.com"),
                             focusedField: .constant(nil))
                Spacer()
            }
            .padding(16)
        }
    }
}
