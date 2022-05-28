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

        let view = MenuView(
            viewModel: viewModel,
            controller: MenuController(
                pinTypeUseCase: PinTypeUseCase(
                    presenter: MenuPresenter(
                        viewModel: viewModel
                    )
                ),
                reviewUseCase: ReviewUseCase(
                    presenter: MenuPresenter(
                        viewModel: viewModel
                    )
                ),
                shareUseCase: ShareUseCase(
                    presenter: MenuPresenter(
                        viewModel: viewModel
                    )
                ),
                inquiryUseCase: InquiryUseCase(
                    presenter: MenuPresenter(
                        viewModel: viewModel
                    )
                ),
                billingUseCase: BillingUseCase(
                    presenter: MenuPresenter(
                        viewModel: viewModel
                    )
                )
            )
        )

        return view
    }
}
