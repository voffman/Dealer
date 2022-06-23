//
//  CarCell.swift
//  Dealer
//
//  Created by Владимир Свиридов on 30.03.2022.
//

import SwiftUI

struct CarCell: View {
    
    var model: String = ""
    var price: String = ""
    var image: String? = ""
    
    var body: some View {
        VStack(spacing: 10){
            if let image = image {
                AsyncImage(url: URL(string: image)!,
                           placeholder: { Text("Загрузка ...") },
                           image: { Image(uiImage: $0).resizable() })
                    .scaledToFit().cornerRadius(5)
                    .frame(width: UIScreen.screenWidth, height: 180)
                    .padding(.trailing, 80)
            }
            Text(model).fontWeight(.regular)
                .font(.system(size: 20))
                .frame(width: UIScreen.screenWidth, alignment: .leading)
            
            Text("от \(price) ₸")
                .font(.system(size: 16, weight: .light, design: .default))
                .frame(width: UIScreen.screenWidth, alignment: .leading)
            
        }.frame(width: UIScreen.screenWidth, height: 250)
    }
}

struct CarCell_Previews: PreviewProvider {
    static var previews: some View {
        CarCell()
    }
}
