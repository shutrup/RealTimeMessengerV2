//
//  LoginViewModel.swift
//  RealTimeMessenger
//
//  Created by Шарап Бамматов on 15.07.2023.
//

import SwiftUI

@MainActor
final class LoginViewModel: ObservableObject {
    @Published var email = String()
    @Published var password = String()
    
    func login() async throws {
        try await AuthService.shared.login(withEmail: email, password: password)
    }
}
