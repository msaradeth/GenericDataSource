//
//  MasterCell2.swift
//  GenDataSource
//
//  Created by Mike Saradeth on 6/28/19.
//  Copyright © 2019 Mike Saradeth. All rights reserved.
//

import UIKit

class MasterCell2: UICollectionViewCell, CellProtocol {
    static var cellIdentifier: String = "MasterCell2"
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!

    func configure(item: Contact) {
        titleLabel.text = item.firstName
        detailLabel.text = item.lastName
    }
    
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        super.preferredLayoutAttributesFitting(layoutAttributes)
        //calc height
        layoutIfNeeded()
        let size = contentView.systemLayoutSizeFitting(layoutAttributes.size)
        
        //set height
        layoutAttributes.frame.size.height = size.height
        
        return layoutAttributes
    }
    

}


