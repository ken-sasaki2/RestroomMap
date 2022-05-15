//
//  LocatePermissionView.swift
//  RestroomMap
//
//  Created by sasaki.ken on 2022/05/15.
//

import SwiftUI

struct LocatePermissionView: View {
    var body: some View {
        ZStack {
            Image("locate＿permission")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .edgesIgnoringSafeArea(.all)
//            Color.black.opacity(0.3)
//                .edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                Text("位置情報をオンにする")
                    .font(.system(size: 32, weight: .medium, design: .default))
                    .foregroundColor(.black)
                    .lineLimit(1)
                    .padding(.bottom, 3)
                Text("本アプリの機能を利用するには、\n位置情報をオンにする必要があります")
                    .font(.system(size: 16, weight: .medium, design: .default))
                    .foregroundColor(.black)
                    .lineLimit(2)
                    .padding(.bottom, 20)
                PermissionButtonView {

                }
                .padding(.bottom, 30)
            }
        }
    }
}

struct LocatePermissionView_Previews: PreviewProvider {
    static var previews: some View {
        LocatePermissionView()
            .previewDevice("iPhone 13 Pro")
    }
}
