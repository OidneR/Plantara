//
//  CircularProgressBar.swift
//  macro
//
//  Created by Michelle Aurelia on 28/10/21.
//

import SwiftUI

struct CircularProgressBar: View {
  @State var percentage: CGFloat = 0
    var body: some View {
      ZStack {
        VStack {
          ZStack {
            Background()
            Label()
            Outline(percentage: $percentage)
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
  var colors: [Color] = [Color.yellow]
  var body: some View {
    ZStack {
      Circle()
        .fill(Color.green)
        .frame(width: 100, height: 100)
        .overlay(
          Circle()
            .stroke(style: StrokeStyle(lineWidth: 12))
            .fill(AngularGradient(gradient: .init(colors: colors), center: .center))
        )
    }
  }
}

struct Label: View {
  var percentage: CGFloat = 0
  var body: some View {
    VStack {
      Image(systemName: "sun.max")
        .resizable()
        .frame(width: 30, height: 30)

      Text(String(format: "%.0f Lx", percentage))
        .bold()
    }
    .background(Color.green)
  }
}

struct Outline: View {
  @Binding var percentage: CGFloat
  var colors: [Color] = [Color.red]
  var body: some View {
    ZStack {
      Circle()
        .fill(Color.clear)
        .frame(width: 100, height: 100)
        .overlay(
          Circle()
            .trim(from: 0, to: (percentage * 0.01))
            .stroke(style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round))
            .fill(AngularGradient(gradient: .init(colors: colors), center: .center, startAngle: .zero, endAngle: .init(degrees: 360)))
            .rotationEffect(Angle(degrees: -90))
        )
        .animation(.spring(response: 2.0, dampingFraction: 1.0, blendDuration: 1.0))
    }
  }
}

