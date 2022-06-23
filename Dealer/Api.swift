//
//  Api.swift
//  Dealer
//
//  Created by Владимир Свиридов on 10.04.2022.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

// здесь прописаны методы FirebaseAuth для входа или регистрации
class Api {
    
    private var db = Firestore.firestore() // ссылка на базу данных
    
    // вход
    func signInWithEmail(email: String,password : String, completion: @escaping (Bool,String)->Void){
        
        Auth.auth().signIn(withEmail: email, password: password) { (res, err) in
            
            if err != nil{
                // передается код ошибки (completion handler)
                completion(false,(err?.localizedDescription)!)
                return
            }
            // передаю пользовательский email
            completion(true,(res?.user.email)!)
        }
    }
    // зарегистрировать пользователя
    func signUpWithEmail(email: String,password : String, completion: @escaping (Bool,String)->Void){
        
        Auth.auth().createUser(withEmail: email, password: password) { (res, err) in
            
            if err != nil{
                
                completion(false,(err?.localizedDescription)!)
                return
            }
            
            completion(true,(res?.user.email)!)
        }
    }
    // отправляю письмо на почту для сброса пароля
    func forgotPassword(email: String,  completion: @escaping (Error?)->Void) {
        Auth.auth().sendPasswordReset(withEmail: email) { error in
          completion(error)
        }
    }
    // удаляю пользователя
    func removeCurrentUser() {
        let user = Auth.auth().currentUser // пользовательский id
        
        user?.delete { error in
            if let error = error {
                print("Ошибка удаления аккаунта: \(error.localizedDescription)")
            } else {
                print("Акккаунт удален.")
            }
        }
    }
}
