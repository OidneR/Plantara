//
//  CircularProgressBar.swift
//  macro
//
//  Created by Michael Tanakoman on 27/10/21.
//

import SwiftUI

struct CircularProgressBar: View {
    @State var progressValue: Float = 0.0
    
    var body: some View {
        VStack{
//            ProgressBar(progress: self.$progressValue, color: Color.red, image: "sun.max")
//                .frame(width: 40, height: 40)
//                .padding(20)
//                .onAppear {
//                    self.progressValue = 0.30
//                }
            
            Button("Click me"){
                if (progressValue) < 1{
                    self.progressValue += 0.10
                }else{
                    self.progressValue -= 1.0
                }
            }
        }
    }
}

struct ProgressBar: View {
    var progress: Float
    var color: Color
    var image: String
    var lineWidth: Float
    
    var body: some View{
        ZStack{
            Circle()
                .stroke(lineWidth: CGFloat(lineWidth))
                .opacity(0.20)
                .foregroundColor(Color.gray)
            
            Circle()
                .trim(from: 0.0, to: CGFloat(min(self.progress, 1.0)))
                .stroke(style: StrokeStyle(lineWidth: CGFloat(lineWidth), lineCap: .round, lineJoin: .round))
                .foregroundColor(color)
                .rotationEffect(Angle(degrees: 270))
                .animation(.easeIn(duration: 1.0))
            
            Image(systemName: image)
                .font(.system(size: 16))
            
        }
    }
}

struct CircularProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        CircularProgressBar()
    }
}
