//
//  UserService.swift
//  RealTimeMessenger
//
//  Created by Шарап Бамматов on 31.07.2023.
//

import SwiftUI
import Firebase
import FirebaseFirestoreSwift

final class UserService {
    @Published var currentUser: User?
    
    static let shared = UserService()
        
    @MainActor
    func fetchCurrentUser() async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
        let user = try snapshot.data(as: User.self)
        self.currentUser = user
        print(currentUser)
    }
    
    @MainActor
    func fetchAllUsers(limit: Int? = nil) async throws -> [User] {
        let query = FirestoreConstants.UserCollection
        if let limit {
            query.limit(to: limit)
        }
        let snapshot = try await query.getDocuments()
        return snapshot.documents.compactMap({ try? $0.data(as: User.self )})
    }
    
    
    static func fetchUser(withUid uid: String, compl: @escaping (User) -> Void) {
        FirestoreConstants.UserCollection.document(uid).getDocument { snapshot, _ in
            guard let user = try? snapshot?.data(as: User.self) else { return }
            compl(user)
        }
    }
}
