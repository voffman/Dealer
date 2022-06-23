//
//  PlaceholderTextEditor.swift
//  Dealer
//
//  Created by Владимир Свиридов on 27.03.2022.
//

import SwiftUI

// используется в FeedBackView для ввода сообщения
struct PlaceholderTextEditor: View {
    let placeholder: String
    @Binding var text: String
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .top)) {
            if text.isEmpty {
                Text(placeholder)
                    .foregroundColor(Color(.label))
                    .padding(.top, 10)
            }
            TextEditor(text: $text)
                .opacity(text.isEmpty ? 0.7 : 1)
        }
        .padding([.leading, .trailing], 8)
        .overlay(
            RoundedRectangle(cornerRadius: 6)
                .stroke(Color(.systemGray5), lineWidth: 1.0)
        )
    }
}

