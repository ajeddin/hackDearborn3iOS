import SwiftUI
import GoogleSignIn
import GoogleSignInSwift
import SwiftData

class AuthenticationViewModel: ObservableObject {
    @Published var isSignedIn = false
    @Published var user: GIDGoogleUser?

    func signIn(modelContext: ModelContext) {
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

            // Create the UserInfoThings model and insert into context
            let userStuff = UserInfoThings(isLoggedIn: true, user: user)
            modelContext.insert(userStuff)
            
            do {
                try modelContext.save()
            } catch {
                print("Failed to save user info: \(error.localizedDescription)")
            }
            
            self?.isSignedIn = true
            
            
        }
    }

    func signOut(modelContext: ModelContext) {
        GIDSignIn.sharedInstance.signOut()
        isSignedIn = false
        user = nil
        do {
            try modelContext.delete(model: UserInfoThings.self)
        } catch {
            print("Failed to clear all Country and City data.")
        }
    }
}
