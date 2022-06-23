//
//  UserActions.swift
//  Dealer
//
//  Created by Владимир Свиридов on 03.04.2022.
//

import Foundation
import FirebaseFirestore

struct UserActions { // для записи и отображения информации о запросах пользователя
    let id = UUID()
    let uid: String
    let email: String
    let service: String
    let date: Timestamp
    
}
