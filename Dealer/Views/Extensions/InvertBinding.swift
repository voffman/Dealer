//
//  InvertBinding.swift
//  Dealer
//
//  Created by Владимир Свиридов on 11.04.2022.
//

import SwiftUI
// инвентирование значений, например if !$boolValue
prefix func ! (value: Binding<Bool>) -> Binding<Bool> {
    Binding<Bool>(
        get: { !value.wrappedValue },
        set: { value.wrappedValue = !$0 }
    )
}
