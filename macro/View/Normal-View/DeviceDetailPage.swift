//
//  DeviceDetailPage.swift
//  macro
//
//  Created by Michelle Aurelia on 28/10/21.
//

import SwiftUI

struct DeviceDetailPage: View {

    @Binding var dataDevice: DeviceData
    @State var valueAnimation = true
    @Binding var statusTanaman: StatusTanaman
    @State var dataTanaman: TanamanBaru = PlantType.bayam.dataTanaman
    @StateObject var viewModel = DeviceDetailPageViewModel()
    
    init(dataDevice: Binding<DeviceData>, statusTanaman: Binding<StatusTanaman>){
        self._dataDevice = dataDevice
        self._statusTanaman = statusTanaman
        self._dataTanaman = State(initialValue: PlantType(rawValue: dataDevice.namaTanaman.wrappedValue ?? "Bayam")!.dataTanaman)
        
    }
    
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
                            CircularProgressBar(percentage: $viewModel.percentageProgressBarSuhu, circularProgressBarStyle: .suhu, amount: $viewModel.valueProgressBarSuhu, isCardView: false, diameter: 100)
                                .frame(maxWidth: 100, maxHeight: 100)
                                .padding(.trailing, 10)
                                .onAppear {
                                    withAnimation(.easeIn(duration: 2)){
                                        viewModel.valueProgressBarSuhu = statusTanaman.suhu
                                        valueAnimation = false
                                    }
                                }
                                .onChange(of: statusTanaman.suhu) { newValue in
                                    withAnimation(.easeIn(duration: 2)){
                                        viewModel.valueProgressBarSuhu = newValue
                                    }
                                }
                            
                            VStack (alignment: .leading) {
                                Text("Suhu")
                                    .bold()
                                Text("Ideal:"+String(format: "%0.2f°C - %0.2f°C", dataTanaman.minSuhu, dataTanaman.maxSuhu))
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
                            CircularProgressBar(percentage: $viewModel.percentageProgressBarSinar, circularProgressBarStyle: .sinar, amount: $viewModel.valueProgressBarSinar, isCardView: false, diameter: 100)
                                .frame(width: 100, height: 100)
                                .padding(.trailing, 10)
                                .onAppear {
                                    withAnimation(.easeIn(duration: 2)){
                                        viewModel.valueProgressBarSinar = statusTanaman.sinarMatahari
                                        valueAnimation = false
                                    }
                                }
                                .onChange(of: statusTanaman.sinarMatahari) { newValue in
                                    withAnimation(.easeIn(duration: 2)){
                                        viewModel.valueProgressBarSinar = newValue
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
                            CircularProgressBar(percentage: $viewModel.percentageProgressBarTanah, circularProgressBarStyle: .tanah, amount: $viewModel.valueProgressBarTanah, isCardView: false, diameter: 100)
                                .frame(width: 100, height: 100)
                                .padding(.trailing, 10)
                                .onAppear {
                                    withAnimation(.easeIn(duration: 2)){
                                        viewModel.valueProgressBarTanah = statusTanaman.kelembabanTanah
                                    }
                                }
                                .onChange(of: statusTanaman.kelembabanTanah) { newValue in
                                    withAnimation(.easeIn(duration: 2)){
                                        viewModel.valueProgressBarTanah = newValue
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
                            CircularProgressBar(percentage: $viewModel.percentageProgressBarUdara, circularProgressBarStyle: .udara, amount: $viewModel.valueProgressBarUdara, isCardView: false, diameter: 100)
                                .frame(width: 100, height: 100)
                                .padding(.trailing, 10)
                                .onAppear {
                                    withAnimation(.easeIn(duration: 2)){
                                        viewModel.valueProgressBarUdara = statusTanaman.kelembabanUdara
                                    }
                                }
                                .onChange(of: statusTanaman.kelembabanUdara) { newValue in
                                    withAnimation(.easeIn(duration: 2)){
                                        viewModel.valueProgressBarUdara = newValue
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
        .onAppear(){
            viewModel.valueProgressBarSuhu = statusTanaman.suhu
            viewModel.valueProgressBarSinar = statusTanaman.sinarMatahari
            viewModel.valueProgressBarTanah = statusTanaman.kelembabanTanah
            viewModel.valueProgressBarUdara = statusTanaman.kelembabanUdara
            viewModel.getPlantConditionPersentage()
        }
        .navigationBarTitle("Device Name")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink(destination: DeviceSettings(dataDevice: $dataDevice)) {
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
