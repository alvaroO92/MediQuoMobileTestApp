//
//  SearchDetailTableViewCell.swift
//  MediQuoMobileTestApp
//
//  Created by Alvaro Orti Moreno on 6/2/22.
//  Copyright © 2022 Alvaro Orti Moreno. All rights reserved.
//

import UIKit

enum SearchDetailTableViewCellUseCase: String, CaseIterable {
    case name
    case birthday
    case occupation
    case status
    case appearance
    case portrayed
    case quotes

    var text: String {
        self.rawValue.localized()
    }
    
    var count: Int {
        SearchDetailTableViewCellUseCase.allCases.count
    }
}

class SearchDetailTableViewCell: UITableViewCell {

    let messageLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.fill(with: messageLabel, edges: .init(top: 10, left: 10, bottom: 10, right: 10))
        selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForReuse() {
        messageLabel.text = nil
    }

    func display(with text: String) {
        messageLabel.text = text
    }
}
