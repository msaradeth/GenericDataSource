//
//  MasterViewModel.swift
//  GenDataSource
//
//  Created by Mike Saradeth on 6/28/19.
//  Copyright © 2019 Mike Saradeth. All rights reserved.
//

import Foundation
import UIKit


class MasterViewModel: NSObject {
    var dataSource: GenericDataSource<Contact, MasterCell>
    var items: [[Contact]]
    
    subscript(indexPath: IndexPath) -> Contact {
        return dataSource.items[indexPath.section][indexPath.row]
    }
    
    init(dataSource: GenericDataSource<Contact, MasterCell>) {
        self.dataSource = dataSource
        self.items = dataSource.items 
    }
}
