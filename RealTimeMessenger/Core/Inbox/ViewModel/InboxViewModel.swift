//
//  InboxViewModel.swift
//  RealTimeMessenger
//
//  Created by Шарап Бамматов on 31.07.2023.
//

import SwiftUI
import Combine
import Firebase

final class InboxViewModel: ObservableObject {
    @Published var currentUser: User?
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        setupSubscribers()
    }
    
    private func setupSubscribers() {
        UserService.shared.$currentUser
            .sink { [weak self] user in
                self?.currentUser = user
            }
            .store(in: &cancellables)
    }
}
