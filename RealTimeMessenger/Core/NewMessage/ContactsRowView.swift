//
//  ContactsRowView.swift
//  RealTimeMessenger
//
//  Created by Шарап Бамматов on 14.07.2023.
//

import SwiftUI

struct ContactsRowView: View {
    var body: some View {
        HStack {
            CircleProfileImageView(user: User.MOCK_USER, size: .small)
            
            Text("Chadwick Bozeman")
                .font(.subheadline)
                .foregroundColor(.gray)
            
            Spacer()
        }
        .padding(.leading)
    }
}

struct ContactsRowView_Previews: PreviewProvider {
    static var previews: some View {
        ContactsRowView()
    }
}
