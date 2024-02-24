//
//  ContentView.swift
//  WeatherApp
//
//  Created by Bhavin  Oza on 2/17/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            //Color(.blue)
//            BackgroundView(topColor: isNight ? .black : .blue,
//                           bottomColor: isNight ? .gray : Color("lightBlue"))
            BackgroundView(isNight: isNight)
            
            VStack {
                CityTextView(cityName: "Cupertino, CA")
                
                WeatherView(imgName: isNight ? "moon.stars.fill" : "cloud.sun.fill", temp: 76)
                
                HStack(spacing: 20) {
                    WeatherDayView(day: "TUE", image: "cloud.sun.fill", temp: 76)
                    WeatherDayView(day: "WED", image: "sun.max.fill", temp: 88)
                    WeatherDayView(day: "THURS", image: "wind.snow", temp: 55)
                    WeatherDayView(day: "FRI", image: "sunset.fill", temp: 60)
                    WeatherDayView(day: "SAT", image: "snow", temp: 25)
                }
                Spacer()
                
                Button {
                    isNight.toggle()
                } label: {
                    ChangeButton(title: "Change day time", textColor: .blue, bgColor: .white)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

struct WeatherDayView: View {
    
    var day, image: String
    var temp: Int
    
    var body: some View {
        VStack {
            Text(day)
                .font(.caption)
            Image(systemName: image)
//                .renderingMode(.original)
//                .symbolRenderingMode(.multicolor)
//                .symbolRenderingMode(.hierarchical)
                .symbolRenderingMode(.palette)
                .resizable()
//                .foregroundColor(.pink)
                .foregroundStyle(.brown, .cyan, .green)
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temp)°")
                .font(.caption)
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    
    var isNight: Bool
//    @Binding var isNight: Bool //No reason to use Binding, it it used if we want to pass the value from here to parent
//    var topColor, bottomColor: Color
    
    var body: some View {
//        LinearGradient(colors: [topColor, bottomColor],
//        LinearGradient(colors: [isNight ? .black : .blue, isNight ? .gray : Color("lightBlue")],
//                       startPoint: .topLeading,
//                       endPoint: .bottomTrailing)
//                    .ignoresSafeArea()//        .edgesIgnoringSafeArea(.all)
        ContainerRelativeShape()
            .fill(isNight ? Color.black.gradient : Color.blue.gradient) //subtle apple default gradient
            .ignoresSafeArea()
    }
}

struct CityTextView: View {
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.title)
            .foregroundColor(.white)
            .frame(width: 180, height: 180)
    }
}

struct WeatherView: View {
    
    var imgName: String
    var temp: Int
    
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: imgName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            Text("\(temp)°")
                .font(.headline)
                .foregroundColor(.white)
        }
        .padding(.bottom, 40)
    }
}

struct ChangeButton: View {
    
    var title: String
    var textColor, bgColor: Color
    
    var body: some View {
        Text(title)
            .frame(width: 280, height: 100)
            .foregroundColor(textColor)
            .background(bgColor)
            .font(.callout)
            .cornerRadius(10)
    }
}
