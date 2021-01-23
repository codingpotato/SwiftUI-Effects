//
//  Home.swift
//  TravelApp
//
//  Created by Wang Yongwu on 2021/1/23.
//

import SwiftUI

struct Home: View {
    var animation : Namespace.ID
    @Binding var show : Bool
    @Binding var selected : Model
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                HStack {
                    Text("Discover a \nDifferent World")
                        .font(.system(size: 30))
                        .fontWeight(.bold)
                        .foregroundColor(Color("TextColor"))
                    Spacer(minLength: 0)
                    Button(action: {}) {
                        Image(systemName: "magnifyingglass")
                            .renderingMode(.template)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color("Color"))
                            .clipShape(Circle())
                    }
                }
                .padding()
                .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20){
                        ForEach(1...5, id: \.self) { i in
                            Image("r\(i)")
                                .foregroundColor(.white)
                                .padding()
                                .background(Color("Color"))
                                .clipShape(Circle())
                                .onTapGesture {
                                }
                        }
                    }
                    .padding()
                }
                
                HStack {
                    Text("Destinations")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color("TextColor"))
                    Spacer()
                    Button(action: {}) {
                        Text("See All")
                            .foregroundColor(.gray)
                    }
                }
                .padding()
                
                ForEach(data) { travel in
                    ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
                        Image("\(travel.img)")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(height: 300)
                            .cornerRadius(25)
                            .matchedGeometryEffect(id: travel.img, in: animation)
                        VStack(alignment: .trailing, spacing: 8) {
                            Text(travel.title)
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .matchedGeometryEffect(id: travel.title, in: animation)
                            Text(travel.country)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .matchedGeometryEffect(id: travel.country, in: animation)
                        }
                        .padding()
                    }
                    .padding()
                    .onTapGesture {
                        withAnimation(.spring()) {
                            selected = travel
                            show.toggle()
                        }
                    }
                }
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    @Namespace static var animation
    
    static var previews: some View {
        Home(animation: animation, show: .constant(false), selected: .constant(Model(id: "1", title: "US", country: "US", ratings: "1", price: "2", img: "p1")))
    }
}
