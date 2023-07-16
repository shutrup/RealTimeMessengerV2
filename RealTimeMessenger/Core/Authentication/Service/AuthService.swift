//
//  AuthService.swift
//  RealTimeMessenger
//
//  Created by Шарап Бамматов on 15.07.2023.
//

import Foundation
import Firebase

class AuthService {
    
    @Published var userSession: FirebaseAuth.User?
    
    static let shared = AuthService()
    
    init() {
        self.userSession = Auth.auth().currentUser
        print("DEBUG: User session id is \(String(describing: userSession?.uid))")
    }
    
    func login(
        withEmail email: String,
        password: String
    ) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
        } catch {
            print("DEBUG: Failed to signIn with error \(error.localizedDescription)")
        }
    }
    
    func createUser(
        withEmail email: String,
        password: String,
        fullname: String
    ) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
        }
        catch {
            print("DEBUG: Failed to create user \(error.localizedDescription)")
        }
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
            self.userSession = nil
        } catch {
            print("DEBUG: Failed to signOut with error \(error.localizedDescription)")
        }
    }
}
