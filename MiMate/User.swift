//
//  User.swift
//  MiMate
//
//  Created by Leila on 2/15/24.
//

import Foundation

struct User: Hashable, Identifiable, Codable {
    let id: UUID
    var isActive: Bool
    var name: String
    var age: Int
    var company: String
    var email: String
    var address: String
    var about: String
    var registered: Date
    var tags: [String]
    var friends: [Friend]
    
    static let example = User(id: UUID(), isActive: true, name: "ExName", age: 99, company: "ExCompany", email: "exemail@email.com", address: "ExAddress", about: "Ex Info About", registered: Date.now, tags: ["swift", "example"], friends: [])
}
