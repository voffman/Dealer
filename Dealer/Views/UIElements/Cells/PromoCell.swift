//
//  PromoCell.swift
//  Dealer
//
//  Created by Владимир Свиридов on 30.03.2022.
//

import SwiftUI

struct PromoCell: View {
    
    var image: String? = "car"
    var date = Date()
    var title: String = "Заголовок"
    var body: some View {
        VStack(spacing: 10){
            if let image = image {
                
                AsyncImage(url: URL(string: image)!,
                           placeholder: { Text("Загрузка ...") },
                           image: { Image(uiImage: $0).resizable() })
                    .scaledToFit()
                    .cornerRadius(5)
                    .frame(width: UIScreen.screenWidth, height: 130).padding(.trailing, 80)
            }
            HStack(){
                Text(date, style: .date)
                    .font(.system(size: 16, weight: .light))
                    .padding(.top, 5)
                Spacer()
            }
            Text(title)
                .font(.system(size: 20, weight: .light, design: .default))
                .frame(width: UIScreen.screenWidth - 100, height: 50, alignment: .topLeading)
                .padding(.trailing, 50)
            
        }.frame(width: UIScreen.screenWidth, height: 240)
    }
}

struct PromoCell_Previews: PreviewProvider {
    static var previews: some View {
        PromoCell()
    }
}
