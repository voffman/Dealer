//
//  FinanceView.swift
//  Dealer
//
//  Created by Владимир Свиридов on 26.03.2022.
//

import SwiftUI
// вкладка Финансирование
struct FinanceView: View {
    
    private let viewModel = FinanceViewViewModel()
    @Binding var barTitle: String
    @State private var description: String?
    
    var body: some View {
        NavigationView {
            ScrollView {
                Text(description ?? "")
                    .font(.system(size: 24, weight: .thin, design: .default))
                    .padding()
                    .onAppear{
                        viewModel.fetchData(key: "financeDescription") { post in
                            description = post.description
                        }
                    }
                HStack(){
                    NavigationLink {
                        CreditView() // переход на экран кредитования
                    } label: {
                        Text ("Кредитование")
                    }.buttonStyle(DefaultButtonStyle(width: 145, height: 50))
                    
                    NavigationLink {
                        LeasingView() // переход на экарн лизинга
                    } label: {
                        Text ("Лизинг")
                    }.buttonStyle(DefaultButtonStyle(width: 145, height: 50))
                }
            }
            .navigationTitle(barTitle)
            .navigationBarTitleDisplayMode(.automatic)
        }
    }
}

struct FinanceView_Previews: PreviewProvider {
    static var previews: some View {
        FinanceView(barTitle: .constant("Финанирование"))
    }
}
