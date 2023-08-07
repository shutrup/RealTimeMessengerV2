//
//  InboxService.swift
//  RealTimeMessenger
//
//  Created by Шарап Бамматов on 07.08.2023.
//

import SwiftUI
import Firebase

class InboxService {
    @Published var documentChanges = [DocumentChange]()
    
    func observeRecentMessages() {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        let query = FirestoreConstants.MessageCollection
            .document(uid)
            .collection("recent-messages")
            .order(by: "timestamp", descending: false)
        
        query.addSnapshotListener { snapshot, _ in
            guard let change = snapshot?.documentChanges.filter({
                $0.type == .added || $0.type == .modified})
            else {
                return
            }
            
            self.documentChanges = change
        }
    }
}
