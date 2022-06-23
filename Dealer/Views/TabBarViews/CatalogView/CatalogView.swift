//
//  CatalogView.swift
//  Dealer
//
//  Created by Владимир Свиридов on 26.03.2022.
//

import SwiftUI

struct CatalogView: View {
    // список автомобилей доступных для покупки
    @ObservedObject private var viewModel = CatalogViewViewModel()
    @State var isLoaded = false
    @State private var selectedIndex = 0
    
    @Binding var barTitle: String
    
    var body: some View {
        NavigationView {
            VStack() { // элемент выбора типа автомобитей
                Picker("Какой автомобиль вас интересует", selection: $selectedIndex, content: {
                    Text("Легковые").tag(0)
                    Text("Кроссоверы").tag(1)
                    Text("Коммерческие").tag(2)
                })
                    .pickerStyle(SegmentedPickerStyle())
                
                // список
                NoSeparatorList(viewModel.posts, id: \.id){ (post) in
                    
                    NavigationLink {
                        CarDetailView(model: post)
                    } label: {
                        CarCell(model: post.model,
                                price: String(post.price.formattedWithSeparator),
                                image: post.imageLink)
                        Divider()
                    }
                    // при смене вкладки пикера перезагружается список авто
                }.onChange(of: selectedIndex, perform: { newValue in
                    // if !isLoaded {
                    if selectedIndex == 0 {
                            viewModel.fetchData(carType: "Car")
                    }
                    
                    if selectedIndex == 1 {
                            viewModel.fetchData(carType: "Crossover")
                    }
                    
                    if selectedIndex == 2 {
                            viewModel.fetchData(carType: "Сommercial")
                    }
                    // }
                }).onAppear(){
                    if !isLoaded {
                            viewModel.fetchData(carType: "Car")
                            isLoaded = true
                    }
                }
                
                .navigationTitle(barTitle)
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

struct CatalogView_Previews: PreviewProvider {
    static var previews: some View {
        CatalogView(barTitle: .constant("Каталог"))
    }
}
