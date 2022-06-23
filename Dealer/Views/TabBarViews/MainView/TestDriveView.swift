//
//  TestDriveView.swift
//  Dealer
//
//  Created by Владимир Свиридов on 30.03.2022.
//

import SwiftUI

struct TestDriveView: View {
    // экран записи на тест-драйв
    let feedbackView = FeedbackView(title: "Тест-драйв", service: "Запись на тест-драйв") {
    }
    
    var body: some View {
        feedbackView
    }
}

struct TestDriveView_Previews: PreviewProvider {
    static var previews: some View {
        TestDriveView()
    }
}
