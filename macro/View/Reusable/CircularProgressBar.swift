//
//  CircularProgressBar.swift
//  macro
//

//  Created by Michael Tanakoman on 27/10/21.


//

import SwiftUI

struct CircularProgressBar: View {
    @State var percentage: CGFloat = 120
    @State var circularProgressBarStyle: progressBarStyle = .udara
    @State var amount: Double = 50
    @State var isCardView: Bool = false
    @State var overPersentage = 0
    var body: some View {
      ZStack {
        VStack {
          ZStack {
            Background(color: Warna.primary, isCardView: true)
              switch circularProgressBarStyle {
              case .suhu:
                  Label(amount: "\(amount)", icon: "imgTemperature")
                  Outline(percentage: $percentage, color: Warna.TempNormal)
                  if(percentage>100){
                      OverOutline(percentage: $percentage, color: Warna.TempOver)
                  }
              case .sinar:
                  Label(amount: "\(amount)", icon: "imgSunlightMeter")
                  Outline(percentage: $percentage, color: Warna.SunlightNormal)
                  if(percentage>100){
                      OverOutline(percentage: $percentage, color: Warna.SunlightOver)
                  }
              case .tanah:
                  Label(amount: "\(amount)", icon: "imgSoilMoisture")
                  Outline(percentage: $percentage, color: Warna.SoilMoistNormal)
                  if(percentage>100){
                      OverOutline(percentage: $percentage, color: Warna.SoilMoistOver)
                  }
              case .udara:
                  Label(amount: "\(amount)", icon: "imgAirHumidity")
                  Outline(percentage: $percentage, color: Warna.AirHumidNormal)
                  if(percentage>100){
                      OverOutline(percentage: $percentage, color: Warna.AirHumidOver)
                  }
              }
          }
        }
      }
    }
}

struct CircularProgressBar_Previews: PreviewProvider {
    static var previews: some View {
      CircularProgressBar()
    }
}

struct Background: View {
    @State var color: Color
    @State var isCardView: Bool
  var body: some View {
    ZStack {
      Circle()
        .fill(color)
        .frame(width: 125, height: 125)
        .overlay(
          Circle()
            .stroke(style: StrokeStyle(lineWidth: 12))
            .fill(isCardView ? color : Color.white)
        )
    }
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
  var body: some View {
    ZStack {
      Circle()
        .fill(Color.clear)
        .frame(width: 125, height: 125)
        .overlay(
          Circle()
            .trim(from: 0, to: (percentage * 0.01))
            .stroke(style: StrokeStyle(lineWidth: 15, lineCap: .round, lineJoin: .round))
            .fill(color)
            .rotationEffect(Angle(degrees: -90))
        )
        .animation(.spring(response: 2.0, dampingFraction: 1.0, blendDuration: 1.0))
    }
  }
}

struct OverOutline: View {
  @Binding var percentage: CGFloat
    @State var color: Color
  var body: some View {
    ZStack {
      Circle()
        .fill(Color.clear)
        .frame(width: 125, height: 125)
        .overlay(
            ZStack{
                Circle()
                  .trim(from: 0, to: ((percentage-100) * 0.01))
                  .stroke(style: StrokeStyle(lineWidth: 15, lineCap: .round, lineJoin: .round))
                  .fill(color)
                  .rotationEffect(Angle(degrees: -90))
              Circle()
                .trim(from: 0, to: ((percentage-102) * 0.01))
                .stroke(style: StrokeStyle(lineWidth: 15, lineCap: .square, lineJoin: .round))
                .fill(color)
                .rotationEffect(Angle(degrees: -90))
            }
        )
        .animation(.spring(response: 2.0, dampingFraction: 1.0, blendDuration: 1.0))
    }
  }
}

