//
//  FeedbackViewViewModel.swift
//  Dealer
//
//  Created by Владимир Свиридов on 17.04.2022.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

class FeedbackViewViewModel: ObservableObject { // используется в экрнах (формах) для отправки пользовательского запроса (например запись на тест-драйв)
    // получаю значения пользователя
    let userID = Auth.auth().currentUser?.uid ?? "Неизвестно"
    let userEmail = Auth.auth().currentUser?.email ?? "Неизвестно"
    
    // создаю словарь ключ-значение (как в Firebase) для отправки на сервер со своими значениями
    private func createDocData(model: ClientRequest) -> [String: Any] {
        
        let email = { () -> String in
            if model.email == "" {
                return self.userEmail
            } else {
                return model.email
            }
        }
        // расшифровываю по выбранному индеку Picker -а
        let models: [String] = ["Выберите модель","Accent","Elantra", "Santa Fe", "Tucson", "Palisade","Creta","Staria","Sonata"]
        
        let carDecoder = { () -> String in
            switch model.car {
            case 0:
                return models[0]
            case 1:
                return models[1]
            case 2:
                return models[2]
            case 3:
                return models[3]
            case 4:
                return models[4]
            case 5:
                return models[5]
            case 6:
                return models[6]
            case 7:
                return models[7]
            case 8:
                return models[8]
                
            default:
                return "Не выбран"
            }
        }
        // подставляю свои значения
    let docData: [String: Any] = [
        "car": carDecoder(),
        "date": model.date,
        "email": email(),
        "fullname": model.fullName,
        "id": userID,
        "message": model.message,
        "phone": model.phone,
        "service": model.service,
    ]
        return docData // возвращаю ключ-значение
    }
    // создаю словарь для
    func createUserActionsDocData(service: String) -> [String: Any] {
        
        let docData: [String: Any] = [
            "uid": userID,
            "email": userEmail,
            "service": service,
            "date": Timestamp(),

        ]
            return docData
    }
    // отправляю данные запроса
    func createClientRequest(model: ClientRequest) {
        let db = Firestore.firestore()
        
        let docRef = db.collection("ClientRequests").document("\(Timestamp().dateValue()) \(userEmail)")
        
        docRef.setData(createDocData(model: model)) { error in
            if let error = error {
                print("Error writing document: \(error)")
            } else {
                print("Document successfully written!")
                self.createUserAction(service: model.service) // попутно отправляю данные о действии пользователя, которое будет отображено в экране профиля (и в Firebase)
            }
        }
    }
    // данные о действии пользователя
    func createUserAction(service: String) {
        let db = Firestore.firestore()
        
        let docRef = db.collection("UserActions").document("\(Timestamp().dateValue()) \(userEmail)")
        
        docRef.setData(createUserActionsDocData(service: service)) { error in
            if let error = error {
                print("Error writing document: \(error)")
            } else {
                print("Document successfully written!")
            }
        }
    }
    
}
