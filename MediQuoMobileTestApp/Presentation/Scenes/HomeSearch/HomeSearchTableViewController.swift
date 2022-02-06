//
//  HomeSearchTableViewController.swift
//  MediQuoMobileTestApp
//
//  Created by Alvaro Orti Moreno on 4/2/22.
//  Copyright © 2022 Alvaro Orti Moreno. All rights reserved.
//

import UIKit

protocol HomeSearchTableViewControllerProtocol: AnyObject {
    func setupUI()
    func reloadView()
    func showErrorView(message: String)
}

final class HomeSearchTableViewController: UITableViewController {

    lazy var segmentedControl: UISegmentedControl = {
        let items = ["Better Call Saul" , "Breaking Bad"]
        let segmentedControl = UISegmentedControl(items : items)
        segmentedControl.addTarget(self, action: #selector(indexChanged(_:)), for: .valueChanged)
        segmentedControl.selectedSegmentIndex = 0
        return segmentedControl
    }()

    var presenter: HomeSearchPresenterProtocol
    
    init(presenter: HomeSearchPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
        tableView.register(HomeSearchTableViewCell.self,
                           forCellReuseIdentifier: "HomeSearchTableViewCell")
        tableView.register(UITableViewCell.self,
                           forCellReuseIdentifier: "UITableViewCell")
        tableView.tableHeaderView = segmentedControl
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.viewWillAppear()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        presenter.numberOfSections()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.numberOfRows(in: section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let character = presenter.modelForCell(at: indexPath.row)
        
        switch character {
        case .result(let model):
            let cell = tableView.dequeueReusableCell(withIdentifier: "HomeSearchTableViewCell", for: indexPath) as! HomeSearchTableViewCell
            cell.display(with: model)
            return cell
        case .noResult(let string):
            let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
            cell.textLabel?.text = string
            return cell
        }
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presenter.goToDetail(for: indexPath.row)
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        CGFloat(presenter.heightForRow())
    }

    @objc func indexChanged(_ sender: UISegmentedControl) {
        presenter.changeSegmentedTab(for: sender.selectedSegmentIndex)
    }
}

extension HomeSearchTableViewController: HomeSearchTableViewControllerProtocol {
 
    func reloadView() {
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
        }
    }
    
    func setupUI() {
        title = "characters".localized()
        let searchController = NavigationBarAppearance.shared.setupSearchController(placeholder: "search".localized())
        searchController.searchResultsUpdater = self
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    func showErrorView(message: String) {
        let alert = UIAlertController.init(title: "error".localized(), message: message, preferredStyle: .alert)
        present(alert, animated: true, completion: nil)
    }
}

extension HomeSearchTableViewController: UISearchResultsUpdating {

    func updateSearchResults(for searchController: UISearchController) {
        let typingText = searchController.searchBar.text ?? ""
        presenter.filter(by: typingText)
    }
}
