//
//  LoginViewViewModel.swift
//  Dealer
//
//  Created by Владимир Свиридов on 10.04.2022.
//

import Foundation
import Firebase
import FirebaseAuth

class LoginViewViewModel: ObservableObject {
    
    let api = Api() // ссылка на класс с методами
    // регистрируем пользователя
    
    // вход пользователя
    func signIn(email: String, password: String, completion: @escaping (Bool, String)->()) {
        api.signInWithEmail(email: email, password: password) { result, message in
            print("result: \(result)")
            print("message: \(message)")
            completion(result, message) // возвращаем через completion Handler данные с результатом и ошибкой при запросе
        }
    }
    
    // сброс пароля
    func forgotPassword(email: String) {
        api.forgotPassword(email: email) { error in
            guard let error = error else {
                return
            }
            print(error.localizedDescription)
        }
    }
}
