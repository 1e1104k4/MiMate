//
//  Friend.swift
//  MiMate
//
//  Created by Leila on 2/15/24.
//

import Foundation

struct Friend: Hashable, Identifiable, Codable {
    let id: UUID
    var name: String
}
