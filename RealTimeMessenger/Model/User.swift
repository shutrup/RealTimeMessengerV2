//
//  User.swift
//  RealTimeMessenger
//
//  Created by Шарап Бамматов on 14.07.2023.
//

import Foundation

struct User: Codable, Identifiable, Hashable {
    var id = NSUUID().uuidString
    let fullname: String
    let email: String
    var profileImageIrl: String?
}

extension User {
    static var MOCK_USER: User {
        User(fullname: "Bruce Wayne", email: "banman@mail.ru", profileImageIrl: "hero")
    }
}
