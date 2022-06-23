//
//  ProfileCell.swift
//  Dealer
//
//  Created by Владимир Свиридов on 03.04.2022.
//

import SwiftUI
import FirebaseFirestore

struct ProfileCell: View {
    
    var title: String = "Заголовок"
    var date: Timestamp
    
    var body: some View {
        HStack(){
            VStack(){
                Text(title)
                    .fontWeight(.regular)
                    .font(.system(size: 16))
                    .frame(width: UIScreen.screenWidth, alignment: .leading)
                Text(date.dateValue(), style: .date)
                    .font(.system(size: 12, weight: .light, design: .default))
                    .frame(width: UIScreen.screenWidth, alignment: .leading)
            }
            Spacer()
        }
    }
}

struct ProfileCell_Previews: PreviewProvider {
    static var previews: some View {
        ProfileCell(date: Timestamp())
    }
}
