//
//  SearchController.swift
//  MediQuoMobileTestApp
//
//  Created by Alvaro Orti Moreno on 5/2/22.
//  Copyright © 2022 Alvaro Orti Moreno. All rights reserved.
//

import UIKit

public class SearchController: UISearchController, UISearchBarDelegate {

    lazy var customSearchbar: UISearchBar = { [unowned self] in
        let searchbar = UISearchBar(frame: .zero)
        searchbar.delegate = self
        return searchbar
    }()

    public override var searchBar: UISearchBar {
        get {
            customSearchbar
        }
    }

    public func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.setShowsCancelButton(true, animated: true)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }

    public func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.setShowsCancelButton(false, animated: true)
        searchBar.resignFirstResponder()

        guard let term = searchBar.text,term.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else { //Notification "White spaces are not permitted"
            return
        }
    }

    public func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        isActive = false
        searchBar.setShowsCancelButton(false, animated: true)
        navigationController?.setNavigationBarHidden(false, animated: true)

        searchBar.text = String()
        searchBar.resignFirstResponder()
        self.view.setNeedsLayout()
    }
}
