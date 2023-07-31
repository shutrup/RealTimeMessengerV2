//
//  ContentViewModel.swift
//  RealTimeMessenger
//
//  Created by Шарап Бамматов on 16.07.2023.
//

import SwiftUI
import Combine
import Firebase

@MainActor
final class ContentViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        setupSubscribers()
    }
    
    private func setupSubscribers() {
        AuthService.shared.$userSession
            .receive(on: RunLoop.main)
            .sink { [weak self] user in
                
                self?.userSession = user
            }
            .store(in: &cancellables)
    }
    
}
