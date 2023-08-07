//
//  ActiveNowView.swift
//  RealTimeMessenger
//
//  Created by Шарап Бамматов on 14.07.2023.
//

import SwiftUI

struct ActiveNowView: View {
    @StateObject private var vm = ActiveNowViewModel()
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 32) {
                ForEach(vm.users, id: \.self) { user in
                    NavigationLink(value: Route.chatView(user)) {
                        VStack {
                            ZStack(alignment: .bottomTrailing) {
                                CircleProfileImageView(user: user, size: .medium)
                                
                                ZStack {
                                    Circle()
                                        .fill(.white)
                                        .frame(width: 18, height: 18)
                                    
                                    Circle()
                                        .fill(Color(.systemGreen))
                                        .frame(width: 12, height: 12)
                                }
                            }
                            
                            Text(user.firstName)
                                .font(.footnote)
                                .foregroundColor(.gray)
                        }
                    }
                }
            }
            .padding()
        }
        .frame(height: 106)
    }
}

struct ActiveNowView_Previews: PreviewProvider {
    static var previews: some View {
        ActiveNowView()
    }
}
