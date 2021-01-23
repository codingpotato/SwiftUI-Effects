//
//  RoundedShape.swift
//  TravelApp
//
//  Created by Wang Yongwu on 2021/1/23.
//

import SwiftUI

struct RoundedShape : Shape {
    var corners : UIRectCorner
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: 45, height: 45))
        return Path(path.cgPath)
    }
}
