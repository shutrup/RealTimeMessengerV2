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
    }
}

struct NewMessageView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            NewMessageView()
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
        ForEach(0..<10, id: \.self) { item in
            ContactsRowView()
            
            Divider()
                .padding(.leading, 40)
        }
    }
}
