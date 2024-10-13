//
//  viewController.swift
//  hd3
//
//  Created by Abdulaziz Jamaleddin on 10/12/24.
//

import SwiftUI
import GoogleSignIn
import GoogleSignInSwift
struct viewController: View {
    @EnvironmentObject var authViewModel: AuthenticationViewModel

    @State private var isActive = false
    var body: some View {
        if !isActive {
            if authViewModel.isSignedIn {
                           ContentView()
                               .environmentObject(authViewModel)
                       } else {
                           SignInView()
                               .environmentObject(authViewModel)
                       }        }
//        else {
////            splashScreen(isActive: $isActive)
//        }
    }
}
#Preview {
    viewController()
}

