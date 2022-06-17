//
//  MenuViewBuilder.swift
//  RestroomMap
//
//  Created by sasaki.ken on 2022/05/22.
//

import Foundation

final class MenuViewBuilder {
    static let shared = MenuViewBuilder()

    private init() {}

    func build() -> MenuView {
        let viewModel = MenuViewModel()
        let presenter = MenuPresenter(viewModel: viewModel)

        let pinTypeUseCaseInput = PinTypeUseCase(output: presenter)
        let reviewUseCaseInput = ReviewUseCase()
        let shareUseCaseInput = ShareUseCase(output: presenter)
        let inquiryUseCaseInput = InquiryUseCase(output: presenter)
        let billingUseCaseInput = BillingUseCase(output: presenter)

        let controller = MenuController(
            pinTypeUseCaseInput: pinTypeUseCaseInput,
            reviewUseCaseInput: reviewUseCaseInput,
            shareUseCaseInput: shareUseCaseInput,
            inquiryUseCaseInput: inquiryUseCaseInput,
            billingUseCaseInput: billingUseCaseInput
        )

        let view = MenuView(viewModel: viewModel, controller: controller)

        return view
    }
}
