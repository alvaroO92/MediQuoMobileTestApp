//
//  HomeSearchBuilder.swift
//  MediQuoMobileTestApp
//
//  Created by Alvaro Orti Moreno on 4/2/22.
//  Copyright © 2022 Alvaro Orti Moreno. All rights reserved.
//

import UIKit

final class HomeSearchBuilder: Builder {

    func build() -> UIViewController {
        let networkClient = HomeSearchNetworkClient(category: .BetterCallSaul)
        let repository = HomeSearchRepository(networkClient: networkClient)
        let useCase = HomeSearchUseCase(repositoy: repository)
        let router = HomeSearchRouter()
        let presenter = HomeSearchPresenter(useCase: useCase, router: router)
        let viewController = HomeSearchTableViewController(presenter: presenter)
        presenter.view = viewController
        router.viewController = viewController
        return viewController
    }
}
