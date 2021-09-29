//
//  LoginView.swift
//  My-Todo
//
//  Created by Princess  on 03/09/2021.
//

import SwiftUI
import Firebase

struct LoginView: View {
  
    @State var showRegistration: Bool = false
    @State var showTaskListView: Bool = false
    @State var showForgotPassword: Bool = false
    @State var email: String = ""
    @State var password: String = ""
    @State private var showingAlert = false

    
    var body: some View {
        ZStack{
            VStack{
                TopDesign()
                Spacer()
                Text("Welcome Back!")
                    .bold()
                    .font(.title2)
                    .padding(.bottom, 40)
                Image("loginimage")
                    .padding(.bottom, 10)
                InputFields2(username: self.$email, password: self.$password)
                    .padding(.bottom, 50)
               
                
                Button(action: {
                    showForgotPassword.toggle()
                }, label: {
                    Text("Forgot Password?")
                        .bold()
                        .foregroundColor(Color(red: 0.31, green: 0.76, blue: 0.79, opacity: 1.00))
                })
                .sheet(isPresented: $showForgotPassword, content: {
                    ForgotPassword()
                })
              
                Spacer()
               
                NavigationLink(
                    destination: TaskListView(),
                    isActive: $showTaskListView) {
                Button(action: {
                    
                    Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                        if error != nil {
                            showingAlert = true
                        } else {
                            showTaskListView.toggle()
                        } 
                    }
                   
                }) {
                    Text("Sign In")
                        .font(.title2)
                        .foregroundColor(.white)
                        .fontWeight(.heavy)
                        .padding()
                        .frame(width: 240, height: 50)
                        
                        }
                    }
                .alert(isPresented: $showingAlert, content: {
                    Alert(title: Text("Wrong Credentials"), message: Text("Input Email and Password"), dismissButton: .default(Text("OK!")))
                })
                .background(Color(red: 0.31, green: 0.76, blue: 0.79, opacity: 1.00)
                                .blur(radius: 3.0))
                          
                .padding()
                
                Spacer()
                HStack{
                        Text("Don't have an Account?")
                            .bold()
                     
                        NavigationLink(
                            destination: SignUpView(),
                            isActive: $showRegistration) {
                        Button(action: {
                            
                            showRegistration.toggle()
                        })
                          {
                            Text("Sign Up").bold()
                                .foregroundColor(Color(red: 0.31, green: 0.76, blue: 0.79, opacity: 1.00))
                            }
                        
                        }
                    }
            }
        }
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView().previewDevice("iPhone 12")
    }
}
