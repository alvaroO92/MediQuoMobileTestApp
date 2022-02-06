//
//  HomeSearchRouter.swift
//  MediQuoMobileTestApp
//
//  Created by Alvaro Orti Moreno on 4/2/22.
//  Copyright © 2022 Alvaro Orti Moreno. All rights reserved.
//

import UIKit

protocol HomeSearchRouterProtocol: AnyObject {
    func goToDetail(with searchCategory: SearchCategory, character: Character)
}

final class HomeSearchRouter {
    var viewController: UIViewController?
}

extension HomeSearchRouter: HomeSearchRouterProtocol {
    func goToDetail(with searchCategory: SearchCategory, character: Character) {
        let detailViewController = SearchDetailBuilder().build(searchCategory: searchCategory, character: character)
        viewController?.navigationController?.pushViewController(detailViewController, animated: false)
    }
}
