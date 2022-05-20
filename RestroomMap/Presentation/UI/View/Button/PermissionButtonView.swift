//
//  PermissionButtonView.swift
//  RestroomMap
//
//  Created by sasaki.ken on 2022/05/15.
//

import SwiftUI

struct PermissionButtonView: View {
    var onTapped: (() -> Void)

    var body: some View {
        Button {
            onTapped()
        } label: {
            Text("次の画面へ")
                .foregroundColor(.white)
                .font(.system(size: 20, weight: .medium, design: .default))
                .frame(width: 300, height: 44, alignment: .center)
                .background(.blue)
                .cornerRadius(100)
                .lineLimit(1)
        }
    }
}

struct PermissionButtonView_Previews: PreviewProvider {
    static var previews: some View {
        PermissionButtonView {}
    }
}
