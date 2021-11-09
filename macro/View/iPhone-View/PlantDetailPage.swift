//
//  PlantDetailPage.swift
//  macro
//
//  Created by Michelle Aurelia on 02/11/21.
//
import SwiftUI

struct PlantDetailPage: View {
  var body: some View {
    NavigationView {
      ZStack {
        Rectangle()
          .fill(Color("PrimaryColor"))
          .frame(maxWidth: .infinity, maxHeight: .infinity)
          .ignoresSafeArea()
        PlantDetail_Top()
      }
      .navigationBarTitle("[Nama Tanaman]")
      .navigationBarTitleDisplayMode(.inline)
    }
  }
}

struct PlantDetailPage_Preview: PreviewProvider {
  static var previews: some View {
    PlantDetailPage()
  }
}
/* JANGAN LUPA KASIH WARNA FONT SUHU */
struct PlantDetail_Top: View {
  var body: some View {
    ZStack {
      VStack (alignment: .leading){
        /* GAMBAR DAN STATUS TANAMAN */
        HStack (spacing: 0) {
          Image("iconBayam")
            .resizable()
            .frame(width: 164, height: 164)
            .padding(.leading, 20)
            .padding(.trailing, 24)
          VStack (alignment: .leading){

            /* SUHU */
            HStack {
              Image(systemName: "circle")
                .resizable()
                .frame(width: 30, height: 30)
                .padding(.trailing, 12)
              VStack (alignment: .leading){
                Text("Suhu")
                  .font(.custom("Lato", size: 12))
                  .foregroundColor(Warna.Gray3)
                Text("37C")
                  .font(.custom("Lato", size: 14))
              }
            }

            /* SINAR MATAHARI*/
            HStack {
              Image(systemName: "circle")
                .resizable()
                .frame(width: 30, height: 30)
                .padding(.trailing, 12)
              VStack (alignment: .leading){
                Text("Sinar Matahari")
                  .font(.custom("Lato", size: 12))
                  .foregroundColor(Warna.Gray3)
                Text("370 Lumens")
                  .font(.custom("Lato", size: 14))
              }
            }

            /* KELEMBABAN TANAH */
            HStack {
              Image(systemName: "circle")
                .resizable()
                .frame(width: 30, height: 30)
                .padding(.trailing, 12)
              VStack (alignment: .leading){
                Text("Kelembaban Tanah")
                  .font(.custom("Lato", size: 12))
                  .foregroundColor(Warna.Gray3)
                Text("10%")
                  .font(.custom("Lato", size: 14))
              }
            }

            /* KELEMBABAN UDARA */
            HStack {
              Image(systemName: "circle")
                .resizable()
                .frame(width: 30, height: 30)
                .padding(.trailing, 12)
              VStack (alignment: .leading){
                Text("Kelembaban Udara")
                  .font(.custom("Lato", size: 12))
                  .foregroundColor(Warna.Gray3)
                Text("70%")
                  .font(.custom("Lato", size: 14))
              }
            }
          }.padding(.trailing, 10)
        }



        /* DESKRIPSI, PANDUAN PERAWATAN, DAN TIPS */
        Spacer().frame(height: 24)
        RoundedRectangle(cornerRadius: 40)
          .fill(Color.white)
          .frame(width: .infinity, height: .infinity)
          .overlay(
            ScrollView {
              VStack (alignment: .leading){

                /* DESKRIPSI */
                Text("Deskripsi")
                  .font(.custom("Lato", size: 24))
                  .padding(.horizontal, 20)
                  .padding(.top, 32)
                  .padding(.bottom, 8)
                Text("Test test 123 test")
                  .font(.custom("Lato", size: 16))
                  .padding(.horizontal, 20)

                Divider()
                  .padding(.vertical, 16)
                  .padding(.horizontal, 20)

                /* PANDUAN PERAWATAN */
                Text("Panduan Perawatan")
                  .font(.custom("Lato", size: 24))
                  .padding(.horizontal, 20)
                  .padding(.bottom, 8)
                Text("List panduan perawatan")
                  .font(.custom("Lato", size: 16))
                  .padding(.horizontal, 20)

                Divider()
                  .padding(.vertical, 16)
                  .padding(.horizontal, 20)

                /* TIPS */
                Text("Tips")
                  .font(.custom("Lato", size: 24))
                  .padding(.horizontal, 20)
                  .padding(.bottom, 8)
                Text("Tips and trick merawat tanaman")
                  .padding(.horizontal, 20)
                  .font(.custom("Lato", size: 16))

                Divider()
                  .padding(.top, 16)
                  .padding(.horizontal, 20)
              }
            },
            alignment: .leading
          )
          .ignoresSafeArea()
      }.padding(.top, 14)

      VStack {
        Spacer()
        Button("Tambah Tanaman"){
            print("Hello")
        }
        .frame(maxWidth: .infinity ,maxHeight: 50)
        .foregroundColor(.white)
        .font(.system(size: 20 ,weight: .regular))
        .background(RoundedRectangle(cornerRadius: 10)
                        .fill(Color(#colorLiteral(red: 0.6157478094, green: 0.2447247803, blue: 0.1348765492, alpha: 1))))
        .padding(.horizontal, 20)
        .padding(.bottom, 18)
      }
    }
  }
}
