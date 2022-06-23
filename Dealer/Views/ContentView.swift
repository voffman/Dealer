//
//  ContentView.swift
//  Dealer
//
//  Created by Владимир Свиридов on 26.03.2022.
//

import SwiftUI
// при запуске приложения в DealerApp если пользователь авторизован происходит переход на главный экран с TabBar -а
struct ContentView: View {
    // запрашиваю данные из локального хранилища по ключу auth
    // проверяю авторизирован ли пользователь
    @State var isAuth: Bool = UserDefaults.standard.bool(forKey: "auth")
    var body: some View {
        VStack(){
            if isAuth{
                TabBar(isAuth: $isAuth)
            }
            else{
                LoginView(isLogin: $isAuth)
            }
        }.onAppear {
            
            self.isAuth = isAuth
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
