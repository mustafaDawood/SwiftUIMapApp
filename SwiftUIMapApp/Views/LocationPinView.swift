//
//  LocationPinView.swift
//  SwiftUIMapApp
//
//  Created by Mac on 4/6/23.
//

import SwiftUI

struct LocationPinView: View {
    let accentColor = Color(#colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)).opacity(0.8)
    var body: some View {
        VStack(spacing: 0.0) {
            Image (systemName: "map.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
                .font(.headline)
                .foregroundColor(.white)
                .padding(9)
                .background(accentColor)
                .clipShape(Circle())
            Image(systemName: "triangle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 15, height: 15)
                .foregroundColor(accentColor)
                .rotationEffect(Angle(degrees: 180))
                .offset(y: -3)
                .padding(.bottom,35)
            
        }
    }
}

struct LocationPinView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            
            LocationPinView()
        }
    }
}
