//
//  LocationAddView.swift
//  RestroomMap
//
//  Created by sasaki.ken on 2022/05/14.
//

import SwiftUI

struct LocationAddView: View {
    @State private var name = ""
    @State private var isOpen24Hour = false
    @State private var openDate = Date()
    @State private var closeDate = Date()
    @State private var holiday = ""
    @State private var isWesternStyle = false
    @State private var isJapaneseStyle = false
    @State private var isPublic = false
    @State private var isByGender = false
    @State private var isWashlet = false
    @State private var isMultipurpose = false
    @State private var isWheelchair = false
    @State private var isDiaper = false
    @State private var isBed = false
    @State private var isPowderRoom = false
    @State private var isParking = false
    @State private var memo = ""
    let lat: Double
    let lng: Double
    let controller: LocationAddController
    @ObservedObject var viewModel: LocationAddViewModel
    @Environment(\.presentationMode) private var presentationMode

    var body: some View {
        GeometryReader { geometry in
            NavigationView {
                Form {
                    Section("トイレの名前（必須）") {
                        TextField("", text: $name)
                    }
                    Section("営業時間") {
                        HStack {
                            Spacer()
                            CheckBoxButtonView(text: "24h営業") {
                                isOpen24Hour.toggle()
                            }
                        }
                        if !isOpen24Hour {
                            HStack {
                                Text("開始時刻")
                                Spacer()
                                DatePicker("", selection: $openDate, displayedComponents: .hourAndMinute)
                            }
                            HStack {
                                Text("終了時刻")
                                Spacer()
                                DatePicker("", selection: $closeDate, displayedComponents: .hourAndMinute)
                            }
                        }
                    }
                    Section("休業日") {
                        TextEditor(text: $holiday)
                            .frame(width: geometry.size.width * 0.8, height: 80)
                            .font(.system(size: 16, weight: .regular, design: .default))
                    }
                    Section("設備") {
                        Group {
                            HStack {
                                Text("洋式トイレ")
                                Spacer()
                                CheckBoxButtonView {
                                    isWesternStyle.toggle()
                                }
                            }
                            HStack {
                                Text("和式トイレ")
                                Spacer()
                                CheckBoxButtonView {
                                    isJapaneseStyle.toggle()
                                }
                            }
                            HStack {
                                Text("公衆トイレ")
                                Spacer()
                                CheckBoxButtonView {
                                    isPublic.toggle()
                                }
                            }
                            HStack {
                                Text("男女別トイレ")
                                Spacer()
                                CheckBoxButtonView {
                                    isByGender.toggle()
                                }
                            }
                        }
                        Group {
                            HStack {
                                Text("ウォシュレット")
                                Spacer()
                                CheckBoxButtonView {
                                    isWashlet.toggle()
                                }
                            }
                            HStack {
                                Text("多目的トイレ")
                                Spacer()
                                CheckBoxButtonView {
                                    isMultipurpose.toggle()
                                }
                            }
                            HStack {
                                Text("車イス対応")
                                Spacer()
                                CheckBoxButtonView {
                                    isWheelchair.toggle()
                                }
                            }
                            HStack {
                                Text("おむつ交換設備")
                                Spacer()
                                CheckBoxButtonView {
                                    isDiaper.toggle()
                                }
                            }
                            HStack {
                                Text("大型ベッド")
                                Spacer()
                                CheckBoxButtonView {
                                    isBed.toggle()
                                }
                            }
                            HStack {
                                Text("パウダールーム")
                                Spacer()
                                CheckBoxButtonView {
                                    isPowderRoom.toggle()
                                }
                            }
                        }
                        HStack {
                            Text("駐車場")
                            Spacer()
                            CheckBoxButtonView {
                                isParking.toggle()
                            }
                        }
                    }
                    Section("メモ") {
                        TextEditor(text: $memo)
                            .frame(width: geometry.size.width * 0.8, height: 80)
                            .font(.system(size: 16, weight: .regular, design: .default))
                    }
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button("登録") {
                            controller.showIndicator()
                            controller.onAddButtonTapped(lat: lat, lng: lng, name: name, isOpen24Hour: isOpen24Hour, openDate: openDate, closeDate: closeDate, holiday: holiday, isWesternStyle: isWesternStyle, isJapaneseStyle: isJapaneseStyle, isPublic: isPublic, isByGender: isByGender, isWashlet: isWashlet, isMultipurpose: isMultipurpose, isWheelchair: isWheelchair, isDiaper: isDiaper, isBed: isBed, isPowderRoom: isPowderRoom, isParking: isParking, memo: memo)
                        }
                        .foregroundColor(.black)
                    }
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                            presentationMode.wrappedValue.dismiss()
                        } label: {
                            Image(systemName: "xmark")
                                .foregroundColor(.black)
                        }
                    }
                }
            }
            .environment(\.locale, Locale(identifier: "ja_JP"))
            .interactiveDismissDisabled()
            if viewModel.isShowIndicatorView {
                withAnimation {
                    IndicatorView()
                }
            }
        }
    }
}

struct LocationAddView_Previews: PreviewProvider {
    static var previews: some View {
        LocationAddViewBuilder.shared.build(lat: 35.65139, lng: 139.63679)
    }
}
