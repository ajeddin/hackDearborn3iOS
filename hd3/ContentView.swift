//
//  ContentView.swift
//  hd3
//
//  Created by Abdulaziz Jamaleddin on 10/12/24.
//

import SwiftUI


struct ContentView: View {
    @EnvironmentObject var authViewModel: AuthenticationViewModel
    var body: some View {
        let accessToken = authViewModel.user?.accessToken
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
