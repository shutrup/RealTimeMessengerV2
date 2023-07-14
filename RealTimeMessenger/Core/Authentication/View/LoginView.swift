//
//  LoginView.swift
//  RealTimeMessenger
//
//  Created by Шарап Бамматов on 14.07.2023.
//

import SwiftUI

struct LoginView: View {
    @State var email: String = ""
    @State var password: String = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                
                MessengerLogo()
                
                textFields
                
                forgotAndLoginButtons
                
                customDivider
                
                facebookButton
                
                Spacer()
                
                Divider()
                
                signUpButton
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

extension LoginView {
    private var textFields: some View {
        VStack {
            TextField("Enter your email", text: $email)
                .modifier(AuthTextFieldModifier())
            
            SecureField("Enter your password", text: $password)
                .modifier(AuthTextFieldModifier())
        }
    }
    private var forgotAndLoginButtons: some View {
        Group {
            Button {
                
            } label: {
                Text("Forgot Password?")
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .padding(.top)
                    .padding(.trailing, 28)
            }
            .frame(maxWidth: .infinity, alignment: .trailing)
            
            Button {
                
            } label: {
                Text("Login")
                    .modifier(CustomButtonModifier())
            }
            .padding(.vertical)
        }
    }
    private var customDivider: some View {
        HStack {
            Rectangle()
                .frame(width: (UIScreen.main.bounds.width / 2) - 40, height: 0.5)
            
            Text("OR")
                .font(.footnote)
                .fontWeight(.semibold)
            
            Rectangle()
                .frame(width: (UIScreen.main.bounds.width / 2) - 40, height: 0.5)
        }
        .foregroundColor(.gray)
    }
    private var facebookButton: some View {
        HStack {
            Image("facebook")
                .resizable()
                .frame(width: 20, height: 20)
            
            Text("Continue with Facebook")
                .font(.footnote)
                .fontWeight(.semibold)
                .foregroundColor(Color(.systemBlue))
        }
        .padding(.top, 8)
    }
    private var signUpButton: some View {
        NavigationLink {
            Text("SIGN IN")
        } label: {
            HStack(spacing: 3) {
                Text("Don't have an account?")
                
                Text("Sign Up")
                    .fontWeight(.semibold)
            }
            .font(.footnote)
        }
        .padding(.vertical)
    }
}
