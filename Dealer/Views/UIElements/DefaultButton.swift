//
//  DefaultButton.swift
//  Dealer
//
//  Created by Владимир Свиридов on 26.03.2022.
//

import SwiftUI
// синяя кнопка как в MainView
struct DefaultButton: View {
    
    let width: CGFloat
    let height: CGFloat
    let text: String
    var clicked: (() -> Void) /// use closure for callback
    
    var body: some View {
        Button(action: clicked){
            Text(text)
                .font(.system(size: 16, weight: .regular, design: .default))
                .foregroundColor(.white)
                .frame(width: width - 10, height: height, alignment: .center)
        }.frame(width: width, height: height, alignment: .center)
        // цвет #002c5f
            .background(Color("ButtonBlue")).cornerRadius(0.0)
    }
}

struct DefaultButton_Previews: PreviewProvider {
    static var previews: some View {
        DefaultButton(width: 220, height: 50, text: "Кнопка") {
            print("Button clicked")
        }
    }
}
