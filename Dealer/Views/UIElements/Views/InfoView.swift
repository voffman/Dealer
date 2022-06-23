//
//  InfoView.swift
//  Dealer
//
//  Created by Владимир Свиридов on 02.04.2022.
//

import SwiftUI
// для детального отображения информаии, например об акциях
struct InfoView: View {
    
    let title: String
    let description: String
    let image: String?
    
    init(title: String, description: String, image: String?){
        self.title = title
        self.description = description
        self.image = image
        
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0){
                Text(title)
                    .font(.system(size: 24, weight: .thin, design: .default))
                    .padding()
                VStack(){
                    if image != "" {
                        AsyncImage(url: URL(string: image ?? "")!,
                                   placeholder: { Text("Загрузка ...") },
                                   image: { Image(uiImage: $0).resizable() })
                            .scaledToFit()
                            .frame(width: UIScreen.screenWidth - 20, height: UIScreen.screenWidth/2)
                    }
                }
                
                Text(description)
                    .font(.system(size: 16, weight: .light, design: .default))
                    .frame(width: UIScreen.screenWidth - 30).padding(.top, 10)
            }
        }
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView(title: "Новость", description: "Описание новости", image: "")
    }
}
