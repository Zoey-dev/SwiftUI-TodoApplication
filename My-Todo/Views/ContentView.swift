//
//  ContentView.swift
//  My-Todo
//
//  Created by Princess  on 03/09/2021.
//

import SwiftUI
import Firebase

struct ContentView: View {
    
    @State var isLinkActive = false
    @State var showLoginView = false
    @State var showTaskListView = false

    
    var body: some View {
        NavigationView {
            
            ZStack {
                Color(red: 1.00, green: 1.00, blue: 1.00, opacity: 1.00)
                    .edgesIgnoringSafeArea(.all)
                
                
            VStack {
                
                TopDesign()
               
                Image("todopic")
                    .padding(.bottom, 60)
                
                Text("Let's Help You Get Organized")
                    .bold()
                    .fontWeight(.heavy)
                    .padding()
                Text("Welcome to your ToDo app that is designed to enable you get more organized and keep track of all your daily and weekly activities")
                    .padding()
                    .frame( alignment: .center)
                    .foregroundColor(.gray)
                Spacer()
                
                
              
                NavigationLink(
                    destination: LoginView(),
                    isActive: $showLoginView
                ) {
                    
                Button(action: {
                    showLoginView.toggle()

                }) {
                    Text("Get Started").font(.title2)
                        .foregroundColor(.white)
                        .fontWeight(.heavy)
                        .frame(width: 240, height: 50)
                    }
                .background(Color(red: 0.31, green: 0.76, blue: 0.79) .blur(radius: 3.0))
               
                    }
                }
            }
            
            
        }.accentColor(.black)
        
        
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 12")
    }
}


struct TopDesign: View {
    var body: some View {
        VStack(alignment: .trailing){
            HStack {
                
                Image("Shape")
                    .resizable()
                    .edgesIgnoringSafeArea(.top)
                    .frame(width: 180, height: 60, alignment: .topTrailing)
                Spacer()
            }
        }
    }
}
