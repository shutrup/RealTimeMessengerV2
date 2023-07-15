//
//  RegistrationView.swift
//  RealTimeMessenger
//
//  Created by Шарап Бамматов on 14.07.2023.
//

import SwiftUI

struct RegistrationView: View {
    @StateObject private var vm = RegistrationViewModel()
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            Spacer()
            
            MessengerLogo()
            
            textFields
            
            signUpButton
            
            Spacer()
            
            Divider()
            
            signInButton
        }
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            RegistrationView()
        }
    }
}

extension RegistrationView {
    private var textFields: some View {
        VStack {
            TextField("Enter your email", text: $vm.email)
                .modifier(AuthTextFieldModifier())
            
            TextField("Enter your full name", text: $vm.fullname)
                .modifier(AuthTextFieldModifier())
            
            SecureField("Enter your password", text: $vm.password)
                .modifier(AuthTextFieldModifier())
        }
    }
    private var signUpButton: some View {
        Button {
            Task { try await vm.createUser() }
        } label: {
            Text("Sign Up")
                .modifier(CustomButtonModifier())
        }
        .padding(.top)
    }
    private var signInButton: some View {
        Button {
            dismiss()
        } label: {
            HStack(spacing: 3) {
                Text("Already have a account?")
                
                Text("Sign In")
                    .fontWeight(.semibold)
            }
            .font(.footnote)
        }
        .padding(.vertical)
    }
}
