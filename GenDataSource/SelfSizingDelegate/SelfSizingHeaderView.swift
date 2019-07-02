//
//  SelfSizingHeaderView.swift
//  GenDataSource
//
//  Created by Mike Saradeth on 7/2/19.
//  Copyright © 2019 Mike Saradeth. All rights reserved.
//

import UIKit

class SelfSizingHeaderView: UICollectionReusableView {
    lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = UIFont.systemFont(ofSize: 21, weight: .medium)
        return titleLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(titleLabel)
        titleLabel.fillsuperView()
    }
    
    func configure(title: String) {
        self.titleLabel.text = title
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
