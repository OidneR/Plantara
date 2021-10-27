//
//  CardViewPlant.swift
//  macro
//
//  Created by Dion Lamilga on 26/10/21.
//

import SwiftUI

struct CardViewPlant: View {
    var body: some View {
        CardViewReusable()
    }
}

struct CardViewPlant_Previews: PreviewProvider {
    static var previews: some View {
        CardViewPlant()
    }
}

struct CardViewReusable : View {
    
    var body: some View{
        VStack(spacing : 15){
                VStack{
                    VStack{
                        Image("Icon")
                            .resizable()
                            .padding([.top, .leading, .trailing])
                    }
                    
                    VStack(alignment: .leading){
                            Text("Bayam Hijau")
                                .foregroundColor(.black)
                                .font(.system(size : 17))
                                .padding(.horizontal, 8)
                            Text("Easy")
                                .foregroundColor(.green)
                                .font(.system(size : 14))
                                .padding(.horizontal, 8)
                        }
                    .frame(width: (UIScreen.main.bounds.width - 48) / 2 - 8, height: 63, alignment: .leading)
                        .background(Color.white)
                }
                .frame(width: (UIScreen.main.bounds.width - 48) / 2 - 8, height: 196)
                .background(Color("BackgroundCardPlant"))
                .cornerRadius(10)
                .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 10)
        }
    }
}
