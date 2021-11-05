//
//  CardViewPlant.swift
//  macro
//
//  Created by Dion Lamilga on 26/10/21.
//

import SwiftUI

struct CardViewReusable : View {
    
    var dataTanaman: Tanaman

    var body: some View{
        VStack(spacing : 15){
            NavigationLink(destination: SetupDevice(passItem: dataTanaman.namaTanaman)){
                VStack{
                    VStack{
                        Image(dataTanaman.imageTanaman)
                            .resizable()
                            .padding([.top, .leading, .trailing])
                    }
                    
                    VStack(alignment: .leading){
                        Text(dataTanaman.namaTanaman)
                            .foregroundColor(.black)
                            .font(.system(size : 17))
                            .padding(.horizontal, 8)
                        
                        if dataTanaman.difficultyTanaman == "Easy"{
                            Text(dataTanaman.difficultyTanaman)
                                .foregroundColor(.green)
                                .font(.system(size : 14))
                                .padding(.horizontal, 8)
                        }
                        else if dataTanaman.difficultyTanaman == "Medium"{
                            Text(dataTanaman.difficultyTanaman)
                                .foregroundColor(.yellow)
                                .font(.system(size : 14))
                                .padding(.horizontal, 8)
                        }
                        else if dataTanaman.difficultyTanaman == "Hard"{
                            Text(dataTanaman.difficultyTanaman)
                                .foregroundColor(.red)
                                .font(.system(size : 14))
                                .padding(.horizontal, 8)
                        }
                    }
                    .frame(width: (UIScreen.main.bounds.width - 48) / 2 - 8, height: 63, alignment: .leading)
                    .background(Color.white)
                }
            }
            .frame(width: (UIScreen.main.bounds.width - 48) / 2 - 8, height: 196)
            .background(Warna.primary)
            .cornerRadius(10)
            .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 10)
        }
    }
}
