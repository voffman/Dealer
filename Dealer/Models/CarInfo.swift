//
//  CarShortInfo.swift
//  Dealer
//
//  Created by Владимир Свиридов on 27.03.2022.
//

import Foundation

struct CarInfo { // для получения и отображения информации об автомобилях
    
    let id = UUID()
    let model: String
    let price: Int
    let tagline: String
    let imageLink: String
    let bookletLink: String
    let priceLink: String
    let manualLink: String
    let type: String
}
