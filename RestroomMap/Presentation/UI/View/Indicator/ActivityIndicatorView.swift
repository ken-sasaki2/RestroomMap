//
//  ActivityIndicatorView.swift
//  RestroomMap
//
//  Created by sasaki.ken on 2022/05/31.
//

import SwiftUI

struct ActivityIndicatorView: UIViewRepresentable {

    func makeUIView(context: UIViewRepresentableContext<ActivityIndicatorView>) -> UIActivityIndicatorView {
        UIActivityIndicatorView(style: .large)
    }

    func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<ActivityIndicatorView>) {
        uiView.startAnimating()
        uiView.color = .white
    }
}
