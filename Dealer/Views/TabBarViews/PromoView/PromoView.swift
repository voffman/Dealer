//
//  PromoView.swift
//  Dealer
//
//  Created by Владимир Свиридов on 29.03.2022.
//

import SwiftUI

struct PromoView: View {
    // список акций
    @ObservedObject private var viewModel = PromoViewViewModel()
    @State var isLoaded = false
    
    @Binding var barTitle: String
    
    var body: some View {
        NavigationView {
            //  ScrollView {
            NoSeparatorList(viewModel.posts.sorted(by: { promo, promo2 in
                promo.date.dateValue() > promo2.date.dateValue()
            }), id: \.id){ (post) in
                NavigationLink { // переход
                    PromoDetailView(model: post)
                } label: {
                    PromoCell(image: post.imageLink,
                              date: post.date.dateValue(),
                              title: post.title)
                }
                
                Divider()
            }.onAppear() { // при появлении идет единичный раз подгрузка данных. Асинхронно, не в главном потоке с приритетом, чтоб е блокироать интерфейс
                if !isLoaded {
                        viewModel.fetchData()
                        isLoaded = true
                }
            }
                .navigationTitle(barTitle)
                .navigationBarTitleDisplayMode(.automatic)
        }
    }
}

struct PromoView_Previews: PreviewProvider {
    static var previews: some View {
        PromoView(barTitle: .constant("Новости и акции"))
    }
}

