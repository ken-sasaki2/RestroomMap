//
//  CheckBoxButtonView.swift
//  RestroomMap
//
//  Created by sasaki.ken on 2022/06/20.
//

import SwiftUI

struct CheckBoxButtonView: View {
    @State private var isChecked = false
    var text: String?
    var onTapped: (() -> Void)

    var body: some View {
        Button {
            isChecked.toggle()
            UIImpactFeedbackGenerator(style: .medium).impactOccurred()
            onTapped()
        } label: {
            if isChecked {
                Image(systemName: "checkmark.square.fill")
                    .foregroundColor(.blue)
                Text(text ?? "あり")
                    .foregroundColor(.black)
                    .font(.system(size: 16, weight: .regular, design: .default))
            } else {
                Image(systemName: "square")
                    .foregroundColor(.black)
                Text(text ?? "なし")
                    .foregroundColor(.black)
                    .font(.system(size: 16, weight: .regular, design: .default))
            }
        }
        .buttonStyle(BorderlessButtonStyle())
    }
}

struct CheckBoxButtonView_Previews: PreviewProvider {
    static var previews: some View {
        CheckBoxButtonView {}
    }
}
