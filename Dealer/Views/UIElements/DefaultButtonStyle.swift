//
//  DefaultButtonStyle.swift
//  Dealer
//
//  Created by Владимир Свиридов on 27.03.2022.
//

import SwiftUI

// стиль синей кнопки для Link или NavigationLink
struct DefaultButtonStyle: ButtonStyle {
    
    let width: CGFloat
    let height: CGFloat
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label.font(.system(size: 16, weight: .regular, design: .default))
            .foregroundColor(configuration.isPressed ? .white.opacity(0.5) : .white).frame(width: width - 10, height: height, alignment: .center)
            .frame(width: width, height: height, alignment: .center)
        // цвет #002c5f
            .background(Color("ButtonBlue")).cornerRadius(0.0)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
        
    }
}

//struct DefaultButtonStyle_Previews: PreviewProvider {
//    static var previews: some View {
//        DefaultButtonStyle(width: 200, height: 50)
//    }
//}
