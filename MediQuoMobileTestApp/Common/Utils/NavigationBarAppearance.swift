//
//  NavigationBarAppearance.swift
//  MediQuoMobileTestApp
//
//  Created by Alvaro Orti Moreno on 5/2/22.
//  Copyright © 2022 Alvaro Orti Moreno. All rights reserved.
//

import UIKit

final class NavigationBarAppearance {
    static var shared = NavigationBarAppearance()

    private init() {}

    public func setupSearchController(placeholder: String?) -> UISearchController {
        let searchController = SearchController(searchResultsController: nil)
        searchController.obscuresBackgroundDuringPresentation = false
        let searchBar = searchController.customSearchbar
        searchBar.placeholder = placeholder
       // setupStyle(searchBar: searchBar, type: type)
        return searchController
    }

}
