//
//  ClientRequest.swift
//  Dealer
//
//  Created by Владимир Свиридов on 16.04.2022.
//

import Foundation
import FirebaseFirestore

struct ClientRequest { // для обратной связи
    let id: String
    let fullName: String
    let phone: String
    let email: String
    let car: Int
    let message: String
    let date: Timestamp
    let service: String
    
}
