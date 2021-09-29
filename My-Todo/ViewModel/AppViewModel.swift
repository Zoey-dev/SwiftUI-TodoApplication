////
////  AppViewModel.swift
////  My-Todo
////
////  Created by Princess  on 18/09/2021.
////
//
//import Foundation
//import FirebaseAuth
//
//
//class AppViewModel: ObservableObject {
//
//    let auth = Auth.auth()
//
//
//    var isSignedIn: Bool {
//        return auth.currentUser != nil
//    }
//
//    func signIn(email: String, password: String) {
//        auth.signIn(withEmail: email, password: password) {  authResult, error in
//            //guard that authresult is not nil and error is nil then we know we are successfully signed in
//            guard authResult != nil, error == nil else {
//                return
//            }
//            
//
//        }
//    }
//
//
//    func signUp(fullname: String, username: String, email: String, password: String) {
//        auth.createUser(withEmail: email, password: password) { authResult, error in
//            guard authResult != nil, error == nil else {
//                return
//            }
//
//
//        }
//    }
//
//
//    func signOut() {
//        try? auth.signOut()
//
//
//    }
//
//
//
//}
