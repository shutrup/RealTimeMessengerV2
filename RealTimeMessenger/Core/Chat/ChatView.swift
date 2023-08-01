//
//  ChatView.swift
//  RealTimeMessenger
//
//  Created by Шарап Бамматов on 14.07.2023.
//

import SwiftUI

struct ChatView: View {
    @State private var messageText: String = ""
    let user: User
    
    var body: some View {
        VStack {
            header
            
            ScrollView {
                messages
            }
            
            Spacer()
            
            messageTextField
        }
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
        ForEach(0..<15, id: \.self) { message in
            ChatMessageCell(isFromCurrentUser: .random())
        }
    }
    private var messageTextField: some View {
        ZStack(alignment: .trailing) {
            TextField("Message...", text: $messageText, axis: .vertical)
                .padding(12)
                .padding(.trailing, 48)
                .background(Color(.systemGroupedBackground))
                .clipShape(Capsule())
                .font(.subheadline)
                
            Button {
                
            } label: {
                Text("send")
                    .fontWeight(.semibold)
            }
            .padding(.horizontal)
        }
        .padding()
    }
}
