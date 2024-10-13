//
//  calendarView.swift
//  hd3
//
//  Created by Abdulaziz Jamaleddin on 10/12/24.
//
import SwiftUI
import SwiftData
struct calendarView: View {
    @Query  var userInfo: [UserInfoThings]
    var authViewModel: AuthenticationViewModel
    var geoProx : GeometryProxy
    @Environment(\.modelContext) var context: ModelContext

    var body: some View {
        if !userInfo.isEmpty{

        VStack(spacing: 20) {
            AsyncImage(url: URL(string: userInfo[0].userImageURL))
                .scaledToFit()
                .clipShape(Circle())
                .shadow(radius: 10)
            
            Text(userInfo[0].userName)
                .font(.title)
                .fontWeight(.semibold)
                .foregroundColor(.primary)
            
            // Email
            Text(userInfo[0].userEmail)
                .font(.subheadline)
                .foregroundColor(.gray)
            
            // Button
            Button(action: {
                HapticManager.instance.impact(style: .heavy)
                authViewModel.signOut(modelContext: context)
            }) {
                Text("Sign Out")
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.accentColor)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .shadow(radius: 5)
            }
            .padding(.horizontal, 20)
        }
        
        .padding()
    }
    }
}
