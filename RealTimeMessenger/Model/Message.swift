//
//  Message.swift
//  RealTimeMessenger
//
//  Created by Шарап Бамматов on 01.08.2023.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

struct Message: Identifiable, Codable, Hashable {
    @DocumentID var messageId: String?
    let fromId: String
    let toId: String
    let messageText: String
    let timestamp: Timestamp
    
    var user: User?
    var id: String {
        messageId ?? NSUUID().uuidString
    }
    
    var chatPartnerId: String {
        fromId == Auth.auth().currentUser?.uid ? toId : fromId
    }
    
    var isFromCurrentUser: Bool {
        fromId == Auth.auth().currentUser?.uid
    }
}
