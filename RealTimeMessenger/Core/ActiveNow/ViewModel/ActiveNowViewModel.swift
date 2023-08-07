//
//  ActiveNowViewModel.swift
//  RealTimeMessenger
//
//  Created by Шарап Бамматов on 07.08.2023.
//

import Foundation
import Firebase

@MainActor
final class ActiveNowViewModel: ObservableObject {
    @Published var users: [User] = []
    
    init() {
        Task { try await self.fetchUsers() }
    }
    
    private func fetchUsers() async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        let users = try await UserService.shared.fetchAllUsers()
        self.users = users.filter({ $0.id != uid })
    }
}
