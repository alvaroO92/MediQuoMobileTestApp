//
//  SearchDetailPresenter.swift
//  MediQuoMobileTestApp
//
//  Created by Alvaro Orti Moreno on 5/2/22.
//  Copyright © 2022 Alvaro Orti Moreno. All rights reserved.
//

import Foundation

protocol SearchDetailPresenterProtocol: AnyObject {
    func viewWillAppear()
    func headerModel() -> HeaderDetailViewModel
    func getCategory() -> SearchCategory
    func numberOfSections() -> Int
    func numberOfRows(in section: Int) -> Int
    func modelForCell(at index: Int) -> String
    func titleForSection(in section: Int) -> String
}

final class SearchDetailPresenter {
    let category: SearchCategory
    let character: Character
    let useCase: SearchDetailQuotesUseCaseProtocol
    let router: SearchDetailRouterProtocol
    
    weak var view: SearchDetailTableViewControllerProtocol?

    var quotes = [String]()

    init(with searchCategory: SearchCategory, character: Character, useCase: SearchDetailQuotesUseCaseProtocol, router: SearchDetailRouterProtocol) {
        self.category = searchCategory
        self.character = character
        self.useCase = useCase
        self.router = router
    }

    private func getQuotes() {
        useCase.quotes { response in
            switch response {
            case .success(let data):
                self.quotes = data.map { $0.message }
                self.view?.reloadView()
            case .failure(let error):
                print(error)
            }
        }
    }
}

extension SearchDetailPresenter: SearchDetailPresenterProtocol {

    func viewWillAppear() {
        view?.setupUI()
        getQuotes()
    }

    func headerModel() -> HeaderDetailViewModel {
        HeaderDetailViewModel(characterImage: character.image)
    }
    

    func getCategory() -> SearchCategory {
        category
    }

    func numberOfSections() -> Int {
        SearchDetailTableViewCellUseCase.allCases.count
    }
    
    func numberOfRows(in section: Int) -> Int {
        1
    }

    func titleForSection(in section: Int) -> String {
        let element = SearchDetailTableViewCellUseCase.allCases[section]
        return element.text
    }

    func modelForCell(at index: Int) -> String {
        switch index {
        case 0:
            return character.name
        case 1:
            return character.birthday
        case 2:
            let ocupationString = character.occupation.map { $0 }.joined(separator: ", ")
            return ocupationString
        case 3:
            return character.status
        case 4:
            let appearanceString = character.appearance.map { String($0) }.joined(separator: ", ")
            return appearanceString
        case 5:
            return character.portrayed
        case 6:
            let quotesString = quotes.joined(separator: "\n\n")
            return quotesString
        default:
            return ""
        }
        
    }
    
}
