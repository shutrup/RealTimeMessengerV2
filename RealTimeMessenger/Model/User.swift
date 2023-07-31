//
//  User.swift
//  RealTimeMessenger
//
//  Created by Шарап Бамматов on 14.07.2023.
//

import Foundation
import FirebaseFirestoreSwift

struct User: Codable, Identifiable, Hashable {
    @DocumentID var uid: String?
    let fullname: String
    let email: String
    var profileImageIrl: String?
    
    var id: String {
        return uid ?? UUID().uuidString
    }
}

extension User {
    static var MOCK_USER: User {
        User(fullname: "Bruce Wayne", email: "banman@mail.ru", profileImageIrl: "hero")
    }
}
