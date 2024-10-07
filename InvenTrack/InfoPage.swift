//
//  InfoPage.swift
//  InvenTrack
//
//  Created by Reef Saeed on 06/10/2024.
//

import SwiftUI

struct InfoPage: View {
   
    var body: some View {
        NavigationView{ //Allows users to navigate between views
            VStack(alignment:.leading, spacing: 70){ //VStack1
                ZStack{
                    Color.gray.opacity(0.15)
                        .cornerRadius(30)
                        .ignoresSafeArea()
                    
                    
                        
                        
                      
        
                        VStack{
                            // Placeholder for image selection (the plus button)
                            Button(action: {
                                // Image picker action
                            }) {
                                Image("Image3")
                                    .resizable()
                                    .frame(width: 250, height: 250)
                                    .foregroundColor(.gray)
                                    .padding()
                            }
                            
                        }
                        
                   
                    
                    
                }//ZStack
                
                
                VStack(alignment: .leading, spacing: 20) { //VStack
                    
                    
                    HStack{
                        
                        VStack(alignment: .leading){ //VStack inside HStack
                            Text("Info")
                                .font(.headline)
                                .padding(.bottom, 10)
                            //.padding(.horizontal)
                            
                            HStack{
                                
                                Text("Category")
                                    .foregroundColor(.gray)
                                Spacer()
                                Text("Laptops")
                            }
                            
                            Divider()
                            
                            HStack{
                                Text("Quantitie")
                                    .foregroundColor(.gray)
                                Spacer()
                                Text("20")
                            }
                            
                            Divider()
                            
                            HStack{
                                Text("Minimum quantitie")
                                    .foregroundColor(.gray)
                                Spacer()
                                Text("4")
                            }
                            
                            Divider()
                            
                            //                            HStack{
                            //                                Text("Date")
                            //                                    .foregroundColor(.gray)
                            //                                Spacer()
                            //                                Text("1-10-2024")
                            //                            }
                            
                        }
                        Spacer()
                        
                    }// end HStac3
                    .padding(.horizontal)
                } // End Vstack
                
                
                
                .padding([.leading,.trailing], 20)
                Spacer()
                
                
                
            }
            
            .navigationTitle("MACKBOOK Air 15")
            .toolbar{
                ToolbarItemGroup(placement: .topBarTrailing){
                    Button("Edit"){
                        //edit action
                    }
                }
                ToolbarItemGroup(placement: .bottomBar){
                        Button("Delete"){
                            
                            //edit action
                        }
                    
                        .foregroundColor(.red)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(.bottom, 40)
                        .padding()
                        
                    }
                
            }
            .padding(.bottom)
        }
    }
}



    

#Preview {
    InfoPage()
}
