//
//  HomeSearchTableViewCell.swift
//  MediQuoMobileTestApp
//
//  Created by Alvaro Orti Moreno on 5/2/22.
//  Copyright © 2022 Alvaro Orti Moreno. All rights reserved.
//

import UIKit

enum HomeSearchTableViewCellUseCase {
    case result(Model)
    case noResult(String)

    struct Model {
        let image: String
        let name: String
        let nickName: String
    }
}

class HomeSearchTableViewCell: UITableViewCell {
    
    lazy var contentStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [characterImageView, textsStackView])
        stackView.axis = .horizontal
        stackView.spacing = 4.0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let characterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalToConstant: 100),
            imageView.widthAnchor.constraint(equalToConstant: 100)
        ])
        return imageView
    }()

    lazy var textsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [nameLabel, nickNameLabel])
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 4.0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()

    let nickNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.italicSystemFont(ofSize: 14)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        contentView.fill(with: contentStackView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        nameLabel.text = ""
        characterImageView.image = nil
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        characterImageView.layer.cornerRadius = characterImageView.frame.height/2
    }
    
    func display(with model: HomeSearchTableViewCellUseCase.Model) {
        nameLabel.text = model.name
        nickNameLabel.text = model.nickName
        characterImageView.loadFromSDWebImage(urlString: model.image)
    }
}
