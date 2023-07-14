//
//  InboxView.swift
//  RealTimeMessenger
//
//  Created by Шарап Бамматов on 14.07.2023.
//

import SwiftUI

struct InboxView: View {
    @State var showNewMessageView: Bool = false
    
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
            .fullScreenCover(isPresented: $showNewMessageView, content: {
                NewMessageView()
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
                Image(systemName: "person.circle.fill")
                
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
