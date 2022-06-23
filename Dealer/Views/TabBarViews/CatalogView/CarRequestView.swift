//
//  CarRequestView.swift
//  Dealer
//
//  Created by Владимир Свиридов on 17.04.2022.
//

import SwiftUI

struct CarRequestView: View {
    // экран оставить запрос на автомобиль
    let feedbackView = FeedbackView(title: "Запрос на покупку автомобиля", service: "Запрос на покупку автомобиля") {
    }
    
    var body: some View {
        feedbackView
    }
}

struct CarRequestView_Previews: PreviewProvider {
    static var previews: some View {
        CarRequestView()
    }
}
