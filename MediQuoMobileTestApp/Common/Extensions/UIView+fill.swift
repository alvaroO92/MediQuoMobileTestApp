//
//  UIView+fill.swift
//  MediQuoMobileTestApp
//
//  Created by Alvaro Orti Moreno on 5/2/22.
//  Copyright © 2022 Alvaro Orti Moreno. All rights reserved.
//

import UIKit

extension UIView {
    func fill(with view: UIView, edges: UIEdgeInsets = .zero) {
        view.translatesAutoresizingMaskIntoConstraints = false

        addSubview(view)
        NSLayoutConstraint.activate([
            safeAreaLayoutGuide.topAnchor.constraint(equalTo: view.topAnchor, constant: -edges.top),
            safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: edges.bottom),
            leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -edges.left),
            trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: edges.right)
        ])
    }
}
