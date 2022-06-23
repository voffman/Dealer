//
//  ProfileViewViewModel.swift
//  Dealer
//
//  Created by Владимир Свиридов on 03.04.2022.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class ProfileViewViewModel: ObservableObject {
    
    let api = Api()
    
    @Published var posts: [UserActions] = [] // данные о действии пользователя
    private var db = Firestore.firestore()
    // удаление пользователя
    func removeCurrentUser() {
        api.removeCurrentUser()
        
    }
    // возвращает строку с email -ом в дальнешем отображается на экране профиля
    func getEmailString() -> String {
      return Auth.auth().currentUser?.email ?? "Неизвестно"
    }
    
    // получаем данные
    func fetchData(){
        db.collection("UserActions") // коллекция
            .whereField("uid", isEqualTo: Auth.auth().currentUser?.uid ?? "") // для конкретного пользователя по id пользователя
            .addSnapshotListener { querySnapshot, error in
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }
            self.posts = documents.map{ (queryDocumentSnapshot) -> UserActions in
                let data = queryDocumentSnapshot.data()
                // парсинг
                let uid = data["uid"] as? String ?? ""
                let email = data["email"] as? String ?? ""
                let service = data["service"] as? String ?? ""
                let date = data["date"] as? Timestamp

                
                return UserActions(uid: uid, email: email, service: service, date: date ?? Timestamp()) // возврат структуры
            }
        }
    }
    
}
