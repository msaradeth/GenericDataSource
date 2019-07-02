//
//  Extensions.swift
//  GenDataSource
//
//  Created by Mike Saradeth on 6/27/19.
//  Copyright © 2019 Mike Saradeth. All rights reserved.
//

import Foundation
import UIKit

//MARK:  UIView extension
extension UIView {
    func fillsuperView(padding: UIEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)) {
        guard let superview = superview else { return }
        topAnchor.constraint(equalTo: superview.topAnchor, constant: padding.top).isActive = true
        leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: padding.left).isActive = true
        trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: padding.right).isActive = true
        bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: padding.bottom).isActive = true        
    }
}


//MARK:  UICollectionView extension
extension UICollectionView {
    
//    //MARK: Generic function to calc cell with and height base on number of columns
//    //constraint Model datatype and Cell datatype must be the same
//    func getCellSize<CellType: UICollectionViewCell, DataType>(cell: CellType, item: DataType, numberOfColumns: Int) -> CGSize
//        where CellType: CellProtocol, DataType == CellType.DataType {
//
//        //set up cell
//        cell.configure(item: item)
//
//        //calc cell Width
//        let cellWidth = self.getCellWidth(numberOfColumns: numberOfColumns)
//
//        //set contentView width constraint
//        cell.contentViewWidthConstraint?.constant = cellWidth
//
//        //calc cell height
//        cell.setNeedsLayout()
//        cell.layoutIfNeeded()
//        let size = cell.contentView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
//
//        return CGSize(width: cellWidth, height: size.height)
//    }
    
    
    
    //MARK: Get cell Width
    func getCellWidth(numberOfColumns: Int) -> CGFloat {
        let availableWidth = getAvailableWidth(numberOfColumns: numberOfColumns)
        
        //available width divided by number of columns
        let cellWidth = availableWidth / CGFloat(numberOfColumns)
        
        return cellWidth > 0 ? cellWidth : 0
    }
    
    
    //Mark: Get available width
    func getAvailableWidth(numberOfColumns: Int) -> CGFloat {
        let numberOfColumns = CGFloat(numberOfColumns)
        
        //calc available width minus safeAreaInsets
        var availableWidth = self.bounds.width - (self.safeAreaInsets.left + self.safeAreaInsets.right)
        
        //available width minus FlowLayout settings
        if let flowLayout = self.collectionViewLayout as? UICollectionViewFlowLayout {
            availableWidth = availableWidth - (flowLayout.minimumInteritemSpacing*numberOfColumns + flowLayout.sectionInset.left + flowLayout.sectionInset.right)
        }
        
        return availableWidth > 0 ? availableWidth : 0
    }

}



