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
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let characterImageView: UIImageView = {
        let imageView = UIImageView()
        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalToConstant: 60),
            imageView.widthAnchor.constraint(equalToConstant: 60)
        ])
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    lazy var textsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [nameLabel, nickNameLabel])
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = 1.0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
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

        contentView.addSubview(containerView)
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            containerView.heightAnchor.constraint(greaterThanOrEqualToConstant: 100),

        ])
        
        containerView.addSubview(characterImageView)
        NSLayoutConstraint.activate([
            characterImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            characterImageView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor)
        ])
        
        containerView.addSubview(textsStackView)
        NSLayoutConstraint.activate([
            textsStackView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            textsStackView.leadingAnchor.constraint(equalTo: characterImageView.trailingAnchor, constant: 16),
            textsStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: 16)
        ])
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
        characterImageView.layer.cornerRadius = 30
        characterImageView.layer.masksToBounds = true
        characterImageView.clipsToBounds = true
    }
    
    func display(with model: HomeSearchTableViewCellUseCase.Model) {
        nameLabel.text = model.name
        nickNameLabel.text = model.nickName
        characterImageView.loadFromSDWebImage(urlString: model.image)
    }
}
