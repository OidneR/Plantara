//
//  CardViewIpad.swift
//  macro
//
//  Created by Dion Lamilga on 12/11/21.
//
import SwiftUI

struct CardViewIpad: View {
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
                            .font(.system(size : 22))
                            .padding(.horizontal, 8)
                        
                        Text("60-70 Hari")
                            .foregroundColor(Warna.Gray3)
                            .font(.system(size : 20))
                            .padding(.horizontal, 8)
                        
                        if dataTanaman.difficultyTanaman == "Easy"{
                            Text(dataTanaman.difficultyTanaman)
                                .foregroundColor(.green)
                                .font(.system(size : 20))
                                .padding(.horizontal, 8)
                        }
                        else if dataTanaman.difficultyTanaman == "Medium"{
                            Text(dataTanaman.difficultyTanaman)
                                .foregroundColor(.yellow)
                                .font(.system(size : 20))
                                .padding(.horizontal, 8)
                        }
                        else if dataTanaman.difficultyTanaman == "Hard"{
                            Text(dataTanaman.difficultyTanaman)
                                .foregroundColor(.red)
                                .font(.system(size : 20))
                                .padding(.horizontal, 8)
                        }
                    }
                    .frame(width: (UIScreen.main.bounds.width - 200) / 4, height: 116, alignment: .leading)
                    .background(Color.white)
                }
            }
            .frame(width: (UIScreen.main.bounds.width - 200) / 4, height: 322)
            .background(Warna.primary)
            .cornerRadius(10)
            .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 10)
        }
    }
}
