//
//  ContentView.swift
//  hd3
//
//  Created by Abdulaziz Jamaleddin on 10/12/24.
//

import SwiftUI

struct ContentView: View {
    @State private var text: String = ""
    @State private var date = Date()
    var body: some View {
        GeometryReader{ geoProx in
            NavigationStack{
                VStack{
                    VStack{
                        HStack
                        {
                            NavigationLink{
                                calendarView()
                            } label: {
                                Image(systemName: "calendar")
//                                    .resizable()
                                    .scaledToFit()
//                                    .frame(width:geoProx.size.width/20,height: geoProx.size.height/20 )
                                
                            }
                            
                            //                        Image(systemName: "calendar")
                            Spacer()
                            NavigationLink{
                                chatView()
                            } label: {
                                Image(systemName: "person.fill")
//                                    .resizable()h
                                    .frame(width:geoProx.size.width/16,height: geoProx.size.height/20 )
                                
                            }
                            .scaledToFit()

                            
                        }
                        Divider().bold().frame(height: 10)
                        HStack{
                            Text("Today").bold().font(.title)
                            Spacer()
                            
                        }
                    }.padding(.top,50)                    .padding([.bottom,.leading,.trailing]).ignoresSafeArea()
                    Spacer()
                    HStack{
                        TextField("Search", text: $text)
                            .padding()
                            .background(Color(.systemGray6))
                            .cornerRadius(25)
                            .overlay(
                                RoundedRectangle(cornerRadius: 25)
                                    .stroke(Color.gray, lineWidth: 1)
                            )
                        Spacer()
                        Button{}label:{
                            Image(systemName: "arrow.right")
                            
                        }
                    }.padding()
                    
                    
                    
                    
                    
                    
                    
                    
                }/*.padding().ignoresSafeArea()*/
            }

            
        }
    }
}

#Preview {
    ContentView()
}
