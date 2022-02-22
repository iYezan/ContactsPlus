//
//  Contact.swift
//  ContactsPlus
//
//  Created by iYezan on 22/02/2022.
//

import Foundation

struct Contact {
    var name: String?
    var jobTitle: String?
    var country: String?
}

extension Contact {
    static let getContacts = [
        Contact(name: "APEE", jobTitle: "Designer", country: "UK")
    ]
}
