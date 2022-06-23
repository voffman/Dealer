//
//  CarDetailView.swift
//  Dealer
//
//  Created by Владимир Свиридов on 08.04.2022.
//

import SwiftUI
// подробный вид для автомобиля, происходит переход на него из списка CataloView
struct CarDetailView: View {
    
    let model: CarInfo
    
    var body: some View {
        ScrollView {
            VStack(){
                AsyncImage(url: URL(string: model.imageLink)!,
                           placeholder: { Text("Загрузка ...") },
                           image: { Image(uiImage: $0).resizable() })
                    .scaledToFit()
                    .cornerRadius(5)
                    .padding()
                
                Text("Hyundai")
                    .fontWeight(.regular)
                    .font(.system(size: 24))
                Text(model.model)
                    .fontWeight(.thin)
                    .font(.system(size: 36))
                    .padding(.bottom)
                Text(model.tagline)
                    .fontWeight(.thin)
                    .font(.system(size: 24))
                    .padding(.bottom)
                    .padding(.leading, 5)
                    .padding(.trailing, 5)
                Text("от \(model.price.formattedWithSeparator) ₸")
                    .font(.system(size: 16, weight: .light, design: .default))
                    .frame(width: UIScreen.screenWidth, alignment: .top)
                
                let bookletURL: URL = URL(string: model.bookletLink)!
                let priceURL: URL = URL(string: model.priceLink)!
                let manualURL: URL = URL(string: model.manualLink)!
                
                
                Link("Cмотреть брошюру", destination: bookletURL)
                    .buttonStyle(DefaultButtonStyle(width: 220, height: 50))
                    .padding(.top, 15)
                
                Link("Прайс-лист", destination: priceURL)
                    .buttonStyle(DefaultButtonStyle(width: 220, height: 50))
                    .padding(.top, 5)
                
                Link("Руководство по эксплуатации", destination: manualURL)
                    .buttonStyle(DefaultButtonStyle(width: 220, height: 50))
                    .padding(.top, 5)
                
                NavigationLink {
                    TestDriveView()
                } label: {
                    Text ("Записаться на тест-драйв")
                }.buttonStyle(DefaultButtonStyle(width: 220, height: 50))
                    .padding(.top, 5)
                
                NavigationLink {
                    CarRequestView()
                } label: {
                    Text ("Оставить запрос")
                }.buttonStyle(DefaultButtonStyle(width: 220, height: 50)).padding(.top, 5)
                    .padding(.bottom, 5)
                
            }
        }
    }
}

struct CarDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CarDetailView(model: CarInfo(model: "",
                                     price: 0,
                                     tagline: "",
                                     imageLink: "",
                                     bookletLink: "",
                                     priceLink: "",
                                     manualLink: "",
                                     type: ""))
    }
}
