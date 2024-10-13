//
//  viewController.swift
//  hd3
//
//  Created by Abdulaziz Jamaleddin on 10/12/24.
//

import SwiftUI
import GoogleSignIn
import GoogleSignInSwift
import SwiftData
struct viewController: View {
    @EnvironmentObject var authViewModel: AuthenticationViewModel
    @Query  var userInfo: [UserInfoThings];
    
    @State private var isActive = false
    var body: some View {
        if isActive {
            if !userInfo.isEmpty || authViewModel.isSignedIn{
                           ContentView()
                               .environmentObject(authViewModel)
                       } else {
                           SignInView()
                               .environmentObject(authViewModel)
                          if !userInfo.isEmpty{
                              ContentView()
                                  .environmentObject(authViewModel)
                           }
                       }
        }
        
        else {
            splashScreen(isActive: $isActive)
        }
    }
}
#Preview {
    viewController()
}

