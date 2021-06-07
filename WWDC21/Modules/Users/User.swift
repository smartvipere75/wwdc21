//
//  User.swift
//  WWDC21
//
//  Created by Bezhan Odinaev on 6/8/21.
//

import Foundation

struct User: Codable, Identifiable {
    let id: Int
    let name: String
    let email: String
}
