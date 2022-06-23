//
//  PromoViewViewModel.swift
//  Dealer
//
//  Created by Владимир Свиридов on 02.04.2022.
//

import Foundation
import FirebaseFirestore

class PromoViewViewModel: ObservableObject {
    
    @Published var posts: [Promo] = [] // структура акций
    private var db = Firestore.firestore() // ссылка на базу данных

    // получение данных
    func fetchData() {
        db.collection("Promo").addSnapshotListener { querySnapshot, error in // коллекция 
            guard let documents = querySnapshot?.documents else { // проверка если нет документов
                print("No documents")
                return
            }
            self.posts = documents.map{ (queryDocumentSnapshot) -> Promo in // парсинг и возврат виде структуры
                let data = queryDocumentSnapshot.data()
                let title = data["title"] as? String ?? ""
                let description = data["description"] as? String ?? ""
                let date = data["date"] as? Timestamp
                let imageLink = data["imageLink"] as? String ?? ""
                
                return Promo(title: title, description: description, date: date ?? Timestamp(), imageLink: imageLink)
            }
        }
    }
    
}
