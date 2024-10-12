//
//  splashScreen.swift
//  hd3
//
//  Created by Abdulaziz Jamaleddin on 10/12/24.
//


import SwiftUI

struct splashScreen: View {
    @Binding var isActive: Bool
    
    var body: some View {
       
        ZStack{
            Color("mainColor").ignoresSafeArea()

            VStack{
                Image("logoWOBack").resizable().scaledToFit()
                    .frame(maxWidth: 250, maxHeight: 250)
                HStack(content: {
                    VStack{
                        Text("Seamless Scheduling")
                        Text("Powered by AI.")
                    }.bold()
                        .padding(.top,10)
                        .foregroundColor(.black)
                })
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                withAnimation {
                    self.isActive = true
                }
            }
        }

    }
}
