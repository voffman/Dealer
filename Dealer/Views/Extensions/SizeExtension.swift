//
//  SizeExtension.swift
//  Dealer
//
//  Created by Владимир Свиридов on 26.03.2022.
//

import SwiftUI
// быстрый доступ к высоте и ширине экрана
extension UIScreen{
    static let screenWidth = UIScreen.main.bounds.size.width
    static let screenHeight = UIScreen.main.bounds.size.height
    static let screenSize = UIScreen.main.bounds.size
}
