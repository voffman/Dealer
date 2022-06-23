//
//  TabBar.swift
//  Dealer
//
//  Created by Владимир Свиридов on 26.03.2022.
//

import SwiftUI
// тут понятно
struct TabBar: View {
    
    @Binding var isAuth: Bool
    
    @State var mainViewTitle: String = "Hyundai Premium"
    @State var promoViewTitle: String = "Новости и акции"
    @State var catalogViewTitle: String = "Каталог"
    @State var financeViewTitle: String = "Финансирование"
    @State var profileViewTitle: String = "Профиль"
    
    var body: some View {
        TabView {
            MainView(barTitle: $mainViewTitle)
                .tabItem {
                    Image(systemName: "house")
                    Text("Главная")
                }
            PromoView(barTitle: $promoViewTitle)
                .tabItem {
                    Image(systemName: "giftcard")
                    Text("Акции")
                }
            CatalogView(barTitle: $catalogViewTitle)
                .tabItem {
                    Image(systemName: "car")
                    Text("Модельный ряд")
                }
            FinanceView(barTitle: $financeViewTitle)
                .tabItem {
                    Image(systemName: "list.bullet.rectangle")
                    Text("Финансы")
                }
            
            ProfileView(barTitle: $profileViewTitle, isAuth: $isAuth)
                .tabItem {
                    Image(systemName: "person")
                    Text("Профиль")
                }
        }.navigationTitle(mainViewTitle)
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar(isAuth: .constant(true))
    }
}
