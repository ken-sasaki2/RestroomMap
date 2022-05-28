//
//  ShareSheetView.swift
//  RestroomMap
//
//  Created by sasaki.ken on 2022/05/22.
//

import SwiftUI

struct ShareSheetView: UIViewControllerRepresentable {
    var text: String
    var image: String
    var url: String

    func makeUIViewController(context: Context) -> UIActivityViewController {
        let image = UIImage(named: image)
        let items: [Any] = [text, image as Any, url]
        let viewController = UIActivityViewController(activityItems: items, applicationActivities: [])

        return viewController
    }


    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}
}
