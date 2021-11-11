//
//  iPadPlantDetailPage.swift
//  macro
//
//  Created by Michelle Aurelia on 09/11/21.
//

import SwiftUI

struct iPadPlantDetailPage: View {
  var body: some View {
   iPadPlantDetailBody()
  }
}

struct iPadPlantDetailPage_Preview: PreviewProvider {
  static var previews: some View {
    iPadPlantDetailPage()
.previewInterfaceOrientation(.landscapeLeft)
  }
}

struct iPadPlantDetailBody: View {

  @State var valueProgressBar: CGFloat = 100

  var body: some View {
      HStack {
        /* GAMBAR TANAMAN DAN BULETAN DIBAWAHNYA */
        VStack {
          Image("iconBayam")
            .resizable()
            .frame(width: 300, height: 300)
            .padding(.bottom, 40)

          HStack {
            /* SUHU DAN KELEMBABAN TANAH */
            VStack {
              CircularProgressBar(percentage: $valueProgressBar, circularProgressBarStyle: .suhu, amount: 00, isCardView: true, diameter: 100)
                .padding(.bottom, 10)
              Text("Suhu")
                .font(.custom("Lato", size: 14))
                .foregroundColor(Warna.Gray3)
              Text("16-20C")
                .font(.custom("Lato", size: 16))
                .padding(.bottom, 20)


              CircularProgressBar(percentage: $valueProgressBar, circularProgressBarStyle: .tanah, amount: 00, isCardView: true, diameter: 100)
                .padding(.bottom, 10)
              Text("Kelembaban Tanah")
                .font(.custom("Lato", size: 14))
                .foregroundColor(Warna.Gray3)
              Text("40-60%")
                .font(.custom("Lato", size: 16))
            }
            .padding(.trailing, 20)

            /* SINAR MATAHARI DAN KELEMBABAN UDARA*/
            VStack {
              CircularProgressBar(percentage: $valueProgressBar, circularProgressBarStyle: .sinar, amount: 00, isCardView: true, diameter: 100)
                .padding(.bottom, 10)
              Text("Sinar Matahari")
                .font(.custom("Lato", size: 14))
                .foregroundColor(Warna.Gray3)
              Text("1965 Lux")
                .font(.custom("Lato", size: 16))
                .padding(.bottom, 20)

              CircularProgressBar(percentage: $valueProgressBar, circularProgressBarStyle: .udara, amount: 00, isCardView: true, diameter: 100)
                .padding(.bottom, 10)
              Text("Kelembaban Udara")
                .font(.custom("Lato", size: 14))
                .foregroundColor(Warna.Gray3)
              Text("40-60%")
                .font(.custom("Lato", size: 16))
            }
            .padding(.leading, 20)
          }
        }.frame(maxWidth: 394, maxHeight: .infinity)


        /* DESKRIPSI DAN INFO TANAMAN */
        RoundedRectangle(cornerRadius: 20)
          .fill(Color.white)
          .frame(maxWidth: .infinity, maxHeight: .infinity)
          .overlay(
            ZStack {
              ScrollView {
                VStack (alignment: .leading){

                  /* DESKRIPSI */
                  Text("Deskripsi")
                    .font(.custom("Lato", size: 26))
                    .padding(.horizontal, 20)
                    .padding(.top, 32)
                    .padding(.bottom, 8)
                  Text("Test test 123 test")
                    .font(.custom("Lato", size: 18))
                    .padding(.horizontal, 20)

                  Divider()
                    .padding(.vertical, 16)
                    .padding(.horizontal, 20)

                  /* PANDUAN PERAWATAN */
                  Text("Panduan Perawatan")
                    .font(.custom("Lato", size: 26))
                    .padding(.horizontal, 20)
                    .padding(.bottom, 8)
                  Text("List panduan perawatan")
                    .font(.custom("Lato", size: 18))
                    .padding(.horizontal, 20)

                  Divider()
                    .padding(.vertical, 16)
                    .padding(.horizontal, 20)

                  /* TIPS */
                  Text("Tips")
                    .font(.custom("Lato", size: 26))
                    .padding(.horizontal, 20)
                    .padding(.bottom, 8)
                  Text("Tips and trick merawat tanaman")
                    .padding(.horizontal, 20)
                    .font(.custom("Lato", size: 18))

                  Divider()
                    .padding(.top, 16)
                    .padding(.horizontal, 20)
                }
              }

              /* BUTTON */
              VStack {
                Spacer()
                Button("Tambah Tanaman"){
                    print("tambah tanaman")
                }
                .frame(maxWidth: 650, maxHeight: 58)
                .foregroundColor(.white)
                .font(.system(size: 20 ,weight: .regular))
                .background(RoundedRectangle(cornerRadius: 10)
                                .fill(Color("SecondaryColor")))
                .padding(.bottom, 18)
              }


            }


          )
      }


    .ignoresSafeArea()
    .background(Color("PrimaryColor"))
  }
}
