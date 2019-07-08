//
//  Protocols.swift
//  GenDataSource
//
//  Created by Mike Saradeth on 7/1/19.
//  Copyright © 2019 Mike Saradeth. All rights reserved.
//

import Foundation
import UIKit

//GenericCell Protocol
public protocol CellProtocol {
    associatedtype DataType
    static var cellIdentifier: String {get}
    func configure(item: DataType)
}



