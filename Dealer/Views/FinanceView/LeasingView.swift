//
//  LeasingView.swift
//  Dealer
//
//  Created by Владимир Свиридов on 03.04.2022.
//

import SwiftUI
// экран лизинга
struct LeasingView: View {
    
    private let viewModel = LeasingViewViewModel()
    @State private var selectedIndex = 0 // отслеживает выбранную вкладку
    @State private var title: String?
    @State private var description: String?
    @State private var link: String?
    
    var body: some View {
        ScrollView {
            VStack {
                Picker("Выберите тип лизинга", selection: $selectedIndex, content: {
                    Text("Финансовый лизинг").tag(0)
                    Text("Оперативный лизинг").tag(1)
                })
                    .pickerStyle(SegmentedPickerStyle()) // <1>
                // Text("Selected index: \(selectedIndex)")
                
            }
            VStack(){
                if selectedIndex == 0 {
                    InfoView(title: title ?? "", description: description ?? "", image: "")
                        .onAppear{
                        viewModel.fetchData(key: "financeLeasing") { post in
                            title = post.title
                            description = post.description
                            link = post.link
                        }
                    }
                }
                if selectedIndex == 1 {
                    InfoView(title: title ?? "", description: description ?? "", image: "")
                        .onAppear{
                        viewModel.fetchData(key: "operationalLeasing") { post in
                            title = post.title
                            description = post.description
                            link = post.link
                        }
                    }
                }
            }
        }
    }
}
struct LeasingView_Previews: PreviewProvider {
    static var previews: some View {
        LeasingView()
    }
}
