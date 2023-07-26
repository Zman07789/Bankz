import SwiftUI

struct SignupPage: View {
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var email: String = ""
    @State private var chosenUsername: String = ""
    @State private var password: String = ""
    @State private var showCredentials = false
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Sign Up")
                    .font(.largeTitle)
                    .padding(.bottom, 20)
                
                VStack(alignment: .leading, spacing: 15) {
                    TextField("First Name", text: $firstName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    TextField("Last Name", text: $lastName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    TextField("Email", text: $email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    TextField("Choose a Username", text: $chosenUsername)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    SecureField("Password", text: $password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                .padding(.horizontal)
                
                Button(action: {
                    // Save the username and password, and show the credentials
                    self.showCredentials.toggle()
                }) {
                    Text("I Am Ready To Make Bank")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(8)
                }
                .padding()
                
                if showCredentials {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Your Username: \(chosenUsername)")
                        Text("Your Password: \(password)")
                        Text("Write this information down and keep it safe!")
                    }
                    .padding()
                }
                
                Spacer()
                
                NavigationLink(destination: AccountSummaryPage()) {
                    Text("Next")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(8)
                }
                .padding()
            }
            .padding()
        }
    }
}

#if DEBUG
struct SignupPage_Previews: PreviewProvider {
    static var previews: some View {
        SignupPage()
    }
}
#endif
