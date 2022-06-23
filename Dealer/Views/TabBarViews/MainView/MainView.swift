//
//  Main.swift
//  Dealer
//
//  Created by Владимир Свиридов on 26.03.2022.
//

import SwiftUI
import FirebaseFirestore
// главный экран
struct MainView: View {
    
    let logoImage: String = "logo"
    private let viewModel = MainViewViewModel()
    @Environment(\.openURL) private var openURL
    
    @Binding var barTitle: String
    @State private var description: String?
    
    var body: some View {
        NavigationView{
            ScrollView {
                VStack(spacing: 10){
                    HStack(){
                        Text("Дилерский центр -")
                            .fontWeight(.regular)
                            .font(.system(size: 20))
                        Text("Караганда")
                            .fontWeight(.thin)
                            .font(.system(size: 20)).padding(.leading, -5)
                        Spacer()
                        
                    }.padding(.leading, 17)
                    
                    Text(description ?? "")
                        .font(.system(size: 16, weight: .light, design: .default))
                        .frame(width: UIScreen.screenWidth - 30)
                        .onAppear{
                            viewModel.fetchData(key: "dealerDescription") { post in
                                description = post.description
                            }
                        }
                    
                    DefaultButton(width: 220, height: 50, text: "Мы на карте") {
                        openURL(viewModel.getCoordinates())
                    }
                    
                    DefaultButton(width: 220, height: 50, text: "Позвонить нам") {
                        openURL(viewModel.call(phoneNumber: "88005553535"))
                    }
                    
                    NavigationLink {
                        TestDriveView()
                    } label: {
                        Text ("Записаться на тест-драйв")
                    }.buttonStyle(DefaultButtonStyle(width: 220, height: 50))
                    
                    NavigationLink {
                        TradeInView()
                    } label: {
                        Text ("TRADE-IN")
                    }.buttonStyle(DefaultButtonStyle(width: 220, height: 50))
                    
                    
                    NavigationLink {
                        ServiceView()
                    } label: {
                        Text ("Записаться на сервис")
                    }.buttonStyle(DefaultButtonStyle(width: 220, height: 50))
                    
                    Image(logoImage)
                        .resizable()
                        .frame(width: UIScreen.screenWidth/2, height: 37, alignment: .center)
                    //                    VStack(spacing: 10){
                    //                    Text("Наши контакты").font(.system(size: 20, weight: .light, design: .default))
                    //                    
                    //                        Text("Hyundai Premium Al-Farabi \n г. Алматы, проспект Аль-Фараби, 107/1, угол улицы Жарокова. \n Телефон: +7 727 333 19 10 \n График работы автосалона: с 9:00 до 20:00 \n Отдел сервиса и запасных частей: с 8:00 до 22:00")
                    //                        .font(.system(size: 16, weight: .light, design: .default)).frame(width: UIScreen.screenWidth - 30)
                    //                    }
                    VStack(spacing: 10){
                        Text("Дополнительная информация").fontWeight(.thin)
                            .font(.system(size: 20)).padding(.leading, -5)
                        Link("Гарантия изготовителя", destination: URL(string: "https://karaganda.hyundai.kz/ru/service/garantiya_izgotovitelya/")!)
                        Link("Переодическое ТО", destination: URL(string: "https://karaganda.hyundai.kz/ru/service/periodicheskoe_tehnicheskoe_obslujivanie/")!)
                        Link("Контрольный осмотр автомобиля", destination: URL(string: "https://karaganda.hyundai.kz/ru/service/kontrolnyiy_osmotr/")!)
                        Link("Правила посещения ДЦ", destination: URL(string: "https://karaganda.hyundai.kz/ru/rules/")!)
                        Link("Политика конфиденциальности", destination: URL(string: "https://karaganda.hyundai.kz/ru/politika_konfidentsialnosti/")!)
                    }
                    
                }.navigationTitle(barTitle)
            }
        }
    }
}

struct Main_Previews: PreviewProvider {
    static var previews: some View {
        MainView(barTitle: .constant("Hyundai Premium"))
    }
}
