//
//  MenuButtonView.swift
//  RestroomMap
//
//  Created by sasaki.ken on 2022/05/21.
//

import SwiftUI

struct MenuButtonView: View {
    var text: String
    var onTapped: (() -> Void)

    var body: some View {
        Button {
            onTapped()
        } label: {
            Text(text)
                .font(.system(size: 16, weight: .regular, design: .default))
                .foregroundColor(.black)
        }
    }
}

struct MenuButtonView_Previews: PreviewProvider {
    static var previews: some View {
        MenuButtonView(text: "問い合わせ") {}
    }
}
