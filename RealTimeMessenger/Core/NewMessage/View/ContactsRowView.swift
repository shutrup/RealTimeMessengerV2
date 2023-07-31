//
//  ContactsRowView.swift
//  RealTimeMessenger
//
//  Created by Шарап Бамматов on 14.07.2023.
//

import SwiftUI

struct ContactsRowView: View {
    var user: User
    
    var body: some View {
        HStack {
            CircleProfileImageView(user: user, size: .small)
            
            Text(user.fullname)
                .font(.subheadline)
                .fontWeight(.semibold)
            
            Spacer()
        }
        .padding(.leading)
    }
}

struct ContactsRowView_Previews: PreviewProvider {
    static var previews: some View {
        ContactsRowView(user: .MOCK_USER)
    }
}
