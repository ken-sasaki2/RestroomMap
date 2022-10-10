//
//  RegistedDataView.swift
//  RestroomMap
//
//  Created by sasaki.ken on 2022/10/10.
//

import SwiftUI


struct RegistedDataView: View {
    var outputModel: LocationFetchOutputModel
    @Environment(\.presentationMode) private var presentationMode

    var body: some View {
        NavigationView {
            Form {
                Section("トイレの名前") {
                    Text(outputModel.name)
                }
                Section("営業時間") {
                    if outputModel.isOpen24Hour {
                        HStack {
                            Text("24時間営業")
                            Spacer()
                            CheckBoxView(isCheck: outputModel.isOpen24Hour)
                        }
                    } else {
                        Text("\(outputModel.openDate)〜\(outputModel.closeDate)")
                    }
                }
                Section("休業日") {
                    Text(outputModel.holiday ?? "休業日なし")
                }
                Section("設備") {
                    Group {
                        HStack {
                            Text("洋式トイレ")
                            Spacer()
                            CheckBoxView(isCheck: outputModel.isWesternStyle)
                        }
                        HStack {
                            Text("和式トイレ")
                            Spacer()
                            CheckBoxView(isCheck: outputModel.isJapaneseStyle)
                        }
                        HStack {
                            Text("公衆トイレ")
                            Spacer()
                            CheckBoxView(isCheck: outputModel.isPublic)
                        }
                        HStack {
                            Text("男女別トイレ")
                            Spacer()
                            CheckBoxView(isCheck: outputModel.isByGender)
                        }
                    }
                    Group {
                        HStack {
                            Text("ウォシュレット")
                            Spacer()
                            CheckBoxView(isCheck: outputModel.isWashlet)
                        }
                        HStack {
                            Text("多目的トイレ")
                            Spacer()
                            CheckBoxView(isCheck: outputModel.isMultipurpose)
                        }
                        HStack {
                            Text("車イス対応")
                            Spacer()
                            CheckBoxView(isCheck: outputModel.isWheelchair)
                        }
                        HStack {
                            Text("おむつ交換設備")
                            Spacer()
                            CheckBoxView(isCheck: outputModel.isDiaper)
                        }
                        HStack {
                            Text("大型ベッド")
                            Spacer()
                            CheckBoxView(isCheck: outputModel.isBed)
                        }
                        HStack {
                            Text("パウダールーム")
                            Spacer()
                            CheckBoxView(isCheck: outputModel.isPowderRoom)
                        }
                    }
                    HStack {
                        Text("駐車場")
                        Spacer()
                        CheckBoxView(isCheck: outputModel.isParking)
                    }
                }
                if let memo = outputModel.memo {
                    Section("メモ") {
                        Text(memo)
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "xmark")
                            .foregroundColor(.black)
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    // deviceIDが一致したら削除ボタンを表示
                    Button {
                        print("削除")
                    } label: {
                        Text("このデータを削除")
                            .foregroundColor(.red)
                    }
                }
            }
        }
    }
}


struct RegistedDataView_Previews: PreviewProvider {
    static var previews: some View {
        RegistedDataView(outputModel: TestConst.locationFetchOutputModel[0])
    }
}
