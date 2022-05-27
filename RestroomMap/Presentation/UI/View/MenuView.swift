//
//  MenuView.swift
//  RestroomMap
//
//  Created by sasaki.ken on 2022/05/14.
//

import SwiftUI

struct MenuView: View {
    @ObservedObject var viewModel: MenuViewModel
    let controller: MenuController

    var body: some View {
        Form {
            Section {
                MenuButtonView(text: "ピンの種類について") {

                }
            }
            Section {
                MenuButtonView(text: "レビュー") {
                    controller.onReviewButtontapped()
                }
                MenuButtonView(text: "シェア") {
                    controller.onShareButtonTapped()
                }
                .sheet(isPresented: $viewModel.isShowShareSheet) {
                    ShareSheetView(
                        text: viewModel.shareText,
                        image: viewModel.shareImage,
                        url: viewModel.shareUrl
                    )
                }
                MenuButtonView(text: "お問い合せ") {
                    controller.onInquiryButtonTapped()
                }
                .sheet(isPresented: $viewModel.isShowInquiryView) {
                    if let url = viewModel.inquiryUrl {
                        SafariView(url: url)
                    }
                }
            }
            Section {
                MenuButtonView(text: "開発者にビールを奢る") {

                }
            }
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuViewBuilder.shared.build()
    }
}
