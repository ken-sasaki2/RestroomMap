//
//  IndicatorView.swift
//  RestroomMap
//
//  Created by sasaki.ken on 2022/05/31.
//

import SwiftUI

struct IndicatorView: View {
    var body: some View {
        ZStack {
            Color.black.opacity(0.3)
                .edgesIgnoringSafeArea(.all)
            ActivityIndicatorView()
        }
    }
}

struct IndicatorView_Previews: PreviewProvider {
    static var previews: some View {
        IndicatorView()
    }
}
