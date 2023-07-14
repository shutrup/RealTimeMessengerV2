//
//  CircleProfileImageView.swift
//  RealTimeMessenger
//
//  Created by Шарап Бамматов on 14.07.2023.
//

import SwiftUI

struct CircleProfileImageView: View {
    let user: User
    let size: ProfileImageSize
    var body: some View {
        if let profileImage = user.profileImageIrl {
            Image(profileImage)
                .resizable()
                .scaledToFill()
                .frame(width: size.dimension, height: size.dimension)
                .clipShape(Circle())
        } else {
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: size.dimension, height: size.dimension)
                .foregroundColor(Color(.systemGray4))
        }
    }
}

struct CircleProfileImageView_Previews: PreviewProvider {
    static var previews: some View {
        CircleProfileImageView(user: .MOCK_USER, size: .medium)
    }
}

enum ProfileImageSize {
    case xxSmall, xSmall, small, medium, large, xLarge
    
    var dimension: CGFloat {
        switch self {
        case .xxSmall:
            return 28
        case .xSmall:
            return 32
        case .small:
            return 40
        case .medium:
            return 56
        case .large:
            return 64
        case .xLarge:
            return 80
        }
    }
}
