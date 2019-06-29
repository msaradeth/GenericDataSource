//
//  MasterCell2.swift
//  GenDataSource
//
//  Created by Mike Saradeth on 6/28/19.
//  Copyright © 2019 Mike Saradeth. All rights reserved.
//

import UIKit

class MasterCell2: UICollectionViewCell, CellProtocol {
    static var cellIdentifier: String = "Cell"
    

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    
    func configure(item: Contact) {
        titleLabel.text = item.firstName
        detailLabel.text = item.lastName
    }

    //MARK: Self sizing cell - Calc Width and Height
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        //calc cell height - contentView.systemLayoutSizeFitting
        setNeedsLayout()
        layoutIfNeeded()
        let size = contentView.systemLayoutSizeFitting(layoutAttributes.size)
        
        //set cell height and width
        layoutAttributes.frame.size.height = size.height
        
        return layoutAttributes
    }
    
    
}
