//
//  LoginViewModel.swift
//  RealTimeMessenger
//
//  Created by Шарап Бамматов on 15.07.2023.
//

import SwiftUI

final class LoginViewModel: ObservableObject {
    @Published var email = String()
    @Published var password = String()
    
    func login() async throws {
        try await AuthService().login(withEmail: email, password: password)
    }
}
