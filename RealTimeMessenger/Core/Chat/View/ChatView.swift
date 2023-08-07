//
//  ChatView.swift
//  RealTimeMessenger
//
//  Created by Шарап Бамматов on 14.07.2023.
//

import SwiftUI

struct ChatView: View {
    @StateObject var vm: ChatViewModel
    let user: User
    
    init(user: User) {
        self.user = user
        self._vm = StateObject(wrappedValue: ChatViewModel(user: user))
    }
    
    var body: some View {
        VStack {
            header
            
            ScrollView {
                messages
            }
            
            Spacer()
            
            messageTextField
        }
        .navigationTitle(user.fullname)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView(user: .MOCK_USER)
    }
}

extension ChatView {
    private var header: some View {
        VStack {
            CircleProfileImageView(user: user, size: .xLarge)
            
            VStack(spacing: 4) {
                Text(user.fullname)
                    .font(.title3)
                    .fontWeight(.semibold)
                
                Text("Messanger")
                    .font(.footnote)
                    .foregroundColor(.gray)
            }
        }
    }
    private var messages: some View {
        LazyVStack {
            ForEach(vm.messages, id: \.self) { message in
                ChatMessageCell(message: message)
            }
        }
    }
    private var messageTextField: some View {
        ZStack(alignment: .trailing) {
            TextField("Message...", text: $vm.messageText, axis: .vertical)
                .padding(12)
                .padding(.trailing, 48)
                .background(Color(.systemGroupedBackground))
                .clipShape(Capsule())
                .font(.subheadline)
                
            Button {
                vm.sendMessage()
                vm.messageText = ""
            } label: {
                Text("send")
                    .fontWeight(.semibold)
            }
            .padding(.horizontal)
        }
        .padding()
    }
}
