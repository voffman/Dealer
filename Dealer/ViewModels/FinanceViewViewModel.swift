//
//  FinanceViewViewModel.swift
//  Dealer
//
//  Created by Владимир Свиридов on 24.06.2022.
//

import Foundation
import FirebaseFirestore

class FinanceViewViewModel: ObservableObject {
    
    @Published var posts: [Info] = []
    private var db = Firestore.firestore() // ссылка на базу данных
    
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
                 print("Document не существует")
             }
         }
     }
    
}
