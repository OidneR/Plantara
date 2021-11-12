//
//  DeviceDetail.swift
//  macro
//
//  Created by Michael Tanakoman on 09/11/21.
//

import SwiftUI

struct DeviceDetail: View {
    @State var valueProgressBar: CGFloat = 80
    
    @State var showPengaturan: Bool = false
    
    @ObservedObject var keyboardHeightHelper = KeyboardHeightHelper()
    @State var listHeight: CGFloat = 656
    
    init(){
        listHeight = 656 - keyboardHeightHelper.keyboardHeight
    }
    
    var body: some View {
        NavigationView{
            ZStack{
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
                                        .padding(.top, 90)
                                    
                                    Spacer()
                                    
                                    Text("Lihat Detail")
                                        .font(.system(size: 18))
                                        .foregroundColor(Warna.Secondary)
                                        .padding(.trailing, 30)
                                        .padding(.top, 90)
                                }
                                
                                HStack (spacing: 40){
                                    VStack{
                                        CircularProgressBar(percentage: $valueProgressBar, circularProgressBarStyle: .suhu, amount: 40, isCardView: true, diameter: 100)
                                        ReusableDescriptionProgressBar(titleProgressBar: "Suhu", normalProgressBar: "22C", statusTanaman: "Status Tanaman", warnaStatus: Warna.TextSafe)
                                    }
                                    
                                    VStack{
                                        CircularProgressBar(percentage: $valueProgressBar, circularProgressBarStyle: .tanah, amount: 40, isCardView: true, diameter: 100)
                                        ReusableDescriptionProgressBar(titleProgressBar: "Kelembapan Tanah", normalProgressBar: "200 RH", statusTanaman: "Status Tanaman", warnaStatus: Warna.TextSafe)
                                    }
                                    
                                    VStack{
                                        CircularProgressBar(percentage: $valueProgressBar, circularProgressBarStyle: .sinar, amount: 40, isCardView: true, diameter: 100)
                                        ReusableDescriptionProgressBar(titleProgressBar: "Sinar Matahari", normalProgressBar: "370 Lumens", statusTanaman: "Status Tanaman", warnaStatus: Warna.TextWarning)
                                    }
                                    
                                    VStack{
                                        CircularProgressBar(percentage: $valueProgressBar, circularProgressBarStyle: .udara, amount: 40, isCardView: true, diameter: 100)
                                        ReusableDescriptionProgressBar(titleProgressBar: "Kelembapan Udara", normalProgressBar: "200 RH", statusTanaman: "Status Tanaman", warnaStatus: Warna.TextWarning)
                                    }
                                }
                                .padding(.top, 40)
                                .padding(.bottom, 70)
                            }
                        })
                        .onChange(of: keyboardHeightHelper.keyboardHeight, perform: { newValue in
                            listHeight = 656 - newValue
                        })
                        .navigationBarTitleDisplayMode(.inline)
                        .navigationTitle("Device Detail")
                        .toolbar {
                            ToolbarItem(placement: .navigationBarTrailing) {
                                HStack{
                                    Button("Pengaturan"){
                                        showPengaturan.toggle()
                                    }
                                    .popover(isPresented: $showPengaturan){
                                        ZStack{
                                            PengaturanDeviceDetail(height: $listHeight)
                                        }
//                                        .frame(width: 375, height: 656 + self.keyboardHeightHelper.keyboardHeight)
                                    }
                                }
                            }
                        }
                    
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Warna.primary)
            }
            .ignoresSafeArea(edgesIgnoringSafeArea(.bottom) as! SafeAreaRegions)
        }
        .navigationViewStyle(StackNavigationViewStyle())
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

struct DeviceDetail_Previews: PreviewProvider {
    static var previews: some View {
        DeviceDetail()
            .previewInterfaceOrientation(.landscapeRight)
    }
}

struct PengaturanDeviceDetail: View{
    
    @State var pengaturanNamaPerangkat: String = ""
    @State var pengaturanNamaTanaman: String = ""
    @State var pengaturanLokasiTanaman: String = ""
    
    @State var pengaturanTanggalMenanam = Date()
    
    @State var pengaturanAllNotif: Bool = true
    @State var pengaturanSuhuNotif: Bool = true
    @State var pengaturanMatahariNotif: Bool = true
    @State var pengaturanUdaraNotif: Bool = true
    @State var pengaturanTanahNotif: Bool = true
    
    @Binding var height: CGFloat
    
    var body: some View{
        Form{
            Section{
                HStack{
                    TextField("Nama Perangkat",text: $pengaturanNamaPerangkat)
                }
                HStack{
                    TextField("Bayam Hijau",text: $pengaturanNamaTanaman)
                }
            }
            
            Section{
                HStack{
                    TextField("Lokasi Tanaman", text: $pengaturanLokasiTanaman)
                }
                DatePicker("Tanggal Menanam", selection: $pengaturanTanggalMenanam, displayedComponents: .date)
            }
            
            Section(){
                Toggle("Izinkan Notifikasi", isOn: $pengaturanAllNotif.animation(.easeInOut(duration: 2)))
            }
            
            if pengaturanAllNotif{
                Section(){
                    Toggle(isOn: $pengaturanSuhuNotif.animation()) {
                        Text("Suhu")
                    }
                    Toggle(isOn: $pengaturanMatahariNotif.animation()) {
                        Text("Sinar Matahari")
                    }
                    Toggle(isOn: $pengaturanTanahNotif.animation()) {
                        Text("Kelembaban Tanah")
                    }
                    Toggle(isOn: $pengaturanUdaraNotif.animation()) {
                        Text("Kelembaban Udara")
                    }
                }
            }
            
            Section{
                Button("Hapus Perangkat"){
                    
                }.foregroundColor(.red)
            }
        }
        .frame(width: 375, height: height)
    }
}

//struct PengaturanDeviceDetail_Previews: PreviewProvider {
//    static var previews: some View {
//        PengaturanDeviceDetail()
//            .previewInterfaceOrientation(.landscapeLeft)
//    }
//}
