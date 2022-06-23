//
//  ProfileView.swift
//  Dealer
//
//  Created by Владимир Свиридов on 03.04.2022.
//

import SwiftUI
import FirebaseAuth
// экран профиля
struct ProfileView: View {
    
    @ObservedObject private var viewModel = ProfileViewViewModel()
    
    @Binding var barTitle: String
    @Binding var isAuth: Bool
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(){
                    Image(systemName: "person")
                        .resizable()
                        .padding()
                        .frame(width: 100, height: 100, alignment: .center)
                    HStack(){
                        Text("E-mail:")
                        Text(viewModel.getEmailString())
                            .fontWeight(.semibold)
                    }.padding(.bottom, 10)
                    //  Divider()
                    DefaultButton(width: 220, height: 50, text: "Выйти из аккаунта") {
                        UserDefaults.standard.set(false, forKey: "auth")
                        isAuth = false
                    }
                    DefaultButton(width: 220, height: 50, text: "Удалить аккаунт") {
                        viewModel.removeCurrentUser()
                        isAuth = false
                    }
                    
                    Text(" История моих заявок")
                        .fontWeight(.thin)
                        .font(.system(size: 20))
                        .padding(.leading, -5)
                }
                
                List(viewModel.posts.sorted(by: { post, post2 in
                    post.date.dateValue() > post2.date.dateValue()
                }), id: \.id){ (post) in
                    ProfileCell(title: post.service, date: post.date)
                    // Divider()
                    
                }.listStyle(.plain).frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight/2).onAppear(perform: {
                    viewModel.fetchData()
                })
            }
            
            .navigationTitle(barTitle)
            .navigationBarTitleDisplayMode(.automatic)
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(barTitle: .constant("Профиль"), isAuth: .constant(true))
    }
}
