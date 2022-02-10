//
//  HomeSearchPresenterMock.swift
//  MediQuoMobileTestAppTests
//
//  Created by Alvaro Orti Moreno on 10/2/22.
//  Copyright © 2022 Alvaro Orti Moreno. All rights reserved.
//

import Foundation
@testable import MediQuoMobileTestApp

final class HomeSearchPresenterMock: HomeSearchPresenterProtocol {
    private(set) var viewWillAppearCount: Int = 0
    private(set) var viewDidLoadCount: Int = 0
    private(set) var changeSegmentedCount: Int = 0
    private(set) var isFiltering: Bool = false
    private(set) var goToDetailEnabled: Bool = false
    
    func viewWillAppear() {
        viewWillAppearCount += 1
    }
    
    func viewDidLoad() {
        viewDidLoadCount += 1
    }
    
    func changeSegmentedTab(for index: Int) {
        changeSegmentedCount += 1
    }
    
    func heightForRow() -> Int {
        100
    }
    
    func numberOfSections() -> Int {
        1
    }
    
    func numberOfRows(in section: Int) -> Int {
        50
    }
    
    func modelForCell(at index: Int) -> HomeSearchTableViewCellUseCase {
        guard index <= 50 else {
            return HomeSearchTableViewCellUseCase.noResult("No Result")
        }
        return HomeSearchTableViewCellUseCase.result(.init(image: "image", name: "Saul Goodman", nickName: "Jimmy McGull"))
    }
    
    func filter(by text: String) {
        isFiltering = text.isNotEmpty
    }
    
    func goToDetail(for index: Int) {
        goToDetailEnabled = index <= 50
    }
}
