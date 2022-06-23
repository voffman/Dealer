//
//  ServiceView.swift
//  Dealer
//
//  Created by Владимир Свиридов on 26.03.2022.
//

import SwiftUI
import FirebaseFirestore
import FirebaseAuth
// экран записи на сервис
struct ServiceView: View {
    
    let feedbackView = FeedbackView(title: "Сервис", service: "Запись на сервис") {
        
    }
    
    var body: some View {
        feedbackView
        
    }
}

struct ServiceCentersView_Previews: PreviewProvider {
    static var previews: some View {
        ServiceView()
    }
}
