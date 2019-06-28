//
//  Extensions.swift
//  GenDataSource
//
//  Created by Mike Saradeth on 6/27/19.
//  Copyright © 2019 Mike Saradeth. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func fillsuperView(padding: UIEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)) {
        guard let superview = superview else { return }
        topAnchor.constraint(equalTo: superview.topAnchor, constant: padding.top).isActive = true
        leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: padding.left).isActive = true
        trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: padding.right).isActive = true
        bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: padding.bottom).isActive = true        
    }
}
