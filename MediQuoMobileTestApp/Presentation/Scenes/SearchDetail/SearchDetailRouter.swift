//
//  SearchDetailRouter.swift
//  MediQuoMobileTestApp
//
//  Created by Alvaro Orti Moreno on 5/2/22.
//  Copyright © 2022 Alvaro Orti Moreno. All rights reserved.
//

import UIKit

protocol SearchDetailRouterProtocol: AnyObject {
    func popBack()
}

final class SearchDetailRouter {
    var viewController: UIViewController?
}

extension SearchDetailRouter: SearchDetailRouterProtocol {
    func popBack() {
        viewController?.navigationController?.dismiss(animated: true, completion: nil)
    }
}

