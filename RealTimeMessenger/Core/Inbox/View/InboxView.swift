//
//  InboxView.swift
//  RealTimeMessenger
//
//  Created by Шарап Бамматов on 14.07.2023.
//

import SwiftUI

struct InboxView: View {
    @State private var showNewMessageView: Bool = false
    @StateObject private var vm = InboxViewModel()
    
    @State private var selectedUser: User? 
    @State private var showChat: Bool = false
    
    private var user: User? {
        return vm.currentUser
    }
    
    var body: some View {
        NavigationStack {
            VStack { // instead of ScrollView
                ActiveNowView()
                
                List {
                    ForEach(0..<10, id:\.self) { row in
                        InboxRowView()
                    }
                }
                .listStyle(.plain)
//                .frame(height: UIScreen.main.bounds.height - 120) modifier for ScrollView
            }
            .onChange(of: selectedUser, perform: { newValue in
                showChat = newValue != nil
            })
            .navigationDestination(for: User.self, destination: { user in
                ProfileView(user: user)
            })
            .navigationDestination(isPresented: $showChat, destination: {
                if let user = selectedUser {
                    ChatView(user: user)
                }
            })
            .fullScreenCover(isPresented: $showNewMessageView, content: {
                NewMessageView(selectedUser: $selectedUser)
            })
            .toolbar {
                leadingToolBarItem
                
                trailingToolBarItem
            }
        }
    }
}

struct InboxView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            InboxView()
        }
    }
}

extension InboxView {
    private var leadingToolBarItem: some ToolbarContent {
        ToolbarItem(placement: .navigationBarLeading) {
            HStack {
                NavigationLink(value: user) {
                    CircleProfileImageView(user: user, size: .xSmall)
                }
                
                Text("Chats")
                    .font(.title)
                    .fontWeight(.semibold)
            }
        }
    }
    private var trailingToolBarItem: some ToolbarContent {
        ToolbarItem(placement: .navigationBarTrailing) {
            Button {
                self.showNewMessageView.toggle()
            } label: {
                Image(systemName: "square.and.pencil.circle.fill")
                    .resizable()
                    .frame(width: 32, height: 32)
                    .foregroundStyle(.black, Color(.systemGray5))
            }
        }
    }
}
