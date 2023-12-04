import SwiftUI


struct ContentView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var age: String = ""
    @State private var hasAcceptedPrivacyAgreement: Bool = false
    @State private var showingSignUp = false

    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            
            Text("Chat Secure Login")
                .font(.headline)
            
            TextField("Username", text: $username)
                .padding()
                .border(Color.gray, width: 0.5)
            
            SecureField("Password", text: $password)
                .padding()
                .border(Color.gray, width: 0.5)
            
            TextField("Age", text: $age)
                .keyboardType(.numberPad)
                .padding()
                .border(Color.gray, width: 0.5)
            
            Toggle(isOn: $hasAcceptedPrivacyAgreement) {
                Text("Accept Privacy Agreement")
            }
            .padding()
            
            Button("Login") {
                // Handle login
            }
            .padding()
            
            HStack(spacing: 40) {
                Button("Apple Login") {
                    // Handle Apple Login
                }
                
                Button("Google Login") {
                    
                    // Handle Google Login
                }
            }
            .padding()
            
            Button("Don't have an account? Sign Up") {
                showingSignUp.toggle()
            }
            .sheet(isPresented: $showingSignUp) {
                SignUpView()
            }

        }
        .padding()
    }
}

struct SignUpView: View {
    @State private var username: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var passwordConfirmation: String = ""

    var body: some View {
        VStack(spacing: 20) {
            Text("Sign Up for Chat Secure")
                .font(.headline)

            TextField("Username", text: $username)
                .padding()
                .border(Color.gray, width: 0.5)

            TextField("Email", text: $email)
                .padding()
                .border(Color.gray, width: 0.5)
                .keyboardType(.emailAddress)
                .autocapitalization(.none)

            SecureField("Password", text: $password)
                .padding()
                .border(Color.gray, width: 0.5)

            SecureField("Confirm Password", text: $passwordConfirmation)
                .padding()
                .border(Color.gray, width: 0.5)

            Button("Sign Up") {
                // Handle Sign Up Logic
            }
            .padding()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
