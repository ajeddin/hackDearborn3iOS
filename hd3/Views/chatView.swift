//
//  chatView.swift
//  hd3
//
//  Created by Abdulaziz Jamaleddin on 10/12/24.
//

import SwiftUI
import SwiftData
struct chatView:View {
    @Query  var userInfo: [UserInfoThings];
    
    var body: some View {
        VStack {
            ForEach(userInfo) { info in
                
                Text(info.userEmail).font(.title)
            }
        }
    }
    
}
