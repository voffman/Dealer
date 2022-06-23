//
//  TradeInView.swift
//  Dealer
//
//  Created by Владимир Свиридов on 30.03.2022.
//

import SwiftUI

struct TradeInView: View {
    // экран Trade-In
    let feedbackView = FeedbackView(title: "TRADE-IN", description: "Такого еще не было! Hyundai объявляет время выгодных условий! Cтартует выгодная программа «Trade-in» .", image: "trade-in", service: "Предложение TRADE-IN") {
    }
    
    var body: some View {
        feedbackView
    }
}

struct TradeInView_Previews: PreviewProvider {
    static var previews: some View {
        TradeInView()
    }
}
