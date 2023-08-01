//
//  NewMessageView.swift
//  RealTimeMessenger
//
//  Created by Шарап Бамматов on 14.07.2023.
//

import SwiftUI

struct NewMessageView: View {
    @Environment(\.dismiss) var dismiss
    @State var searchText: String = ""
    @StateObject var vm = NewMessageViewModel()
    @Binding var selectedUser: User? 
    
    var body: some View {
        NavigationStack {
            ScrollView {
                searchTextField
                
                contactsTitle
                
                listContacts
            }
            .navigationTitle("New Message")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                leadingToolBarItem
            }
        }
        .onAppear {
            Task {
                try await vm.fetchAllUsers()
            }
        }
    }
}

struct NewMessageView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            NewMessageView(selectedUser: .constant(User.MOCK_USER))
        }
    }
}

extension NewMessageView {
    private var leadingToolBarItem: some ToolbarContent {
        ToolbarItem(placement: .navigationBarLeading) {
            Button("Cancel") {
                dismiss()
            }
            .foregroundColor(.black)
        }
    }
    private var searchTextField: some View {
        TextField("To: ", text: $searchText)
            .frame(height: 44)
            .padding(.leading)
            .background(Color(.systemGroupedBackground))
    }
    private var contactsTitle: some View {
        Text("CONTACTS")
            .foregroundColor(.gray)
            .font(.footnote)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
    }
    private var listContacts: some View {
        ForEach(vm.users, id: \.self) { user in
            VStack {
                ContactsRowView(user: user)
                
                Divider()
                    .padding(.leading, 40)
            }
            .onTapGesture {
                selectedUser = user
                dismiss()
            }
        }
    }
}
