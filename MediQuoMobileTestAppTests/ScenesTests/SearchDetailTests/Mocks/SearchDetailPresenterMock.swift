//
//  SearchDetailPresenterMock.swift
//  MediQuoMobileTestAppTests
//
//  Created by Alvaro Orti Moreno on 10/2/22.
//  Copyright © 2022 Alvaro Orti Moreno. All rights reserved.
//

import Foundation
@testable import MediQuoMobileTestApp

final class SearchDetailPresenterMock: SearchDetailPresenterProtocol {
    private(set) var viewWillAppearCount: Int = 0

    var categoryStringImage: String = "ic_BreakingBad"
    
    func viewWillAppear() {
        viewWillAppearCount += 1
    }
    
    func headerModel() -> HeaderDetailViewModel {
        HeaderDetailViewModel(characterImage: categoryStringImage)
    }
    
    func numberOfSections() -> Int {
        10
    }
    
    func numberOfRows(in section: Int) -> Int {
        1
    }
    
    func modelForCell(at index: Int) -> String {
        index <= 6 ? "indexValid" : "notValidIndex"
    }
    
    func titleForSection(in section: Int) -> String {
        section <= 10 ? "indexValid" : "notValidIndex"
    }
}
