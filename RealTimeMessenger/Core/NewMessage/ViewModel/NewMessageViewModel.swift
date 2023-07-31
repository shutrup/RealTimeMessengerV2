//
//  NewMessageViewModel.swift
//  RealTimeMessenger
//
//  Created by Шарап Бамматов on 31.07.2023.
//

import Foundation
import Firebase

final class NewMessageViewModel: ObservableObject {
    @Published var users = [User]()
    
    @MainActor
    func fetchAllUsers() async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        let users = try await UserService.shared.fetchAllUsers()
        self.users = users.filter({ $0.id != uid })
    }
}
