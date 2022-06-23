//
//  CreditViewViewModel.swift
//  Dealer
//
//  Created by Владимир Свиридов on 24.06.2022.
//

import Foundation
import FirebaseFirestore

class CreditViewViewModel: ObservableObject {
    
    @Published var posts: [Finance] = []
    private var db = Firestore.firestore() // ссылка на базу данных
    
    func fetchData(key: String, completion: @escaping (Finance)->()){
         let docRef = db.collection("Finance").document(key)
         docRef.getDocument { (document, error) in
             if let document = document, document.exists {
                 let docData = document.data()
                 
                 guard let docData = docData else {
                     return
                 }
                 let title = docData["title"] as? String ?? ""
                 let description = docData["description"] as? String ?? ""
                 let link = docData["link"] as? String ?? ""
                 
                 completion(Finance(title: title, description: description, link: link))

             } else {
                 print("Document не существует")
             }
         }
     }
    
}
