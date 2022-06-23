//
//  RegisterView.swift
//  Dealer
//
//  Created by Владимир Свиридов on 02.04.2022.
//

import SwiftUI
// экран для регистрации
struct RegisterView: View {
    
    @ObservedObject private var viewModel = RegisterViewViewModel()
    @State private var presentAlert = false
    @State var email: String = ""
    @State var password: String = ""
    @State var alertText: String = ""
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var backButton : some View { Button(action: {
        self.presentationMode.wrappedValue.dismiss()
        }) {
            HStack {
            Image(systemName: "chevron.left")
                .font(Font.system(size: 17, weight: .semibold))
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.blue)
                Text("Назад")
            }
        }
    }
    
    var body: some View {
        NavigationView {
            VStack(){
                Text("Регистрация").fontWeight(.thin)
                    .font(.system(size: 36)).padding()
                
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
                    
                    TextField("Ваш пароль", text: $password)
                        .textFieldStyle(.roundedBorder)
                        .padding()
                }
                
                DefaultButton(width: 220, height: 50, text: "Зарегистрироваться") {
                    viewModel.signUp(email: email, password: password) { result, message  in
                        presentAlert = true
                        if result {
                            alertText = "Новый пользователь зарегистрирован. Для продолжения перейдите на экран меню входа и введите свои данные."
                        } else {
                            alertText = "Не удалось зарегистрироваться: \(message)"
                        }
                    }
                }.alert(isPresented: $presentAlert, content: {
                    Alert( // 1
                        
                        title: Text("Внимание"),
                        message: Text("\(alertText)"),
                        dismissButton: .default(Text("ОК"))
                    )
                })
                
            }.frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight)
                .padding(.bottom, 150)//.background(Color("ButtonBlue"))
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: backButton)
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
