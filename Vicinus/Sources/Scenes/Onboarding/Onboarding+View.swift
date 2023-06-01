//
//  Onboarding+View.swift
//  Vicinus
//
//  Created by Robert Adamczyk on 31.05.23.
//

import SwiftUI

struct OnboardingView: View {

    @StateObject var viewModel: ViewModel

    init(parentCoordinator: Coordinator) {
        _viewModel = .init(wrappedValue: .init(parentCoordinator: parentCoordinator))
    }

    var body: some View {
        ZStack {
            appColor(.background).ignoresSafeArea()
            VStack(spacing: 0) {
                TabView(selection: $viewModel.currentPage) {
                    ForEach(viewModel.pages, id: \.self) { page in
                        makePageContent(page: page)
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                makeIndicatorView(current: viewModel.currentPage, count: viewModel.pages.count)
            }
        }
    }

    private func makePageContent(page: Page) -> some View {
        VStack(alignment: .center, spacing: 16) {
            page.illustration.image
                .resizable()
                .scaledToFit()
            Text(page.title)
                .apply(.boldH1, color: .textDark)
            Text(page.description)
                .apply(.regularM, color: .textDark)
                .multilineTextAlignment(.center)
            Spacer()
            if let buttonText = page.buttonText {
                AppButton(style: .fill(buttonText), action: viewModel.onButtonTapped)
            }
        }
        .padding(16)
        .tag(viewModel.pages.firstIndex(of: page) ?? 0)
    }

    private func makeIndicatorView(current: Int, count: Int) -> some View {
        HStack(spacing: 8) {
            ForEach(0..<count, id: \.self) { index in
                Circle()
                    .frame(width: 10, height: 10)
                    .foregroundColor(appColor(index == current ? .currentPageIndicator : .pageIndicator))
                    .animation(.easeInOut, value: current)
            }
        }
    }
}

struct Onboarding_View_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView(parentCoordinator: .init())
    }
}
