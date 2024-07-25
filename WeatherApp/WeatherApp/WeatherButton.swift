//
//  WeatherButton.swift
//  WeatherApp
//
//  Created by Евгений Митюля on 7/24/24.
//

import SwiftUI

struct WeatherButton: View {
    
    var title: String
    var textColor: Color
    var backgroundColor: Color
    var radius: CGFloat
    var fontSize: CGFloat
    
    var body: some View {
        Text(title)
            .frame(width: 280, height: 50)
            .background(backgroundColor, in: RoundedRectangle(cornerRadius: radius, style: .continuous))
            .foregroundStyle(textColor)
            .font(.system(size: fontSize, weight: .bold, design: .default))
    }
}

