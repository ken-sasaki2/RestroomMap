//
//  MapToolBarButtonView.swift
//  RestroomMap
//
//  Created by sasaki.ken on 2022/05/14.
//

import SwiftUI

struct MapToolBarButtonView: View {
    var imageName: String
    var onTapped: (() -> Void)

    var body: some View {
        Button {
            onTapped()
        } label: {
            Image(systemName: imageName)
                .frame(width: 50, height: 50)
                .foregroundColor(.black.opacity(0.6))
                .background(.gray.opacity(0.4))
                .clipShape(Circle())
        }
    }
}

struct MapToolBarButtonView_Previews: PreviewProvider {
    static var previews: some View {
        MapToolBarButtonView(imageName: "plus") {}
    }
}
