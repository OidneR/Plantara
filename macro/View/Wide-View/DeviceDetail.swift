//
//  DeviceDetail.swift
//  macro
//
//  Created by Michael Tanakoman on 09/11/21.
//

import SwiftUI

struct DeviceDetail: View {
    @State var valueProgressBar: Double = 80
    
    var body: some View {
        VStack{
            HStack{
                Image(systemName: "plus.square.fill")
                    .font(.system(size: 400))
                    .frame(width: 400, height: 400)
            }
            .frame(maxWidth: .infinity,maxHeight: .infinity)
            .padding(.top, 20)

            Spacer()
            
            RoundedRectangle(cornerRadius: 30)
                .fill(Color.white)
                .ignoresSafeArea()
                .overlay(content: {
                    VStack{
                        HStack{
                            Text("Nama Tanaman")
                                .font(.system(size: 26))
                                .bold()
                                .padding(.leading, 30)
                                .padding(.top, 30)
                            
                            Spacer()
                            
                            Text("Lihat Detail")
                                .font(.system(size: 18))
                                .foregroundColor(Warna.Secondary)
                                .padding(.trailing, 30)
                                .padding(.top, 30)
                        }
                        
                        HStack (spacing: 100){
                            VStack{
                                CircularProgressBar(percentage: $valueProgressBar, circularProgressBarStyle: .suhu, amount: $valueProgressBar, isCardView: true, diameter: 100)
                                ReusableDescriptionProgressBar(titleProgressBar: "Suhu", normalProgressBar: "22C", statusTanaman: "Status Tanaman", warnaStatus: Warna.TextSafe)
                            }
                            
                            VStack{
                                CircularProgressBar(percentage: $valueProgressBar, circularProgressBarStyle: .tanah, amount: $valueProgressBar, isCardView: true, diameter: 100)
                                ReusableDescriptionProgressBar(titleProgressBar: "Kelembapan Tanah", normalProgressBar: "200 RH", statusTanaman: "Status Tanaman", warnaStatus: Warna.TextSafe)
                            }
                            
                            VStack{
                                CircularProgressBar(percentage: $valueProgressBar, circularProgressBarStyle: .sinar, amount: $valueProgressBar, isCardView: true, diameter: 100)
                                ReusableDescriptionProgressBar(titleProgressBar: "Sinar Matahari", normalProgressBar: "370 Lumens", statusTanaman: "Status Tanaman", warnaStatus: Warna.TextWarning)
                            }
                            
                            VStack{
                                CircularProgressBar(percentage: $valueProgressBar, circularProgressBarStyle: .udara, amount: $valueProgressBar, isCardView: true, diameter: 100)
                                ReusableDescriptionProgressBar(titleProgressBar: "Kelembapan Udara", normalProgressBar: "200 RH", statusTanaman: "Status Tanaman", warnaStatus: Warna.TextWarning)
                            }
                        }
                        .padding(.top, 50)
                        .padding(.bottom, 70)
                    }
                    .ignoresSafeArea()
                })
            
            .navigationTitle("Device Detail")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack{
                        Button("Pengaturan"){
                            print("oke de")
                        }
                    }
                }
            }
        }
        
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Warna.primary)
    }
}

struct ReusableDescriptionProgressBar: View{
    var titleProgressBar: String
    var normalProgressBar: String
    var statusTanaman: String
    var warnaStatus: Color
    
    var body: some View{
        HStack{
            VStack{
                Text(titleProgressBar)
                    .font(.system(size: 18))
                    .bold()
                    .padding(.top, 20)
                
                Text("Normal: \(normalProgressBar)")
                    .font(.system(size: 18))
                
                Text(statusTanaman)
                    .font(.system(size: 18))
                    .foregroundColor(warnaStatus)
            }
        }
    }
}

//struct DeviceDetail_Previews: PreviewProvider {
//    static var previews: some View {
//        DeviceDetail()
//.previewInterfaceOrientation(.landscapeLeft)
//    }
//}
