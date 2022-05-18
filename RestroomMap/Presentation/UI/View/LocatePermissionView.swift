//
//  LocatePermissionView.swift
//  RestroomMap
//
//  Created by sasaki.ken on 2022/05/15.
//

import SwiftUI

struct LocatePermissionView: View {
    @ObservedObject var viewModel: LocatePermissionViewModel
    let controller: LocatePermissionController

    var body: some View {
        ZStack {
            Image("locate＿permission")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .edgesIgnoringSafeArea(.all)
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
                    controller.onNextPageButtonTapped()
                }
                .padding(.bottom, 30)
                .alert("確認", isPresented: $viewModel.isShowDeniedAlert) {
                    Button("設定へ") {
                        controller.onGoToSettingPageButtonTapped()
                    }
                } message: {
                    Text("'設定'から位置情報を許可してください")
                }
                .alert("エラー", isPresented: $viewModel.isShowFailLocatePermissionAlert) {
                    Button("設定へ") {}
                } message: {
                    Text("位置情報の取得に失敗しました。\n時間をおいて再度お試しください。")
                }
            }
        }
        .interactiveDismissDisabled()
    }
}

struct LocatePermissionView_Previews: PreviewProvider {
    static var previews: some View {
        LocatePermissionViewBuilder.shared.build()
    }
}
