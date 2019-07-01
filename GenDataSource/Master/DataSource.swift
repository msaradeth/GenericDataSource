//
//  DataSource.swift
//  GenDataSource
//
//  Created by Mike Saradeth on 6/30/19.
//  Copyright © 2019 Mike Saradeth. All rights reserved.
//

import Foundation

struct DataSource {
    static func getData() -> [Contact] {
        var listOfItems = ["An apple is a sweet, edible fruit produced by an apple tree.",
        "An apricot is a fruit, or the tree that bears the fruit, of several species in the genus Prunus (stone fruits).",
        "A banana is an edible fruit – botanically a berry – produced by several kinds of large herbaceous flowering plants in the genus Musa.",
        "A grape is a fruit, botanically a berry, of the deciduous woody vines of the flowering plant genus Vitis.",
        "Kiwifruit, or Chinese gooseberry is the edible berry of several species of woody vines in the genus Actinidia.",
        "The orange is the fruit of the citrus species Citrus × sinensis in the family Rutaceae. ",
        "A peach is a soft, juicy and fleshy stone fruit produced by a peach tree."]
        
        
        var contacts = [Contact]()
        for (index, lastName) in listOfItems.enumerated() {
            let firstName = "\(index) First Name"
            contacts.append(Contact(firstName: firstName, lastName: lastName))
        }
        
        for ii in listOfItems.count..<listOfItems.count+50 {
            contacts.append(Contact(firstName: String("\(ii) First Name"), lastName: String("\(ii) Last Name")))
        }
        
        return contacts
    }
}
