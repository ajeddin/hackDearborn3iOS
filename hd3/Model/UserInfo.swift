//
//  UserInfo.swift
//  hd3
//
//  Created by Abdulaziz Jamaleddin on 10/12/24.
//

import Foundation
import SwiftData
import GoogleSignIn
import GoogleSignInSwift

@Model
class UserInfoThings: Identifiable {
    var id = UUID().uuidString

    var isLoggedIn: Bool = false
    var userEmail: String = ""
    var userAccessToken: String = ""
    var userName: String = ""

    init(isLoggedIn: Bool, userEmail: String, userAccessToken: String,userName: String) {
        self.isLoggedIn = isLoggedIn
        self.userEmail = userEmail
        self.userAccessToken = userAccessToken
        self.userName = userName
    }
    
    convenience init(isLoggedIn: Bool, user: GIDGoogleUser) {
        self.init(isLoggedIn: isLoggedIn, userEmail: user.profile?.email ?? "", userAccessToken: user.accessToken.tokenString, userName: user.profile?.name ?? "")
    }
}
