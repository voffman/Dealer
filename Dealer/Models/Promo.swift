//
//  Promo.swift
//  Dealer
//
//  Created by Владимир Свиридов on 02.04.2022.
//

import Foundation
import FirebaseFirestore

struct Promo { // для получения и отображения информации об акциях
    let id = UUID()
    let title: String
    let description: String
    let date: Timestamp // тип данных в Firebase, после получения преобразуется в читаемые данные методом .dateValue()
    let imageLink: String
    
}
