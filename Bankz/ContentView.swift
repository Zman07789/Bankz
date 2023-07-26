//
//  ContentView.swift
//  Bankz
//
//  Created by Zack Paulson on 7/20/23.
//
import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                Image("mainpagepic")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 350, height: 350)
                    .foregroundColor(.red)

                Text("Welcome to Bankz!\nHow can we assist you today?")
                    .font(.headline)
                    .multilineTextAlignment(.center)
                    .padding()

                HStack(spacing: 20) {
                    NavigationLink(destination: LoginPage()) {
                        Text("Log In")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(8)
                    }

                    NavigationLink(destination: SignupPage()) {
                        Text("Sign Up")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.green)
                            .cornerRadius(8)
                    }
                }
            }
            .padding()
            .background(Color.white)
        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
