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
    
    
    override func systemLayoutSizeFitting(_ targetSize: CGSize) -> CGSize {
        return super.systemLayoutSizeFitting(targetSize)
    }

    override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
        guard let collectionView = superview as? UICollectionView, let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else { return targetSize }
        
        let size = contentView.systemLayoutSizeFitting(targetSize, withHorizontalFittingPriority: horizontalFittingPriority, verticalFittingPriority: verticalFittingPriority)
   
        //calc number of columns
        let numberofColumns = UIDevice.current.orientation.isPortrait ? 1 : 4
        let availableWidth = flowLayout.getAvailableWidth(width: collectionView.bounds.width, numberOfColumns: numberofColumns)
        let cellWidth = availableWidth / CGFloat(numberofColumns)
        
        let cellSize = CGSize(width: cellWidth, height: size.height)
        print("systemLayoutSizeFitting: cellSize: ", cellSize, "  size:", size)
        
        return cellSize
    }
    
    
    //    override func systemLayoutSizeFitting(
    //        _ targetSize: CGSize,
    //        withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority,
    //        verticalFittingPriority: UILayoutPriority) -> CGSize {
    //
    //        var contentSize = contentView.systemLayoutSizeFitting(
    //            targetSize,
    //            withHorizontalFittingPriority: horizontalFittingPriority,
    //            verticalFittingPriority: verticalFittingPriority)
    //
    ////        contentSize.width = targetSize.width
    //        contentSize.width = (superview?.bounds.width ?? 0) - 40
    //
    //        return contentSize
    //    }
    
    
}


extension UICollectionViewFlowLayout {
    func getAvailableWidth(width: CGFloat, numberOfColumns: Int) -> CGFloat {
        let numberOfColumns = CGFloat(numberOfColumns)
        let availableWidth = width
            - (minimumInteritemSpacing*numberOfColumns + sectionInset.left + sectionInset.right)
        
        return availableWidth > 0 ? availableWidth : 0
    }
    
    func getItemWidth(width: CGFloat, numberOfColumns: Int) -> CGFloat {
        let availableWidth = getAvailableWidth(width: width, numberOfColumns: numberOfColumns)
        let itemWidth = availableWidth / CGFloat(numberOfColumns)
        return itemWidth > 0 ? itemWidth : 0
    }
}
