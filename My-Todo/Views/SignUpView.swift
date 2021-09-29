//
//  WelcomeView.swift
//  My-Todo
//
//  Created by Princess  on 03/09/2021.
//

import SwiftUI
import Firebase

struct SignUpView: View {
    
    @State var showLoginView: Bool = false
    @State var showTaskListView: Bool = false
    @State private var showingAlert = false
    @State var email: String = ""
    @State var password: String = ""
    @State var fullname: String = ""
    @State var username: String = ""
    
    var body: some View {
        
        ZStack{

            VStack{
                TopDesign()
            Spacer()
                Text("Welcome Onboard!")
                    .bold()
                    .padding()
                Text("Let's help you meet your task")
                Spacer()
                InputFields(fullname: self.$fullname, email: self.$email, username: self.$username, password: self.$password)
                Spacer()
                
                NavigationLink(
                    destination: TaskListView(),
                    isActive: $showTaskListView) {
                Button(action: {
                   
                    Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                        if error != nil {
                            showingAlert = true
                        } else {
                            showTaskListView.toggle()
                        }
                    }
                    
                }) {
                    Text("Register")
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
                .background(Color(red: 0.31, green: 0.76, blue: 0.79, opacity: 1.00) .blur(radius: 3.0))
                
                
                Spacer()
                
                HStack{
                    Text("Already have an Account?")
                        .bold()
                    
                    NavigationLink(
                        destination: LoginView(),
                        isActive: $showLoginView) {
                        Button(action: {
                            showLoginView.toggle()
                        }) {
                            Text("Sign In").bold()
                                .foregroundColor(Color(red: 0.31, green: 0.76, blue: 0.79))
                                
                            }
                        }
                }
            }
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView().previewDevice("iPhone 12")
    }
}



