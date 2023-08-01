//
//  ChatViewModel.swift
//  RealTimeMessenger
//
//  Created by Шарап Бамматов on 01.08.2023.
//

import Foundation

final class ChatViewModel: ObservableObject {
    @Published var messageText = String()
    let user: User
    
    init(user: User) {
        self.user = user
    }
    
    func sendMessage() {
        MessageService.sendMessage(messageText, toUser: user)
    }
}
