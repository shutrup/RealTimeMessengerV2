//
//  MessengerLogo.swift
//  RealTimeMessenger
//
//  Created by Шарап Бамматов on 14.07.2023.
//

import SwiftUI

struct MessengerLogo: View {
    var body: some View {
        Image("messenger")
            .resizable()
            .scaledToFit()
            .frame(width: 150, height: 150)
            .padding()
    }
}

struct MessengerLogo_Previews: PreviewProvider {
    static var previews: some View {
        MessengerLogo()
    }
}
