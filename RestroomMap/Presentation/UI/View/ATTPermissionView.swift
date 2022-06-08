//
//  ATTPermissionView.swift
//  RestroomMap
//
//  Created by sasaki.ken on 2022/05/28.
//

import SwiftUI

struct ATTPermissionView: View {
    let controller: ATTPermissionController

    var body: some View {
        ZStack {
            Image("")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                Text("トラッキングを許可する")
                    .font(.system(size: 30, weight: .medium, design: .default))
                    .foregroundColor(.black)
                    .lineLimit(1)
                    .padding(.bottom, 3)
                Text("無関係な広告を表示されにくくするためには、\n次の画面でトラッキングを許可してください")
                    .font(.system(size: 16, weight: .medium, design: .default))
                    .foregroundColor(.black)
                    .lineLimit(2)
                    .padding(.bottom, 20)
                PermissionButtonView {
                    controller.onNextPegeButtonTapped()
                }
                .padding(.bottom, 30)
            }
        }
        .interactiveDismissDisabled()
    }
}

struct ATTPermissionView_Previews: PreviewProvider {
    static var previews: some View {
        ATTPermissionViewBuilder.shared.build()
    }
}
