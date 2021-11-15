//
//  DeviceDetailPage.swift
//  macro
//
//  Created by Michelle Aurelia on 28/10/21.
//

import SwiftUI

struct DeviceDetailPage: View {
    @State var valueProgressBarSinar: Double = 0
    @State var valueProgressBarSuhu: Double = 0
    @State var valueProgressBarUdara: Double = 0
    @State var valueProgressBarTanah: Double = 0
    
    @State var valueAnimation = true
    @Binding var statusTanaman: StatusTanaman
    
    var body: some View {
        VStack (alignment: .leading) {
            
            Image("biji")
                .frame(maxWidth: .infinity, maxHeight: 194)
                .background(Color("BackgroundCardPlant"))
                .animation(nil, value: valueAnimation)
            
            VStack(alignment: .leading){
                Text("Bayam Hijau")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.leading, 24)
                    .padding(.top, 24)
                    .animation(nil, value: valueAnimation)
                
                ScrollView (showsIndicators: false){
                    VStack (alignment: .leading){
                        HStack {
                            CircularProgressBar(percentage: $statusTanaman.suhu, circularProgressBarStyle: .suhu, amount: 40, isCardView: false, diameter: 100)
                                .frame(maxWidth: 100, maxHeight: 100)
                                .padding(.trailing, 10)
                                .onAppear {
                                    withAnimation(.easeIn(duration: 2)){
                                        valueProgressBarSuhu = statusTanaman.suhu
                                        valueAnimation = false
                                    }
                                }
                            
                            
                            VStack (alignment: .leading) {
                                Text("Suhu")
                                    .bold()
                                Text("Ideal: 20 C")
                                HStack {
                                    Image(systemName: "exclamationmark.circle")
                                        .foregroundColor(Color.red)
                                    Text("Please keep watering your plant everyday")
                                        .foregroundColor(Color.red)
                                        .font(.system(size: 14))
                                        .padding(.trailing, 20)
                                }
                                
                                .foregroundColor(Color.red)
                            }
                            
                        }.padding(.top, 20)
                        
                        
                        HStack {
                            CircularProgressBar(percentage: $valueProgressBarSinar, circularProgressBarStyle: .sinar, amount: 40, isCardView: false, diameter: 100)
                                .frame(width: 100, height: 100)
                                .padding(.trailing, 10)
                                .onAppear {
                                    withAnimation(.easeIn(duration: 2)){
                                        valueProgressBarSinar = 80
                                    }
                                }
                            
                            VStack (alignment: .leading) {
                                Text("Sinar Matahari")
                                    .bold()
                                Text("Ideal: 1200Lx")
                                HStack {
                                    Image(systemName: "exclamationmark.circle")
                                        .foregroundColor(Color.red)
                                    Text("Your plant isn't in the right place")
                                        .foregroundColor(Color.red)
                                        .font(.system(size: 14))
                                        .padding(.trailing, 20)
                                }
                            }
                            
                        }.padding(.top, 20)
                        
                        
                        HStack {
                            CircularProgressBar(percentage: $statusTanaman.kelembabanTanah, circularProgressBarStyle: .tanah, amount: 40, isCardView: false, diameter: 100)
                                .frame(width: 100, height: 100)
                                .padding(.trailing, 10)
                                .onAppear {
                                    withAnimation(.easeIn(duration: 2)){
                                        valueProgressBarTanah = statusTanaman.kelembabanTanah
                                    }
                                }
                            
                            VStack (alignment: .leading) {
                                Text("Kelembapan Tanah")
                                    .bold()
                                Text("Ideal: 200 RH")
                                HStack {
                                    Image(systemName: "exclamationmark.circle")
                                        .foregroundColor(Color.red)
                                    Text("Please move your plant")
                                        .foregroundColor(Color.red)
                                        .font(.system(size: 14))
                                        .padding(.trailing, 20)
                                }
                            }
                        }.padding(.top, 20)
                        
                        HStack {
                            CircularProgressBar(percentage: $statusTanaman.kelembabanUdara, circularProgressBarStyle: .udara, amount: 40, isCardView: false, diameter: 100)
                                .frame(width: 100, height: 100)
                                .padding(.trailing, 10)
                                .onAppear {
                                    withAnimation(.easeIn(duration: 2)){
                                        valueProgressBarUdara = statusTanaman.kelembabanUdara
                                    }
                                }
                            
                            VStack (alignment: .leading) {
                                Text("Kelembapan Udara")
                                    .bold()
                                Text("Ideal: 200 RH")
                                HStack {
                                    Image(systemName: "exclamationmark.circle")
                                        .foregroundColor(Color.red)
                                    Text("Your plant isn't in the right place")
                                        .foregroundColor(Color.red)
                                        .font(.system(size: 14))
                                        .padding(.trailing, 20)
                                }
                                .foregroundColor(Color.red)
                            }
                        }.padding(.top, 20)
                    }
                    .padding(.leading, 30)
                }
            }
            .frame(maxWidth: .infinity)
            .background(RoundedRectangle(cornerRadius: 30)
                            .fill(Color.white)
                            .ignoresSafeArea()
                            .animation(nil, value: valueAnimation)
            )
        }
        .background(RoundedRectangle(cornerRadius: 0)
                        .fill(Warna.primary)
                        .ignoresSafeArea()
        )
        .navigationBarTitle("Device Name")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink(destination: DeviceSettings()) {
                    Text("Pengaturan")
                        .foregroundColor(Warna.Secondary)
                }
            }
        }
    }
}

//struct DeviceDetailPage_Previews:PreviewProvider {
//    static var previews: some View {
//        DeviceDetailPage()
//    }
//}
