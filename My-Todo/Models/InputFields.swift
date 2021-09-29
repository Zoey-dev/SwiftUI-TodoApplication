//
//  InputFields.swift
//  My-Todo
//
//  Created by Princess  on 18/09/2021.
//

import Foundation
import SwiftUI

struct InputFields: View {
    @Binding var fullname: String
    @Binding var email: String
    @Binding var username: String
    @Binding var password: String

   
    
    var body: some View {
        VStack{
            TextField("Enter Fullname", text: $fullname)
                //.autocapitalization(.none)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .shadow(color: .gray, radius: 2, x: 3.0, y: 3.0)
                
            TextField("Enter Email Address", text: $email)
                .autocapitalization(.none)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .shadow(color: .gray, radius: 2, x: 3.0, y: 3.0)
            
            TextField("Enter Username", text: $username)
                .autocapitalization(.none)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .shadow(color: .gray, radius: 2, x: 3.0, y: 3.0)
            
            SecureField("Enter Password", text: $password)
                .autocapitalization(.none)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .shadow(color: .gray, radius: 2, x: 3.0, y: 3.0)
            }
        }
    }


struct InputFields2: View {
  
    @Binding var username: String
    @Binding var password: String
    
    var body: some View {
        VStack{
           
            TextField("Enter Email Address", text: $username)
                .autocapitalization(.none)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .shadow(color: .gray, radius: 2, x: 3.0, y: 3.0)
           
            SecureField("Enter Password", text: $password)
                .autocapitalization(.none)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .shadow(color: .gray, radius: 2, x: 3.0, y: 3.0)
            }
        }
}

