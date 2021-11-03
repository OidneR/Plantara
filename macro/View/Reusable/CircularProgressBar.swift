//
//  CircularProgressBar.swift
//  macro
//

//  Created by Michael Tanakoman on 27/10/21.


//

import SwiftUI

struct CircularProgressBar: View {
    @Binding var percentage: CGFloat
    @State var circularProgressBarStyle: progressBarStyle
    @State var amount: Double
    @State var isCardView: Bool
    @State var overPersentage: CGFloat = 0
    @State var diameter: Double
    var body: some View {
        ZStack {
            Background(color: Warna.primary, isCardView: false, diameter: $diameter)
            switch circularProgressBarStyle {
            case .suhu:
                Label(amount: "\(amount)", icon: "imgTemperature")
                Outline(percentage: $percentage, color: Warna.TempNormal, diameter: $diameter)
                if(percentage>100){
                    OverOutline(percentage: $percentage, color: Warna.TempOver, diameter: $diameter)
                }
            case .sinar:
                Label(amount: "\(amount)", icon: "imgSunlightMeter")
                Outline(percentage: $percentage, color: Warna.SunlightNormal, diameter: $diameter)
                if(percentage>100){
                    OverOutline(percentage: $percentage, color: Warna.SunlightOver, diameter: $diameter)
                }
            case .tanah:
                Label(amount: "\(amount)", icon: "imgSoilMoisture")
                Outline(percentage: $percentage, color: Warna.SoilMoistNormal, diameter: $diameter)
                if(percentage>100){
                    OverOutline(percentage: $percentage, color: Warna.SoilMoistOver, diameter: $diameter)
                }
            case .udara:
                Label(amount: "\(amount)", icon: "imgAirHumidity")
                Outline(percentage: $percentage, color: Warna.AirHumidNormal, diameter: $diameter)
                if(percentage>100){
                    OverOutline(percentage: $percentage, color: Warna.AirHumidOver, diameter: $diameter)
                }
            }
        }.onTapGesture {
            percentage = percentage * -1
        }
    }
}

//struct CircularProgressBar_Previews: PreviewProvider {
//    static var previews: some View {
//        //CircularProgressBar()
//    }
//}

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
                    .stroke(style: StrokeStyle(lineWidth: diameter*0.1))
                    .fill(isCardView ? Color.white : color)
            )
    }
}

struct Label: View {
    @State var amount: String
    @State var icon: String
    var body: some View {
        VStack {
            Image(icon)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxHeight: 45)
            
            Text(amount).font(.system(size: 18))
        }
    }
}

struct Outline: View {
    @Binding var percentage: CGFloat
    @State var color: Color
    @Binding var diameter: Double
    var body: some View {
        Circle()
            .trim(from: 0, to: (percentage * 0.01))
            .stroke(style: StrokeStyle(lineWidth: CGFloat(diameter*0.1), lineCap: .round, lineJoin: .round))
            .fill(color)
            .rotationEffect(Angle(degrees: 270))
            //.animation(.easeIn(duration: 10))
            .frame(width: diameter, height: diameter)
        
    }
}

struct OverOutline: View {
    @Binding var percentage: CGFloat
    @State var color: Color
    @Binding var diameter: Double
    var body: some View {
        ZStack{
            Circle()
                .trim(from: 0, to: ((percentage-100) * 0.01))
                .stroke(style: StrokeStyle(lineWidth: diameter*0.1, lineCap: .round, lineJoin: .round))
                .fill(color)
                .rotationEffect(Angle(degrees: -90))
            Circle()
                .trim(from: 0, to: ((percentage-102) * 0.01))
                .stroke(style: StrokeStyle(lineWidth: diameter*0.1, lineCap: .square, lineJoin: .round))
                .fill(color)
                .rotationEffect(Angle(degrees: -90))
        }
    }
}


