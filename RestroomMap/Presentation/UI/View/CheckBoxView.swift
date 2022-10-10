//
//  CheckBoxView.swift
//  RestroomMap
//
//  Created by sasaki.ken on 2022/10/10.
//

import SwiftUI

struct CheckBoxView: View {
    var isCheck: Bool

    var body: some View {
        if isCheck {
            Image(systemName: "checkmark.square.fill")
                .foregroundColor(.blue)
        } else {
            Image(systemName: "square")
                .foregroundColor(.black)
        }
    }
}

struct CheckBoxView_Previews: PreviewProvider {
    static var previews: some View {
        CheckBoxView(isCheck: true)
    }
}
