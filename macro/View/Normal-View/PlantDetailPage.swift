//
//  PlantDetailPage.swift
//  macro
//
//  Created by Michelle Aurelia on 02/11/21.
//
import SwiftUI

struct PlantDetailPage: View {
    var jenisTanaman: String = ""
    var detailDevice: Bool = false
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color("PrimaryColor"))
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea()
            PlantDetail_Top(jenisTanaman: jenisTanaman, detailDevice: detailDevice)
        }
        .navigationBarTitle("\(jenisTanaman)")
        .navigationBarTitleDisplayMode(.inline)
    }
}

/* JANGAN LUPA KASIH WARNA FONT SUHU */
struct PlantDetail_Top: View {
    @State var valueCircle: Double = 100
    @State var valueProgressBar: Double = 60
    @State var valueAnimasi = false
    var jenisTanaman: String = ""
    var detailDevice: Bool?
    
    var body: some View {
        let dataTanaman = PlantType(rawValue: jenisTanaman)?.getDataTanaman()
        let dataKebutuhanTanaman = KebutuhanTanamanViewModel().getKebutuhanTanaman(jenisTanaman: jenisTanaman)
        
        VStack (alignment: .leading){
            /* GAMBAR DAN STATUS TANAMAN */
            HStack (spacing: 0) {
                Image(dataTanaman?.imageTanaman ?? "")
                    .resizable()
                    .frame(width: 164, height: 164)
                    .padding(.leading, 20)
                    .padding(.trailing, 10)
                    .onAppear {
                        withAnimation(.easeIn(duration: 2)){
                            valueAnimasi = true
                        }
                    }
                    .animation(nil, value: valueAnimasi)
                VStack (alignment: .leading){
                    
                    /* SUHU */
                    HStack(spacing: 15){
                        CircularProgressBar(percentage: $valueCircle, circularProgressBarStyle: .suhu, amount: $valueProgressBar, isCardView: true, diameter: 30)
                        VStack (alignment: .leading){
                            Text("Suhu")
                                .font(.custom("Lato", size: 12))
                                .foregroundColor(Warna.Gray3)
                            Text(dataKebutuhanTanaman.kebutuhanSuhu)
                                .font(.custom("Lato", size: 14))
                        }
                    }
                    
                    /* SINAR MATAHARI*/
                    HStack(spacing: 15){
                        CircularProgressBar(percentage: $valueCircle, circularProgressBarStyle: .sinar, amount: $valueProgressBar, isCardView: true, diameter: 30)
                        VStack (alignment: .leading){
                            Text("Sinar Matahari")
                                .font(.custom("Lato", size: 12))
                                .foregroundColor(Warna.Gray3)
                            Text(dataKebutuhanTanaman.kebutuhanSun)
                                .font(.custom("Lato", size: 14))
                        }
                    }
                    
                    /* KELEMBABAN TANAH */
                    HStack(spacing: 15){
                        CircularProgressBar(percentage: $valueCircle, circularProgressBarStyle: .tanah, amount: $valueProgressBar, isCardView: true, diameter: 30)
                        VStack (alignment: .leading){
                            Text("Kelembaban Tanah")
                                .font(.custom("Lato", size: 12))
                                .foregroundColor(Warna.Gray3)
                            Text(dataKebutuhanTanaman.kebutuhanTanah)
                                .font(.custom("Lato", size: 14))
                        }
                    }
                    
                    /* KELEMBABAN UDARA */
                    HStack(spacing: 15){
                        CircularProgressBar(percentage: $valueCircle, circularProgressBarStyle: .udara, amount: $valueProgressBar, isCardView: true, diameter: 30)
                        VStack (alignment: .leading){
                            Text("Kelembaban Udara")
                                .font(.custom("Lato", size: 12))
                                .foregroundColor(Warna.Gray3)
                            Text(dataKebutuhanTanaman.kebutuhanUdara)
                                .font(.custom("Lato", size: 14))
                        }
                    }
                }
                .padding(.trailing, 10)
                .animation(nil, value: valueAnimasi)
            }
            
            /* DESKRIPSI, PANDUAN PERAWATAN, DAN TIPS */
            Spacer().frame(height: 24)
            
            VStack{
                ScrollView {
                    VStack (alignment: .leading){
                        
                        /* DESKRIPSI */
                        Text("Deskripsi")
                            .font(.custom("Lato", size: 24))
                            .padding(.horizontal, 20)
                            .padding(.top, 32)
                            .padding(.bottom, 8)
                        Text(dataTanaman?.desc ?? "")
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
                }
                
                Spacer()
                
                if detailDevice == false{
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
            .background(RoundedRectangle(cornerRadius: 25)
                            .fill(Color.white)
                            .ignoresSafeArea())
            .animation(nil, value: valueAnimasi)
        }
    }
}

//struct PlantDetailPage_Preview: PreviewProvider {
//    static var previews: some View {
//        PlantDetailPage()
//    }
//}
