//
//  SelfSizingViewModel.swift
//  GenDataSource
//
//  Created by Mike Saradeth on 7/2/19.
//  Copyright © 2019 Mike Saradeth. All rights reserved.
//

import Foundation
import UIKit


class SelfSizingNibViewModel: NSObject {
    var dataSource: GenericDataSource<Contact, MasterCell2>
    var items: [[Contact]]
    
    subscript(indexPath: IndexPath) -> Contact {
        return dataSource.items[indexPath.section][indexPath.row]
    }
    
    init(dataSource: GenericDataSource<Contact, MasterCell2>) {
        self.dataSource = dataSource
        self.items = dataSource.items
    }
    
    
    
}



