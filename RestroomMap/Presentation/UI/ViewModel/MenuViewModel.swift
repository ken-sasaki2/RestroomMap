//
//  MenuViewModel.swift
//  RestroomMap
//
//  Created by sasaki.ken on 2022/05/20.
//

import Foundation

final class MenuViewModel: ObservableObject {
    @Published var isShowShareSheet = false
    @Published var shareText = ""
    @Published var shareImage = ""
    @Published var shareUrl = ""
    @Published var isShowInquiryView = false
    @Published var inquiryUrl = Const.inquiryUrl
}
