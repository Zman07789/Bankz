//
//  LoginPage.swift
//  Bankz
//
//  Created by Zack Paulson on 7/20/23.
//
import SwiftUI

struct LoginPage: View {
    @State private var usernameEmail: String = ""
    @State private var password: String = ""
    
    var body: some View {
        VStack {
            Image("mainpagepic")
                .resizable()
                .scaledToFit()
                .frame(width: 350, height: 350)
                .foregroundColor(.red)
            
            Text("Welcome to Bankz!\nPlease enter your Username/Email and Password:")
                .font(.headline)
                .multilineTextAlignment(.center)
                .padding()
            
            VStack(spacing: 20) {
                // Username/Email input
                TextField("Username/Email", text: $usernameEmail)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
                    .autocapitalization(.none)
                
                // Password input
                SecureField("Password", text: $password)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
            }
            .padding()
            
            // Add your login action here, e.g., a button to submit the login details
            Button(action: {
                // Perform login action here using the provided credentials
                // For example, you can check if the credentials are valid and navigate to the user's account page.
                // You might want to use an authentication service to handle the login process securely.
                print("Username/Email: \(usernameEmail)")
                print("Password: \(password)")
            }) {
                Text("Log In")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(8)
            }
        }
        .padding()
        .background(Color.white)
    }
}
