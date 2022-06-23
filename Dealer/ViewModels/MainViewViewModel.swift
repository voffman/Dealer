//
//  MainViewViewModel.swift
//  Dealer
//
//  Created by Владимир Свиридов on 26.03.2022.
//

import Foundation
import FirebaseFirestore

class MainViewViewModel {
    
    let coordinates = Coordinates(latitude: 49.817015640604865, longitude: 73.13932344985744) // координаты Hyundai Premium Karaganda
    
    @Published var posts: [Info] = []
    private var db = Firestore.firestore() // ссылка на базу данных
    
    func getCoordinates() -> URL{ // получение DeepLink на навигатор apple
        let urlString = "http://maps.apple.com/maps?daddr=\(coordinates.latitude),\(coordinates.longitude)"
        let url = URL(string: urlString)
        
        return url!
    }
    
    func call(phoneNumber: String) -> URL { // DeepLink на приложение набора телефона
        let urlString = "tel://" + phoneNumber
        let url = URL(string: urlString)
        
        return url!
    }
    
   func fetchData(key: String, completion: @escaping (Info)->()){
        let docRef = db.collection("Info").document(key)
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let docData = document.data()
                
                guard let docData = docData else {
                    return
                }
                
                let description = docData["description"] as? String ?? ""
                
                completion(Info(description: description))

            } else {
                print("Document does not exist")
            }
        }
    }
}
