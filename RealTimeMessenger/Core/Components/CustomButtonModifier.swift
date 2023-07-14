//
//  CustomButtonModifier.swift
//  RealTimeMessenger
//
//  Created by Шарап Бамматов on 14.07.2023.
//

import SwiftUI

struct CustomButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .fontWeight(.semibold)
            .foregroundColor(.white)
            .frame(width: UIScreen.main.bounds.width - 40, height: 44)
            .background(Color(.systemBlue))
            .cornerRadius(10)
    }
}
