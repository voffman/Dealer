//
//  PromoDetailView.swift
//  Dealer
//
//  Created by Владимир Свиридов on 03.04.2022.
//

import SwiftUI
import FirebaseFirestore

// детальный вид при переходе по акции
struct PromoDetailView: View {
    
    let model: Promo
    
    var body: some View {
        InfoView(title: model.title,
                 description: model.description,
                 image: model.imageLink)
    }
}

struct PromoDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PromoDetailView(model: Promo(title: "Новость или акция",
                                     description: "Вот это новость! Воот такие скидки?",
                                     date: Timestamp(),
                                     imageLink: "logo-1"))
    }
}
