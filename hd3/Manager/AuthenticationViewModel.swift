import SwiftUI
import GoogleSignIn
import GoogleSignInSwift

class AuthenticationViewModel: ObservableObject {
    @Published var isSignedIn = false
    @Published var user: GIDGoogleUser?

    func signIn() {
        // Get the root view controller
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let rootViewController = windowScene.windows.first?.rootViewController else {
            print("Unable to get root view controller")
            return
        }

        // Specify the scopes
        let scopes = ["https://www.googleapis.com/auth/calendar"]

        // Sign in
        GIDSignIn.sharedInstance.signIn(
            withPresenting: rootViewController,
            hint: nil,
            additionalScopes: scopes
        ) { [weak self] signInResult, error in
            if let error = error {
                print("Sign-in error: \(error.localizedDescription)")
                return
            }

            guard let user = signInResult?.user else {
                print("No user returned")
                return
            }

            self?.user = user
            self?.isSignedIn = true
        }
    }

    func signOut() {
        GIDSignIn.sharedInstance.signOut()
        isSignedIn = false
        user = nil
    }
}
