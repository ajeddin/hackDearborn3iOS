//
//  SignInView.swift
//  hd3
//
//  Created by Gabriel Push on 10/12/24.
//
import SwiftUI
import GoogleSignInSwift
import SwiftData

struct SignInView: View {
    @Environment(\.modelContext) var context: ModelContext
    @EnvironmentObject var authViewModel: AuthenticationViewModel

    var body: some View {
        VStack {
            Text("Welcome to ProductivityApp")
                .font(.largeTitle)
                .padding()

            GoogleSignInButton(action: {
                authViewModel.signIn(modelContext: context) 
            })
            .frame(width: 200, height: 50)
        }
    }
}

#Preview {
    SignInView()
}
