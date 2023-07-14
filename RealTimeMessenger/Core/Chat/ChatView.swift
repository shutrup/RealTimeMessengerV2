//
//  ChatView.swift
//  RealTimeMessenger
//
//  Created by Шарап Бамматов on 14.07.2023.
//

import SwiftUI

struct ChatView: View {
    @State private var messageText: String = ""
    
    var body: some View {
        VStack {
            ScrollView {
                header
                
                messages
            }
            
            Spacer()
            
            messageTextField
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}

extension ChatView {
    private var header: some View {
        VStack {
            CircleProfileImageView(user: .MOCK_USER, size: .xLarge)
            
            VStack(spacing: 4) {
                Text("Bruce Wayne")
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
