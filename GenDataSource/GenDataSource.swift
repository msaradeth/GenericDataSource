//
//  GenDataSource.swift
//  GenDataSource
//
//  Created by Mike Saradeth on 6/27/19.
//  Copyright © 2019 Mike Saradeth. All rights reserved.
//

import Foundation
import UIKit

class GenDataSource<T>: NSObject, UICollectionViewDataSource {
    var items: [T]
    
    init(items: [T]) {
        self.items = items
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MasterCell.cellIdentifier, for: indexPath) as! MasterCell
        cell.configure(item: items[indexPath.row])
    }
}

