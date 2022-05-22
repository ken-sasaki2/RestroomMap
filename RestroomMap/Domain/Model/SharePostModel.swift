//
//  SharePostModel.swift
//  RestroomMap
//
//  Created by sasaki.ken on 2022/05/22.
//

import Foundation

struct SharePostModel {
    var shareText: String
    var shareImage: String
    var shareUrl: String

    init(shareText: String, shareImage: String, shareUrl: String) {
        self.shareText = shareText
        self.shareImage = shareImage
        self.shareUrl = shareUrl
    }
}
