//
//  CircularProgressBar.swift
//  macro
//

//  Created by Michael Tanakoman on 27/10/21.


//

import SwiftUI

struct CircularProgressBar: View {
    @Binding var percentage: Double
    @State var circularProgressBarStyle: progressBarStyle
    @Binding var amount: Double
    @State var isCardView: Bool
    @State var overPersentage: Double = 0
    @State var diameter: Double
    let scheduleNotif = NotificationHelper()
    @State var valueAnimation = true
    
    var body: some View {
        ZStack {
            Background(color: Warna.primary, isCardView: isCardView, diameter: $diameter)
                .onAppear {
                    withAnimation (.easeIn(duration: 2)){
                        valueAnimation = false
                    }
                }
            
            switch circularProgressBarStyle {
            case .suhu:
                Label(amount: "\(amount)°C", icon: "imgTemperature", diameter: $diameter,isCardView: $isCardView)
                    .animation(nil, value: valueAnimation)
                Outline(percentage: $percentage, color: Warna.TempNormal, diameter: $diameter)
                if(percentage>100){
                    OverOutline(percentage: $overPersentage, color: Warna.TempOver, diameter: $diameter)
                        .onAppear {
                            withAnimation(.easeIn(duration: 2)) {
                                overPersentage = percentage
                            }
                        }
                }
                
            case .sinar:
                Label(amount: "\(amount)Lx", icon: "imgSunlightMeter", diameter: $diameter,isCardView: $isCardView)
                    .animation(nil, value: valueAnimation)
                Outline(percentage: $percentage, color: Warna.SunlightNormal, diameter: $diameter)
                if(percentage>100){
                    OverOutline(percentage: $overPersentage, color: Warna.SunlightOver, diameter: $diameter)
                        .onAppear {
                            withAnimation(.easeIn(duration: 2)) {
                                overPersentage = percentage
                            }
                        }
                }
                
            case .tanah:
                Label(amount: "\(amount)RH", icon: "imgSoilMoisture", diameter: $diameter,isCardView: $isCardView)
                    .animation(nil, value: valueAnimation)
                Outline(percentage: $percentage, color: Warna.SoilMoistNormal, diameter: $diameter)
                if(percentage>100){
                    OverOutline(percentage: $overPersentage, color: Warna.SoilMoistOver, diameter: $diameter)
                        .onAppear {
                            withAnimation(.easeIn(duration: 2)) {
                                overPersentage = percentage
                            }
                        }
                }
                
            case .udara:
                Label(amount: "\(amount)RH", icon: "imgAirHumidity", diameter: $diameter,isCardView: $isCardView)
                    .animation(nil, value: valueAnimation)
                Outline(percentage: $percentage, color: Warna.AirHumidNormal, diameter: $diameter)
                if(percentage>100){
                    OverOutline(percentage: $overPersentage, color: Warna.AirHumidOver, diameter: $diameter)
                        .onAppear {
                            withAnimation(.easeIn(duration: 2)) {
                                overPersentage = percentage
                            }
                        }
                }
            }
        }.onTapGesture {
            let content = UNMutableNotificationContent()
            content.title = "Test Notif"
            content.body = "Ini isi notif"
            
            self.scheduleNotif.scheduleNotification(content, sendAfter: 5)
        }
    }
}

struct Background: View {
    @State var color: Color
    @State var isCardView: Bool
    @Binding var diameter: Double
    var body: some View {
        Circle()
            .fill(color)
            .frame(width: diameter, height: diameter)
            .overlay(
                Circle()
                    .stroke(style: StrokeStyle(lineWidth: diameter*0.15))
                    .fill(isCardView ? Color.white : color)
            )
    }
}

struct Label: View {
    var amount: String
    @State var icon: String
    @Binding var diameter: Double
    @Binding var isCardView: Bool
    var body: some View {
        VStack {
            Image(icon)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxHeight: (45 * ( diameter / 115 )))
            if(!isCardView){
                Text(amount).font(.system(size: 15))
            }
        }
    }
}

struct Outline: View {
    @Binding var percentage: Double
    @State var color: Color
    @Binding var diameter: Double
    var body: some View {
        Circle()
            .trim(from: 0, to: (percentage * 0.01))
            .stroke(style: StrokeStyle(lineWidth: CGFloat(diameter*0.15), lineCap: .round, lineJoin: .round))
            .fill(color)
            .rotationEffect(Angle(degrees: 270))
            .frame(width: diameter, height: diameter)
    }
}

struct OverOutline: View {
    @Binding var percentage: Double
    @State var color: Color
    @Binding var diameter: Double
    var body: some View {
        ZStack{
            Circle()
                .trim(from: 0, to: ((percentage-100) * 0.01))
                .stroke(style: StrokeStyle(lineWidth: diameter*0.15, lineCap: .round, lineJoin: .round))
                .fill(color)
                .rotationEffect(Angle(degrees: -90))
                .frame(width: diameter, height: diameter)
            
            Circle()
                .trim(from: 0, to: ((percentage-102) * 0.01))
                .stroke(style: StrokeStyle(lineWidth: diameter*0.15, lineCap: .square, lineJoin: .round))
                .fill(color)
                .rotationEffect(Angle(degrees: -90))
                .frame(width: diameter, height: diameter)
        }
    }
}


