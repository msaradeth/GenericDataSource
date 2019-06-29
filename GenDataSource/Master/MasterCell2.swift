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
        guard let collectionView = superview as? UICollectionView,
            let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else { return layoutAttributes }
        
        //calc cell height - contentView.systemLayoutSizeFitting
        setNeedsLayout()
        layoutIfNeeded()
        let size = contentView.systemLayoutSizeFitting(layoutAttributes.size)
        let numberOfColumns = UIDevice.current.orientation == .portrait ? 2 : 3
        let itemWidth = flowLayout.getItemWidth(width: collectionView.frame.width, numberOfColumns: numberOfColumns)
//        print("preferredLayout", collectionView.frame.width, itemWidth, itemWidth.rounded(.down))
        
        //set cell height and width
        layoutAttributes.frame.size.height = size.height
        layoutAttributes.frame.size.width =  itemWidth
        
        return layoutAttributes
    }
    
    
}

extension UICollectionViewFlowLayout {
    func getAvailableWidth(width: CGFloat, numberOfColumns: Int) -> CGFloat {
        let numberOfColumns = CGFloat(numberOfColumns)
        let availableWidth = width
            - (minimumInteritemSpacing*numberOfColumns + sectionInset.left + sectionInset.right)
        
        return availableWidth
    }
    
    func getItemWidth(width: CGFloat, numberOfColumns: Int) -> CGFloat {
        let availableWidth = getAvailableWidth(width: width, numberOfColumns: numberOfColumns)
        return availableWidth / CGFloat(numberOfColumns)
    }
}
