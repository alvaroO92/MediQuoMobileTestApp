//
//  HomeSearchPresenter.swift
//  MediQuoMobileTestApp
//
//  Created by Alvaro Orti Moreno on 5/2/22.
//  Copyright © 2022 Alvaro Orti Moreno. All rights reserved.

//

import Foundation

protocol HomeSearchPresenterProtocol: AnyObject {
    func viewWillAppear()
    func viewDidLoad()
    func changeSegmentedTab(for index: Int)
    func heightForRow() -> Int
    func numberOfSections() -> Int
    func numberOfRows(in section: Int) -> Int
    func modelForCell(at index: Int) -> HomeSearchTableViewCellUseCase
    func filter(by text: String)
    func goToDetail(for index: Int)
}

final class HomeSearchPresenter {
    let useCase: HomeSearchUseCaseProtocol
    let router: HomeSearchRouterProtocol

    weak var view: HomeSearchTableViewControllerProtocol?

    var category: SearchCategory = .BetterCallSaul
    var characters = [Character]()
    var filterCharacters = [Character]()
    
    var isSearching: Bool = false

    init(useCase: HomeSearchUseCaseProtocol, router: HomeSearchRouterProtocol) {
        self.useCase = useCase
        self.router = router
    }

    private func loadData(by category: SearchCategory) {
        useCase.getCharacters(category: category) { [weak self] response in
            guard let self = self else { return }
            switch response {
            case .success(let characters):
                self.characters = characters
                self.filterCharacters = characters
                self.view?.reloadView()
            case .failure(let error):
                self.view?.showErrorView(message: error.localizedDescription)
            }
        }
    }
}

extension HomeSearchPresenter: HomeSearchPresenterProtocol {
    func heightForRow() -> Int {
        100
    }
    
    func viewWillAppear() {
        view?.setupUI()
    }

    func viewDidLoad() {
        loadData(by: .BetterCallSaul)
    }

    func changeSegmentedTab(for index: Int) {
        category = index == 0 ? .BetterCallSaul : .BreakingBad
        loadData(by: category)
    }

    func filter(by text: String) {
        isSearching = text.isNotEmpty
        filterCharacters = characters.filter { $0.name.hasPrefix(text) }
        view?.reloadView()
    }

    func numberOfSections() -> Int {
        1
    }
    
    func numberOfRows(in section: Int) -> Int {
        max(1, isSearching ? filterCharacters.count : characters.count)
    }

    func modelForCell(at index: Int) -> HomeSearchTableViewCellUseCase {
        guard characters.isNotEmpty && filterCharacters.isNotEmpty else {
            return HomeSearchTableViewCellUseCase.noResult("noResults".localized())
        }

        let character = isSearching ? filterCharacters[index] : characters[index]
        return HomeSearchTableViewCellUseCase.result(.init(image: character.image, name: character.name, nickName: character.nickname))
    }

    func goToDetail(for index: Int) {
        let character = isSearching ? filterCharacters[index] : characters[index]
        router.goToDetail(with: category, character: character)
    }
}
