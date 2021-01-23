//
//  DetailView.swift
//  TravelApp
//
//  Created by Wang Yongwu on 2021/1/23.
//

import SwiftUI

struct DetailView: View {
    var animation : Namespace.ID
    @Binding var show : Bool
    @Binding var selected : Model

    var body: some View {
        VStack {
            VStack {
                ZStack(alignment: Alignment(horizontal: .center, vertical: .top)) {
                    Image(selected.img)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 330)
                        .clipShape(RoundedShape(corners: [.bottomLeft,.bottomRight]))
                        .matchedGeometryEffect(id: selected.img, in: animation)
                    HStack {
                        Button(action: {
                            withAnimation(.spring()) {
                                show.toggle()
                            }
                        }) {
                            Image(systemName: "chevron.left")
                                .foregroundColor(.black)
                                .padding()
                                .background(Color.white)
                                .clipShape(Circle())
                            Spacer()
                            Button(action: {}) {
                                Image(systemName: "suit.heart")
                                    .foregroundColor(.black)
                                    .padding()
                                    .background(Color.white)
                                    .clipShape(Circle())
                            }
                        }
                    }
                    .padding()
                    .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
                }
                HStack(alignment: .top) {
                    VStack(alignment: .leading) {
                        Text(selected.title)
                            .font(.title)
                            .foregroundColor(Color("TextColor"))
                            .fontWeight(.bold)
                            .matchedGeometryEffect(id: selected.title, in: animation)
                        HStack(spacing: 10) {
                            Image(systemName: "map")
                            Text(selected.country)
                                .foregroundColor(.black)
                                .matchedGeometryEffect(id: selected.country, in: animation)
                            HStack(spacing: 5){
                                Text(selected.ratings)
                                    .foregroundColor(.black)
                                Image(systemName: "star.fill")
                                    .foregroundColor(.yellow)
                            }
                        }
                    }
                    Spacer(minLength: 0)
                    Text(selected.price)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color("TextColor"))
                        .animation(.easeInOut)
                        .transition(.opacity)
                }
                .padding()
                .padding(.bottom)
            }
            .background(Color.white)
            .clipShape(RoundedShape(corners: [.bottomLeft,.bottomRight]))
            
            if UIScreen.main.bounds.height < 750 {
                ScrollView(.vertical, showsIndicators: false) {
                    BottomView()
                }
            }
            else {
                BottomView()
            }
            Spacer(minLength: 0)
        }
        .background(Color("Background"))
    }
}

struct DetailView_Previews: PreviewProvider {
    @Namespace static var animation
    
    static var previews: some View {
        DetailView(animation: animation, show: .constant(false), selected: .constant(Model(id: "1", title: "Title", country: "TestCountry", ratings: "1", price: "2", img: "p1")))
    }
}
