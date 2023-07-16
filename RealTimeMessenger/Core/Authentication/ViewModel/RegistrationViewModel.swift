//
//  RegistrationViewModel.swift
//  RealTimeMessenger
//
//  Created by Шарап Бамматов on 15.07.2023.
//

import SwiftUI

final class RegistrationViewModel: ObservableObject {
    @Published var email = String()
    @Published var password = String()
    @Published var fullname = String()
    
    func createUser() async throws {
        try await AuthService.shared.createUser(withEmail: email, password: password, fullname: fullname)
    }
}
