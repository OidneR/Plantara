//
//  PlantDetailPage.swift
//  macro
//
//  Created by Michelle Aurelia on 02/11/21.
//
import SwiftUI

struct PlantDetailPage: View {
    var jenisTanaman: String = ""
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color("PrimaryColor"))
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea()
            PlantDetail_Top(jenisTanaman: jenisTanaman)
        }
        .navigationBarTitle("\(jenisTanaman)")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct PlantDetailPage_Preview: PreviewProvider {
    static var previews: some View {
        PlantDetailPage()
    }
}
/* JANGAN LUPA KASIH WARNA FONT SUHU */
struct PlantDetail_Top: View {
    @State var valueCircle: CGFloat = 100
    var jenisTanaman: String = ""
    
    var body: some View {
        ZStack {
            VStack (alignment: .leading){
                /* GAMBAR DAN STATUS TANAMAN */
                HStack (spacing: 0) {
                    Image("iconBayam")
                        .resizable()
                        .frame(width: 164, height: 164)
                        .padding(.leading, 20)
                        .padding(.trailing, 10)
                    VStack (alignment: .leading){
                        
                        /* SUHU */
                        HStack(spacing: 15){
                            CircularProgressBar(percentage: $valueCircle, circularProgressBarStyle: .suhu, amount: 60, isCardView: true, diameter: 30)
                            VStack (alignment: .leading){
                                Text("Suhu")
                                    .font(.custom("Lato", size: 12))
                                    .foregroundColor(Warna.Gray3)
                                Text("37C")
                                    .font(.custom("Lato", size: 14))
                            }
                        }
                        
                        /* SINAR MATAHARI*/
                        HStack(spacing: 15){
                            CircularProgressBar(percentage: $valueCircle, circularProgressBarStyle: .sinar, amount: 60, isCardView: true, diameter: 30)
                            VStack (alignment: .leading){
                                Text("Sinar Matahari")
                                    .font(.custom("Lato", size: 12))
                                    .foregroundColor(Warna.Gray3)
                                Text("370 Lumens")
                                    .font(.custom("Lato", size: 14))
                            }
                        }
                        
                        /* KELEMBABAN TANAH */
                        HStack(spacing: 15){
                            CircularProgressBar(percentage: $valueCircle, circularProgressBarStyle: .tanah, amount: 60, isCardView: true, diameter: 30)
                            VStack (alignment: .leading){
                                Text("Kelembaban Tanah")
                                    .font(.custom("Lato", size: 12))
                                    .foregroundColor(Warna.Gray3)
                                Text("10%")
                                    .font(.custom("Lato", size: 14))
                            }
                        }
                        
                        /* KELEMBABAN UDARA */
                        HStack(spacing: 15){
                            CircularProgressBar(percentage: $valueCircle, circularProgressBarStyle: .udara, amount: 60, isCardView: true, diameter: 30)
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
                
                NavigationLink(destination: SetupDevice(passItem: jenisTanaman)) {
                    Text("Tambah Tanaman")
                        .frame(maxWidth: .infinity ,maxHeight: 50)
                        .foregroundColor(Color.white)
                        .font(.system(size: 20 ,weight: .regular))
                        .background(RoundedRectangle(cornerRadius: 10)
                                        .fill(Warna.Secondary))
                        .padding(.horizontal, 20)
                }
            }
        }
    }
}
