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
    @State var amount: Double
    @State var isCardView: Bool
    @State var overPersentage: Double = 0
    @State var diameter: Double
        
    var body: some View {
        ZStack {
            Background(color: Warna.primary, isCardView: isCardView, diameter: $diameter)
            
            switch circularProgressBarStyle {
            case .suhu:
                Label(amount: "\(amount)", icon: "imgTemperature", diameter: $diameter,isCardView: $isCardView)
                Outline(percentage: $percentage, color: Warna.TempNormal, diameter: $diameter)
                    //.animation(.easeIn(duration: 2))
                if(percentage>100){
                    OverOutline(percentage: $overPersentage, color: Warna.TempOver, diameter: $diameter)
                        .onAppear {
                            withAnimation(.easeIn(duration: 2)) {
                                overPersentage = percentage
                            }
                        }
                }
                
            case .sinar:
                Label(amount: "\(amount)", icon: "imgSunlightMeter", diameter: $diameter,isCardView: $isCardView)
                Outline(percentage: $percentage, color: Warna.SunlightNormal, diameter: $diameter)
                    //.animation(.easeIn(duration: 2))
                if(percentage>100){
                    OverOutline(percentage: $overPersentage, color: Warna.SunlightOver, diameter: $diameter)
                        .onAppear {
                            withAnimation(.easeIn(duration: 2)) {
                                overPersentage = percentage
                            }
                        }
                }
                
            case .tanah:
                Label(amount: "\(amount)", icon: "imgSoilMoisture", diameter: $diameter,isCardView: $isCardView)
                Outline(percentage: $percentage, color: Warna.SoilMoistNormal, diameter: $diameter)
                    //.animation(.easeIn(duration: 2))
                if(percentage>100){
                    OverOutline(percentage: $overPersentage, color: Warna.SoilMoistOver, diameter: $diameter)
                        .onAppear {
                            withAnimation(.easeIn(duration: 2)) {
                                overPersentage = percentage
                            }
                        }
                }
                
            case .udara:
                Label(amount: "\(amount)", icon: "imgAirHumidity", diameter: $diameter,isCardView: $isCardView)
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
            percentage = percentage * -1
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
    @State var amount: String
    @State var icon: String
    @Binding var diameter: Double
    @Binding var isCardView: Bool
    var body: some View {
        VStack {
            Image(icon)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxHeight: (45 * ( diameter / 105 )))
            if(!isCardView){
                Text(amount).font(.system(size: 18))
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


