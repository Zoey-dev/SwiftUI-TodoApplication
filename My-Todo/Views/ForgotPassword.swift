//
//  ForgotPassword.swift
//  My-Todo
//
//  Created by Princess  on 14/09/2021.
//

import SwiftUI
import Firebase
//import FirebaseAuth


struct ForgotPassword: View {
    @State var email: String = ""
    @State var sendCode: Bool = false
    @State private var showingAlert = false
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
       
                NavigationView{
                    
                    VStack() {
                        
                        VStack() {
                           
                            Image("forgotpassword")
                                .padding(.bottom, 50)
                            
                            TextField("Enter Your Email Address", text: $email)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding()
                                .shadow(color: .gray, radius: 2, x: 3.0, y: 3.0)
                                .padding(.bottom, 20)
        
         
                         Text("We will send you a message to set or reset your new password")
                           
                            HStack {
                                Text("Send Code")
                                    .font(.title)
                                    .fontWeight(.heavy)
                                Spacer()
                                Button(action: {
                                    Auth.auth().sendPasswordReset(withEmail: email) { error in
                                        if error != nil {
                                            showingAlert = true
                                        } else {
                                            print("hey")
                                            self.sendCode.toggle()
                                        }
                                    }
                                        
                                    
                                }) {
                                    Image(systemName: "arrowshape.turn.up.forward.circle.fill")
                                        .resizable()
                                        .frame(width: 50, height: 50)
                                        .foregroundColor(Color(red: 0.31, green: 0.76, blue: 0.79))
                                        
                                }
                            }
                            .alert(isPresented: $showingAlert, content: {
                                Alert(title: Text("Wrong Input"), message: Text("Input correct Email"), dismissButton: .default(Text("OK!")))
                            })
                            .padding()
                    
                            Spacer()
                        
                        }
                        .padding(.top, 60)
                    }
                    .padding(.horizontal, 15)
                    .navigationTitle("Forgot Password")
                    .toolbar {
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }, label: {
                            Image(systemName: "arrowshape.turn.up.left.2.fill")
                                .foregroundColor(Color(red: 0.31, green: 0.76, blue: 0.79))
                        })
                    }
                   
                
               
                   
           }
        }

}

struct ForgotPassword_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPassword()
    }
}
