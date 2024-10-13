//
//  hd3App.swift
//  hd3
//
//  Created by Abdulaziz Jamaleddin on 10/12/24.
//

import SwiftUI
import GoogleSignIn
import GoogleSignInSwift

@main
struct hd3App: App {
    @StateObject var authViewModel = AuthenticationViewModel()
    var body: some Scene {
        WindowGroup {
            if authViewModel.isSignedIn {
                ContentView()
                    .environmentObject(authViewModel)
            } else {
                SignInView()
                    .environmentObject(authViewModel)
            }
        }
    }
}
