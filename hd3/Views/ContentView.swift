//
//  ContentView.swift
//  hd3
//
//  Created by Abdulaziz Jamaleddin on 10/12/24.
//

import SwiftUI
import SwiftData
struct ContentView: View {
    @State private var text: String = ""
    @State private var date = Date()
    @State private var selectedDate = Date()
    @EnvironmentObject var authViewModel: AuthenticationViewModel
    @Query  var userInfo: [UserInfoThings]
    @State private var isDatePickerPresented = false
    @State private var isTextPresented = true

    func dateToString(_ date: Date) -> String {
          let formatter = DateFormatter()
          formatter.dateStyle = .medium // You can customize the format as needed
          return formatter.string(from: date)
      }

    @State private var storedTasks: [String] = []
    var body: some View {
        //        let accessToken = authViewModel./*user*/?.accessToken
        if !userInfo.isEmpty{
            GeometryReader{ geoProx in
                NavigationStack{
                    ZStack{
                        Color.darkInDark.ignoresSafeArea(.all)
                        Rectangle()
                            .foregroundColor(.clear)
                            .contentShape(Rectangle())
                            .onTapGesture {
                                dismissKeyboard()
                            }
                        VStack{
                            
                            VStack{
                                HStack
                                {
                                    if isTextPresented{
                                        Text(dateToString(selectedDate))
                                            .bold() // Make text bold
                                            .font(.title) // Set font size
                                            .onTapGesture {
                                                // Show the hidden DatePicker when the text is tapped
                                                HapticManager.instance.impact(style: .light)
                                                isDatePickerPresented.toggle()
                                                isTextPresented = false
                                            }
                                    }
                                               
                                               if isDatePickerPresented {
                                                   DatePicker("", selection: $selectedDate, displayedComponents: .date)
                                                       .datePickerStyle(.compact)
                                                       .labelsHidden()
                                                       .onChange(of: selectedDate) { _ in
                                                          isTextPresented = true
                                                           HapticManager.instance.impact(style: .light)
                                                           isDatePickerPresented = false
                                                       
                                               }
                                           
                                           .padding()
                                       }
                                       
                                Spacer()
                                    NavigationLink{
                                        
                                        chatView()
                                        
                                    } label: {
                                        Image(systemName: "message.circle.fill")
                                            .resizable()
                                            .scaledToFit()
                                        
                                            .frame(width:geoProx.size.width/10,height: geoProx.size.height/10 )
                                        //                                            .scaledToFit()
                                        
                                    }
                                    .padding(.trailing, 10)
                                    
                                    //                        Image(systemName: "calendar")
//                                    Spacer()
                                    
                                    
                                    NavigationLink{
                                        calendarView(authViewModel: authViewModel, geoProx: geoProx )
                                        //                                        chatView()
                                        
                                    } label: {
                                        AsyncImage(url: URL(string: userInfo[0].userImageURL)) { image in
                                            image
                                                .resizable()  // Ensure the image can resize
                                                .scaledToFit() // Fit the image within the given frame
                                                .frame(width: geoProx.size.width / 10, height: geoProx.size.height / 10
                                                )
                                                .clipShape(Circle()) // Clip the image to a circular shape
                                        } placeholder: {
                                            
                                            ProgressView()
                                        }
                                    }
                                    
                                    
                                }
                                Divider().bold().background(Color.accentColor)
//                                HStack{
//                                    Text("Today").bold().font(.title)
//                                    Spacer()
//
//                                }
                                List {
                                    ForEach(storedTasks, id: \.self) { item in
                                        Text(item)
                                    }
                                }
                            }
//                            .padding(.top,50)
                            .padding([.leading,.trailing])
                            
//                            .ignoresSafeArea()
                            
                            Spacer()
                            Spacer()
                            
                            
                            HStack{
                                TextField("Add Task", text: $text)
                                    .padding()
                                    .background(Color(.systemGray6))
                                    .cornerRadius(25)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 25)
                                            .stroke(Color.accentColor, lineWidth: 2)
                                    )
                                Spacer()
                                Button{
                                    HapticManager.instance.impact(style: .light)
                                    storedTasks.append(text)
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
                        
                        
                        
                        
                        
                        
                        
                    }/*.padding().ignoresSafeArea()*/
                }
                
                
            }}
    }
}

#Preview {
    ContentView()
}
extension View {
    func dismissKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
