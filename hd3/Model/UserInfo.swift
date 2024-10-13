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
    var userImageURL: String = ""
    var userID: String = ""

    init(id: String = UUID().uuidString, isLoggedIn: Bool, userEmail: String, userAccessToken: String, userName: String, userImageURL: String, userID: String) {
        self.id = id
        self.isLoggedIn = isLoggedIn
        self.userEmail = userEmail
        self.userAccessToken = userAccessToken
        self.userName = userName
        self.userImageURL = userImageURL
        self.userID = userID
    }
    convenience init(isLoggedIn: Bool, user: GIDGoogleUser) {
        self.init(isLoggedIn: isLoggedIn, userEmail: user.profile?.email ?? "", userAccessToken: user.accessToken.tokenString, userName: user.profile?.name ?? "",userImageURL: user.profile?.imageURL(withDimension: 100)?.absoluteString ?? "", userID: user.userID!)
    }
}
