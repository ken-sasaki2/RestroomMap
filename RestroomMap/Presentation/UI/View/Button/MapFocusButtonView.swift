//
//  MapFocusButtonView.swift
//  RestroomMap
//
//  Created by sasaki.ken on 2022/05/14.
//

import SwiftUI

struct MapFocusButtonView: View {
    var text: String
    var onTapped: (() -> Void)

    var body: some View {
        Button {
            onTapped()
        } label: {
            Text(text)
                .frame(width: 130, height: 30)
                .foregroundColor(.black)
                .background(.white)
                .cornerRadius(8)
        }
    }
}

struct MapFocusButtonView_Previews: PreviewProvider {
    static var previews: some View {
        MapFocusButtonView(text: "登録") {}
    }
}
