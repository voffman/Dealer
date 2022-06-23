//
//  DealerApp.swift
//  Dealer
//
//  Created by Владимир Свиридов on 26.03.2022.
//

import SwiftUI
import Firebase

 @main
struct DealerApp: App {
    
    init() {
       FirebaseApp.configure() // требуется сконфигурировать при запуске
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
