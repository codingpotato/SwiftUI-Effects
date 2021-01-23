//
//  MainView.swift
//  TravelApp
//
//  Created by Wang Yongwu on 2021/1/23.
//

import SwiftUI

struct MainView: View {
    @Namespace var animation
    @State var tab = "airplane"
    @State var show = false
    @State var selected : Model = data[0]
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                switch (tab) {
                case "airplane": Home(animation: animation, show: $show, selected: $selected)
                case "hand.thumbsup": Like()
                default: Person()
                }
                Spacer()
                HStack(spacing: 0) {
                    TabButton(title: "airplane", tab: $tab)
                    Spacer(minLength: 0)
                    TabButton(title: "hand.thumbsup", tab: $tab)
                    Spacer(minLength: 0)
                    TabButton(title: "person", tab: $tab)
                }
                .padding(.top)
                .padding(.bottom, UIApplication.shared.windows.first?.safeAreaInsets.bottom == 0 ? 15 : UIApplication.shared.windows.first?.safeAreaInsets.bottom)
                .padding(.horizontal, 35)
                .background(Color.white)
                .clipShape(RoundedShape(corners: [.topLeft,.topRight]))
            }
            if show {
                DetailView(animation: animation, show: $show, selected: $selected)
            }
        }
        .edgesIgnoringSafeArea(.all)
        .background(Color("Background").edgesIgnoringSafeArea(.all))
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
