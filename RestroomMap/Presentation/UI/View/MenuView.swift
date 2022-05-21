//
//  MenuView.swift
//  RestroomMap
//
//  Created by sasaki.ken on 2022/05/14.
//

import SwiftUI

struct MenuView: View {
    // @ObservedObject var viewModel: MenuViewModel
    // let controller: MenuController

    var body: some View {
        GeometryReader { _ in
            Form {
                Section {
                    MenuButtonView(text: "ピンの種類について") {

                    }
                }
                Section {
                    MenuButtonView(text: "レビュー") {

                    }
                    MenuButtonView(text: "シェア") {

                    }
                    MenuButtonView(text: "お問合せ") {

                    }
                }
                Section {
                    MenuButtonView(text: "開発者にビールを奢る") {

                    }
                }
            }
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
