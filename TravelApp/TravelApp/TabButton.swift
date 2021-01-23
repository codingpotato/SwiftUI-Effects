//
//  TabButton.swift
//  TravelApp
//
//  Created by Wang Yongwu on 2021/1/23.
//

import SwiftUI

struct TabButton: View {
    var title : String
    @Binding var tab : String
    
    var body: some View{
        Button(action: {
                tab = title
        }) {
            HStack(spacing: 8){
                Image(systemName: title)
                    .renderingMode(.template)
                    .foregroundColor(tab == title ? .white : .gray)
                Text(tab == title ? title : "")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
            }
            .padding(.vertical, 10)
            .padding(.horizontal)
            .background(Color("Color").opacity(tab == title ? 1 : 0))
            .clipShape(Capsule())
        }
    }
}

struct TabButton_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TabButton(title: "airplane", tab: .constant("airplane"))
            TabButton(title: "airplane", tab: .constant("liked"))
        }
    }
}
