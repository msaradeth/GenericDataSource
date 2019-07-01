//
//  ColumnFlowLayout.swift
//  GenDataSource
//
//  Created by Mike Saradeth on 6/30/19.
//  Copyright © 2019 Mike Saradeth. All rights reserved.
//

import Foundation
import UIKit

class ColumnFlowLayout: UICollectionViewFlowLayout {
    var minColumnWidth: CGFloat
    var cellHeight: CGFloat
    
    init(minColumnWidth: CGFloat, cellHeight: CGFloat) {
        self.minColumnWidth = minColumnWidth
        self.cellHeight = cellHeight
        super.init()
    }
    
    override func prepare() {
        guard let collectionView = collectionView else { return }
        
        //calc optimal column width base on collectionView width
        let availableWidth = collectionView.bounds.inset(by: collectionView.layoutMargins).width
        let maxNumberOfColumns = (availableWidth / minColumnWidth).rounded(.down)
        let cellWidth = (availableWidth / maxNumberOfColumns).rounded(.down)
        
        //set cell width, height, and section insets
        self.itemSize = CGSize(width: cellWidth, height: cellHeight)
        
        //set top inset (space between NavBar and top cell)
        self.sectionInset = UIEdgeInsets(top: self.minimumInteritemSpacing  , left: 0, bottom: 0, right: 0)
        
        //handles iPhoneX landscape mode (camera)
        self.sectionInsetReference = SectionInsetReference.fromSafeArea
        
        print("prepare: 2 ", minimumInteritemSpacing, self.sectionInset, self.sectionInsetReference)
    }
    
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
