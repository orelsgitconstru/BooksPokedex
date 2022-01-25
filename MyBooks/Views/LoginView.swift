//
//  LoginView.swift
//  MyBooks
//
//  Created by Orel Zilberman on 24/01/2022.
//

import SwiftUI

struct LoginView: View {
    @State private var username = ""
    @State private var password = ""
    private let loginViewModel = LoginViewModel()
    
    var body: some View {
        ZStack{
            Color.ui.brandBlue
            VStack{
                Image("Logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300, height: 300)
                Input(
                    text: $username,
                    title: "email",
                    placeholderText: "email",
                    leftIcon:Image(systemName: "envelope.fill")
                )
                SecureInput(
                    text: $password,
                    title: "password",
                    placeholderText: "password",
                    leftIcon:Image(systemName: "lock.fill")
                )
                Button(action: {loginWithGoogle()})
                {
                    Image("GoogleLogin")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 60 , height: 60)
                }.buttonStyle(PlainButtonStyle())
                    .padding(20)
                    .font(.system(size: 28, design: .default))
                
                Button("Login", action: login)
                    .buttonStyle(PlainButtonStyle())
                    .padding(20)
                    .font(.system(size: 28, design: .default))
                
                Button("Register", action: register)
                    .buttonStyle(PlainButtonStyle())
                    .padding(20)
                    .font(.system(size: 28, design: .default))
            }
        }.ignoresSafeArea()
    }
    
    func login(){
        loginViewModel.login(username: username, password: password)
            .subscribe(onNext: { result in
                print(result)
            }, onError: { result in
                print(result)
            }, onCompleted: {
                print("onCompleted")
            }, onDisposed: {
                print("onDisposed")
            })
    }
    
    func register(){
        loginViewModel.register(username: username, password: password)
    }
    
    func loginWithGoogle(){
        loginViewModel.login(username: username, password: password)
    }
    
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
