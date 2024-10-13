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
    @State  var text: String = ""
    var body: some View {
        if !userInfo.isEmpty{
            ZStack{
                Color.darkInDark.ignoresSafeArea()
                Rectangle()
                    .foregroundColor(.clear)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        dismissKeyboard()
                    }
                VStack {
                    Spacer()
                    HStack{
                        TextField("Message", text: $text)
                            .padding()
                            .background(Color(.systemGray6))
                            .cornerRadius(25)
                            .overlay(
                                RoundedRectangle(cornerRadius: 25)
                                    .stroke(Color.accentColor, lineWidth: 2)
                            )
                        Spacer()
                        Button{
                            
                            
                            
                        }label:{
                            Image(systemName: "arrow.up")
                                .padding()
                                .background(Color(.systemGray6))
                                .cornerRadius(25)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 25)
                                        .stroke(Color.accentColor, lineWidth: 2)
                                )
                        }
                    }
                    .padding()
                }
                
            }
            
            
        }
        
    }
    
    
}
