//
//  SearchDetailBuilder.swift
//  MediQuoMobileTestApp
//
//  Created by Alvaro Orti Moreno on 5/2/22.
//  Copyright © 2022 Alvaro Orti Moreno. All rights reserved.
//

import UIKit

protocol _SearchDetailBuilder {
    func build(searchCategory: SearchCategory, character: Character) -> UIViewController
}

final class SearchDetailBuilder: _SearchDetailBuilder {

    func build(searchCategory: SearchCategory, character: Character) -> UIViewController {
        let router = SearchDetailRouter()
        let networkClient = SearchDetailQuotesNetworkClient(author: character.name)
        let repository = SearchDetailQuotesRepository(networkClient: networkClient)
        let useCase = SearchDetailQuotesUseCase(repository: repository)
        let presenter = SearchDetailPresenter(with: searchCategory, character: character, useCase: useCase, router: router)
        let viewController = SearchDetailTableViewController(presenter: presenter)
        presenter.view = viewController
        router.viewController = viewController
        return viewController
    }
}
