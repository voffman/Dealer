//
//  RegisterViewViewModel.swift
//  Dealer
//
//  Created by Владимир Свиридов on 10.04.2022.
//

import Foundation
import FirebaseAuth


class RegisterViewViewModel: ObservableObject {
    
    let api = Api() // ссылка на класс с методами
    // регистрируем пользователя
    func signUp(email: String, password: String, completion: @escaping (Bool, String)->()) {
        api.signUpWithEmail(email: email, password: password) { result, message in
            print("result: \(result)")
            print("error: \(message)")
            completion(result, message) // возвращаем через completion Handler данные с результатом и ошибкой при запросе
        }
    }
}
