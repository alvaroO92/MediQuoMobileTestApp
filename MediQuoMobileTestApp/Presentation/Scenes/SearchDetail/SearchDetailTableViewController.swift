//
//  SearchDetailTableViewController.swift
//  MediQuoMobileTestApp
//
//  Created by Alvaro Orti Moreno on 5/2/22.
//  Copyright © 2022 Alvaro Orti Moreno. All rights reserved.
//

import UIKit

protocol SearchDetailTableViewControllerProtocol: AnyObject {
    func setupUI()
    func reloadView()
}

class SearchDetailTableViewController: UITableViewController {

    var presenter: SearchDetailPresenterProtocol
    
    init(presenter: SearchDetailPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
        tableView.separatorStyle = .none
        tableView.register(SearchDetailTableViewCell.self, forCellReuseIdentifier: "SearchDetailTableViewCell")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.viewWillAppear()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        presenter.numberOfSections()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.numberOfRows(in: section)
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        presenter.titleForSection(in: section)
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = presenter.modelForCell(at: indexPath.section)
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchDetailTableViewCell", for: indexPath) as! SearchDetailTableViewCell
        cell.display(with: model)
        return cell
    }
}

extension SearchDetailTableViewController: SearchDetailTableViewControllerProtocol {
    func setupUI() {
        let model = presenter.headerModel()
        let backgroundImage: UIImage? = UIImage(named: presenter.categoryStringImage)
        let headerView = HeaderDetailView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 250))
        headerView.display(with: model, backgroundImage: backgroundImage)
        tableView.tableHeaderView = headerView
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    func reloadView() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
