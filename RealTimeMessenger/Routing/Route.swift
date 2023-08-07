//
//  Route.swift
//  RealTimeMessenger
//
//  Created by Шарап Бамматов on 07.08.2023.
//

import Foundation

enum Route: Hashable {
    case profile(User)
    case chatView(User)
}
