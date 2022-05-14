//
//  MapFocusView.swift
//  RestroomMap
//
//  Created by sasaki.ken on 2022/05/14.
//

import SwiftUI

struct MapFocusView: View {
    var onCancelButtonTapped: (() -> Void)?
    var onAddButtonTapped: (() -> Void)?

    var body: some View {
        VStack {
            Spacer()
            Image("focus")
                .resizable()
                .frame(width: 50, height: 50)
            Spacer()
            HStack {
                MapFocusButtonView(text: "キャンセル") {
                    onCancelButtonTapped?()
                }
                MapFocusButtonView(text: "登録") {
                    onAddButtonTapped?()
                }
            }
        }
    }
}

struct MapFocusView_Previews: PreviewProvider {
    static var previews: some View {
        MapFocusView()
    }
}
