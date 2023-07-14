//
//  ProfileView.swift
//  RealTimeMessenger
//
//  Created by Шарап Бамматов on 14.07.2023.
//

import SwiftUI
import PhotosUI

struct ProfileView: View {
    @StateObject var vm = ProfileViewModel()
    let user: User
    
    var body: some View {
        VStack {
            header
            
            listSettings
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ProfileView(user: User.MOCK_USER)
        }
    }
}

extension ProfileView {
    @ViewBuilder private var header: some View {
        VStack {
            PhotosPicker(selection: $vm.selectedItem) {
                if let profileImage = vm.profileImage {
                    profileImage
                        .resizable()
                        .scaledToFill()
                        .frame(width: 80, height: 80)
                        .clipShape(Circle())
                } else {
                    Image(user.profileImageIrl ?? "")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 80, height: 80)
                        .clipShape(Circle())
                }
            }
            
            Text(user.fullname)
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
