//
//  MockShareUseCaseOutput.swift
//  RestroomMapTests
//
//  Created by sasaki.ken on 2022/06/17.
//

import Foundation

final class MockShareUseCaseOutput: ShareUseCaseOutput {

    var isShowShareSheetViewCalled = false
    func showShareSheetView(model: SharePostModel) {
        isShowShareSheetViewCalled = true
    }
}
