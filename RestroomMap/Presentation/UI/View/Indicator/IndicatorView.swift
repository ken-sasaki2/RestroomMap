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
            ZStack {
                Color.black.opacity(0.6)
                    .frame(width: 150, height: 120)
                    .cornerRadius(8)
                VStack {
                    ActivityIndicatorView()
                    Text("準備中...")
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .regular, design: .default))
                }
            }
        }
    }
}

struct IndicatorView_Previews: PreviewProvider {
    static var previews: some View {
        IndicatorView()
    }
}
