//
//  ContentView.swift
//  weather
//
//  Created by Arsham Mehrani on 2/9/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, Color("lightblue")]),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            VStack {
                Text("Mission Viejo, CA")
                    .font(.system(size: 32, weight: .medium))
                    .foregroundStyle(Color.white)
                    .padding()

                
                WeatherView(imageName: "cloud.bolt.rain.fill", temperature: 69)
                
                HStack (spacing: 40){
                    WeatherDayView(dayOfWeek: "TUE", imageName: "cloud.sun.rain.fill", temperature: 74)
                    WeatherDayView(dayOfWeek: "WED", imageName: "cloud.sun.bolt.fill", temperature: 69)
                    WeatherDayView(dayOfWeek: "THU", imageName: "cloud.sun.rain.fill", temperature: 50)
                    WeatherDayView(dayOfWeek: "FRI", imageName: "sun.max.fill", temperature: 69)
                    WeatherDayView(dayOfWeek: "SAT", imageName: "sun.rain.fill", temperature: 60)
                }
                Spacer()
                
                Button {
                    print("Tapped")
                } label: {
                    ButtonGeneric(buttonName: "Change Day Time")
                }
                
                Spacer()
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
        VStack(spacing: 10) {
            Text(dayOfWeek)
                .font(.system(size: 15, weight: .medium))
                .foregroundStyle(Color.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 30, height: 30)
            Text("\(temperature)°")
                .font(.system(size: 15, weight: .medium))
                .foregroundStyle(Color.white)
        }
    }
}

struct WeatherView: View {
    
    var imageName: String
    var temperature: Int
    
    
    var body: some View {
        VStack (spacing: 10) {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundStyle(Color.white)
        }
        .padding(.bottom, 100)
    }
}

struct ButtonGeneric: View {
    
    var buttonName: String
    
    var body: some View {
        Text(buttonName)
            .frame(width: 280, height: 50)
            .background(Color.white)
            .font(.system(size: 20, weight: .bold, design: .default))
            .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
    }
}
