//
//  LoginView.swift
//  Dealer
//
//  Created by Владимир Свиридов on 02.04.2022.
//

import SwiftUI
// экран входа в приложение
struct LoginView: View {
    
    @ObservedObject private var viewModel = LoginViewViewModel()
    
    @State var email: String = ""
    @State var password: String = ""
    @Binding var isLogin: Bool
    
    @State private var presentAlert = false
    @State private var presentForgotAlert = false
    @State var alertText: String = ""
    
    var body: some View {
        NavigationView {
            VStack(){
                Text("Вход")
                    .fontWeight(.thin)
                    .font(.system(size: 36))
                    .padding()
                
                VStack(spacing: -15){
                    HStack(){
                        Text("Введите E-mail")
                            .font(.system(size: 12, weight: .light, design: .default))
                            .padding(.leading, 25)
                        Text("*")
                            .font(.system(size: 12, weight: .light, design: .default))
                            .padding(.leading, -5).foregroundColor(.blue)
                        Spacer()
                    }
                    
                    TextField("Ваш email", text: $email)
                        .textFieldStyle(.roundedBorder).padding()
                }
                
                VStack(spacing: -15){
                    HStack(){
                        Text("Введите пароль")
                            .font(.system(size: 12, weight: .light, design: .default))
                            .padding(.leading, 25)
                        Text("*")
                            .font(.system(size: 12, weight: .light, design: .default))
                            .padding(.leading, -5).foregroundColor(.blue)
                        Spacer()
                    }
                    
                    SecureField("Ваш пароль", text: $password)
                        .textFieldStyle(.roundedBorder)
                        .padding()
                }
                
                DefaultButton(width: 220, height: 50, text: "Войти") {
                    viewModel.signIn(email: email, password: password) { result, message  in
                        
                        UserDefaults.standard.set(result, forKey: "auth")
                        isLogin = result
                        if !result {
                            alertText = message
                            presentAlert = true
                        }
                    }
                }.alert(isPresented: $presentAlert, content: {
                    Alert( // 1
                        
                        title: Text("Внимание"),
                        message: Text("\(alertText)"),
                        dismissButton: .default(Text("ОК"))
                    )
                })
                
                NavigationLink {
                    RegisterView()
                } label: {
                    Text ("Регистрация")
                }.padding()
                
                Button("Забыли пароль?") {
                    presentForgotAlert = true
                    viewModel.forgotPassword(email: email)
                }.alert(isPresented: $presentForgotAlert, content: {
                    Alert( // 1
                        title: Text("Проверьте ваш e-mail"),
                        message: Text("На ваш адрес электронной почты отправлено письмо с инструкциями для сброса пароля."),
                        dismissButton: .default(Text("ОК"))
                    )
                })
                
            }.frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight).padding(.bottom, 150)//.background(Color("ButtonBlue"))
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(isLogin: .constant(false))
    }
}
