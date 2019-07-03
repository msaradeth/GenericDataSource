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
        let listOfItems = ["An apple is a sweet, edible fruit produced by an apple tree.",
        "An apricot is a fruit, or the tree that bears the fruit, of several species in the genus Prunus (stone fruits).",
        "Type constraints, as described in Type Constraints, enable you to define requirements on the type parameters associated with a generic function, subscript, or type.  It can also be useful to define requirements for associated types. You do this by defining a generic where clause. A generic where clause enables you to require that an associated type must conform to a certain protocol, or that certain type parameters and associated types must be the same. A generic where clause starts with the where keyword, followed by constraints for associated types or equality relationships between types and associated types. You write a generic where clause right before the opening curly brace of a type or function’s body.",
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
    
    
    static func getData2x2() -> [[Contact]] {
        let listOfItems = ["An apple is a sweet, edible fruit produced by an apple tree.",
                           "An apricot is a fruit, or the tree that bears the fruit, of several species in the genus Prunus (stone fruits).",
                           "Type constraints, as described in Type Constraints, enable you to define requirements on the type parameters associated with a generic function, subscript, or type.  It can also be useful to define requirements for associated types. You do this by defining a generic where clause. A generic where clause enables you to require that an associated type must conform to a certain protocol, or that certain type parameters and associated types must be the same. A generic where clause starts with the where keyword, followed by constraints for associated types or equality relationships between types and associated types. You write a generic where clause right before the opening curly brace of a type or function’s body.",
                           "A banana is an edible fruit – botanically a berry – produced by several kinds of large herbaceous flowering plants in the genus Musa.",
                           "A grape is a fruit, botanically a berry, of the deciduous woody vines of the flowering plant genus Vitis.",
                           "Kiwifruit, or Chinese gooseberry is the edible berry of several species of woody vines in the genus Actinidia.",
                           "The orange is the fruit of the citrus species Citrus × sinensis in the family Rutaceae. ",
                           "A peach is a soft, juicy and fleshy stone fruit produced by a peach tree."]
        
        
        var contacts = [[Contact]]()
        for index in 0..<20 {
            var contact = [Contact]()
            for (index, description) in listOfItems.enumerated() {
                let title = "Title: \(index)"
                contact.append(Contact(firstName:title, lastName: description))
            }
            contacts.append(contact)
        }
        return contacts
    }
}
