//
//  ContentView.swift
//  WeatherApp
//
//  Created by Евгений Митюля on 7/24/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: isNight)
            VStack {
                CityTextView(cityName: "Minsk", countryName: "Belarus")
                VStack(spacing: 10) {
                    MainWeatherStatusView(
                        imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill",
                        temperature: 31
                    )
                    .padding([.top, .bottom], 40)
                    
                    HStack(spacing: 20) {
                        WeatherDayView(
                            dayOfWeek: "TUE",
                            imageName: "cloud.sun.fill",
                            temperature: 28
                        )
                        WeatherDayView(
                            dayOfWeek: "WED",
                            imageName: "cloud.fill",
                            temperature: 29
                        )
                        WeatherDayView(
                            dayOfWeek: "THU",
                            imageName: "sun.horizon.fill",
                            temperature: 27
                        )
                        WeatherDayView(
                            dayOfWeek: "FRU",
                            imageName: "cloud.sun.fill",
                            temperature: 28
                        )
                        WeatherDayView(
                            dayOfWeek: "SAT",
                            imageName: "cloud.rain.fill",
                            temperature: 26
                        )
                    }
                    Spacer()
                    
                    Button {
                        isNight.toggle()
                    } label: {
                        WeatherButton(
                            title: "Change Day Time",
                            textColor: .blue,
                            backgroundColor: .white,
                            radius: 10,
                            fontSize: 20
                        )
                    }
                    Spacer()
                    
                }
            }
            .onAppear {
                let button = WeatherButton(
                    title: "Change Day Time",
                    textColor: .blue,
                    backgroundColor: .white,
                    radius: 10,
                    fontSize: 20
                )
                print(type(of: button.body))
            }
            
        }
    }
}
#Preview {
    ContentView()
}

struct WeatherDayView: View {
    
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack {
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundStyle(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temperature)°")
                .font(.system(size: 28, weight: .medium))
                .foregroundStyle(Color.white)
        }
    }
}

struct BackgroundView: View {
    
    var isNight: Bool
    
    var body: some View {
        LinearGradient(
            gradient: Gradient(
                colors: [isNight ? .black : .blue,
                         isNight ? .gray : Color("lightBlue")]
            ),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        .ignoresSafeArea()
//        ContainerRelativeShape()
//            .fill(isNight ? Color.black.gradient : Color.blue.gradient)
//            .ignoresSafeArea()
    }
}

struct CityTextView: View {
    
    var cityName: String
    var countryName: String
    
    var body: some View {
        Text("\(cityName), \(countryName)")
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundStyle(.white)
            .padding([.top, .bottom], 10)
    }
}

struct MainWeatherStatusView: View {
    
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 18) {
            Image(systemName: imageName)
                .symbolRenderingMode(.multicolor)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundStyle(Color.white)
        }
    }
}

