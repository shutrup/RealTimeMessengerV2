//
//  ProfileView.swift
//  RealTimeMessenger
//
//  Created by Шарап Бамматов on 14.07.2023.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack {
            header
            
            listSettings
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

extension ProfileView {
    private var header: some View {
        VStack {
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 80, height: 80)
                .foregroundColor(Color(.systemGray4))
            
            Text("Bruce Wayne")
                .font(.title2)
                .fontWeight(.semibold)
        }
    }
    private var listSettings: some View {
        VStack {
            List {
                Section {
                    ForEach(SettingsOptionsViewModel.allCases, id: \.self) { item in
                        HStack {
                            Image(systemName: item.imageName)
                                .resizable()
                                .frame(width: 24, height: 24)
                                .foregroundColor(item.imageBackgroundColor)
                            
                            Text(item.title)
                                .font(.subheadline)
                        }
                    }
                }
                
                Section {
                    Button {
                        
                    } label: {
                        Text("Log out")
                    }
                    
                    Button {
                        
                    } label: {
                        Text("Delete Account")
                    }
                }
                .foregroundColor(.red)
            }
        }
    }
}
