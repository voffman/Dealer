//
//  CatalogViewViewModel.swift
//  Dealer
//
//  Created by Владимир Свиридов on 02.04.2022.
//

import Foundation
import FirebaseFirestore

class CatalogViewViewModel: ObservableObject {
    
    @Published var posts: [CarInfo] = []
    private var db = Firestore.firestore() // ссылка на базу данных
    

    func fetchData(carType: String) {
        db.collection("Cars").whereField("type", isEqualTo: carType).addSnapshotListener { querySnapshot, error in // выбор коллекции
            guard let documents = querySnapshot?.documents else { // проверка если нет документов
                print("No documents")
                return
            }
            self.posts = documents.map{ (queryDocumentSnapshot) -> CarInfo in // парсинг и возврат виде структуры
                let data = queryDocumentSnapshot.data()
                
                let model = data["model"] as? String ?? ""
                let price = data["price"] as? Int ?? 0
                let tagline = data["tagline"] as? String ?? ""
                let imageLink = data["imageLink"] as? String ?? ""
                let bookletLink = data["bookletLink"] as? String ?? ""
                let priceLink = data["priceLink"] as? String ?? ""
                let manualLink = data["manualLink"] as? String ?? ""
                let type = data["type"] as? String ?? ""
                
                return CarInfo(model: model, price: price, tagline: tagline, imageLink: imageLink, bookletLink: bookletLink, priceLink: priceLink, manualLink: manualLink, type: type)
            }
        }
    }
}
