//
//  AccountSummaryPage.swift
//  Bankz
//
//  Created by Zack Paulson on 7/26/23.
//
// AccountSummaryPage.swift
import SwiftUI

struct AccountSummaryPage: View {
    @State private var profilePicture: Image? = nil
    @State private var isShowingImagePicker = false
    @State private var selectedSourceType: UIImagePickerController.SourceType = .photoLibrary
    
    // Additional fields
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var email: String = ""
    @State private var accountBalance: Double = 0.0
    @State private var lastTwoTransactions: [String] = []
    
    // Function to generate a random 10-digit alphanumeric code for the account number
    private func generateAccountNumber() -> String {
        let characters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        return String((0..<10).map{ _ in characters.randomElement()! })
    }
    
    var body: some View {
        VStack {
            Text("Account Summary")
                .font(.largeTitle)
                .padding(.bottom, 20)
            
            if let profilePicture = profilePicture {
                profilePicture
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
                    .padding(.bottom, 20)
            } else {
                Button(action: {
                    self.isShowingImagePicker = true
                }) {
                    Text("Add Profile Picture")
                }
                .sheet(isPresented: $isShowingImagePicker) {
                    ImagePickerView(selectedImage: self.$profilePicture, sourceType: self.selectedSourceType)
                }
            }
            
            VStack(alignment: .leading, spacing: 15) {
                TextField("First Name", text: $firstName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("Last Name", text: $lastName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("Email", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            .padding(.horizontal)
            
            Text("Account Number: \(generateAccountNumber())")
                .padding(.top, 20)
            
            Text("Current Balance: $\(accountBalance, specifier: "%.2f")")
            
            VStack(alignment: .leading) {
                Text("Last Two Transactions:")
                    .font(.headline)
                
                // Display last two transactions here
                ForEach(lastTwoTransactions, id: \.self) { transaction in
                    Text(transaction)
                }
            }
            .padding(.top, 20)
            
            Spacer()
        }
        .padding()
    }
}

// Helper view for image picker
struct ImagePickerView: UIViewControllerRepresentable {
    @Binding var selectedImage: Image?
    var sourceType: UIImagePickerController.SourceType
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePickerView>) -> UIImagePickerController {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = sourceType
        imagePicker.delegate = context.coordinator
        return imagePicker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePickerView>) {
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        var parent: ImagePickerView
        
        init(_ parent: ImagePickerView) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let uiImage = info[.originalImage] as? UIImage {
                parent.selectedImage = Image(uiImage: uiImage)
            }
            picker.dismiss(animated: true)
        }
    }
}
