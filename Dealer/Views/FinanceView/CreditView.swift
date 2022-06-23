//
//  CreditView.swift
//  Dealer
//
//  Created by Владимир Свиридов on 03.04.2022.
//

import SwiftUI

struct CreditView: View {
    
    private let viewModel = CreditViewViewModel()
    @State private var selectedIndex = 0 // отслеживает выбранную вкладку
    @State private var title: String?
    @State private var description: String?
    @State private var link: String?
    
    var body: some View {
        ScrollView {
            VStack(){
                InfoView(title: title ?? "", description: description ?? "", image: "")
                let url = URL(string: link ?? "")
                if let url = url {
                    Link(title ?? "", destination: url)
                }

                
            }.onAppear{
                viewModel.fetchData(key: "MyCarFinance") { post in
                    title = post.title
                    description = post.description
                    link = post.link
                }
            }
        }
    }
}

struct CreditView_Previews: PreviewProvider {
    static var previews: some View {
        CreditView()
    }
}
