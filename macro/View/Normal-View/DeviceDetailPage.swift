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
        let dataTanaman = PlantType(rawValue: dataDevice.namaTanaman ?? "")?.getsDataTanaman(with: dataDevice.namaTanaman ?? "")
        let dataKebutuhanTanaman = KebutuhanTanamanViewModel().getKebutuhanTanaman(jenisTanaman: dataDevice.namaTanaman ?? "")
        
        VStack (alignment: .center) {
            
            Image("icon\(dataDevice.namaTanaman ?? "")")
                .resizable()
                .frame(maxWidth: 194, maxHeight: 194)
                .background(Color("BackgroundCardPlant"))
                .animation(nil, value: valueAnimation)
            
            VStack(alignment: .leading){
                HStack{
                    Text(dataDevice.namaTanaman ?? "")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.leading, 24)
                        .padding(.top, 24)
                        .animation(nil, value: valueAnimation)
                    
                    Spacer()
                    
                    NavigationLink(destination: PlantDetailPage(jenisTanaman: dataDevice.namaTanaman ?? "")){
                        Text("Detail Perangkat")
                            .font(.system(size: 20))
                            .foregroundColor(Warna.Secondary)
                            .font(.title)
                            .padding(.horizontal, 24)
                            .padding(.top, 24)
                            .animation(nil, value: valueAnimation)
                    }
                    
                }
                
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
                                        viewModel.percentageProgressBarSuhu = newValue
                                    }
                                }
                            
                            VStack (alignment: .leading) {
                                Text("Suhu")
                                    .bold()
                                Text("Ideal:\(dataKebutuhanTanaman.kebutuhanSuhu)")
                                HStack {
                                    if statusTanaman.suhu < dataTanaman?.minSuhu ?? 0 || statusTanaman.suhu > dataTanaman?.maxSuhu ?? 0{
                                        Image(systemName: "exclamationmark.circle")
                                            .foregroundColor(Color.red)
                                        Text("Pindahkan tanaman di tempat dengan suhu yang sesuai")
                                            .foregroundColor(Warna.TextWarning)
                                            .font(.system(size: 14))
                                            .padding(.trailing, 20)
                                    }else{
                                        Text("Normal")
                                            .foregroundColor(Warna.TextSafe)
                                            .font(.system(size: 14))
                                            .padding(.trailing, 20)
                                    }
                                }
                                .foregroundColor(Color.red)
                            }
                            
                        }.padding(.top, 20)
                        
                        
                        HStack {
                            CircularProgressBar(percentage: $viewModel.valueProgressBarSinar, circularProgressBarStyle: .sinar, amount: $viewModel.valueProgressBarSinar, isCardView: false, diameter: 100)
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
                                Text("Ideal: \(dataKebutuhanTanaman.kebutuhanSun)")
                                HStack {
                                    if statusTanaman.sinarMatahari < dataTanaman?.minSun ?? 0 || statusTanaman.sinarMatahari > dataTanaman?.maxSun ?? 0{
                                        Image(systemName: "exclamationmark.circle")
                                            .foregroundColor(Color.red)
                                        
                                        Text("Pindahkan tanaman agar mendapatkan cahaya matahari yang sesuai")
                                            .foregroundColor(Warna.TextWarning)
                                            .font(.system(size: 14))
                                            .padding(.trailing, 20)
                                    }else{
                                        Text("Normal")
                                            .foregroundColor(Warna.TextSafe)
                                            .font(.system(size: 14))
                                            .padding(.trailing, 20)
                                    }
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
                                        viewModel.percentageProgressBarTanah = newValue
                                    }
                                }
                            
                            VStack (alignment: .leading) {
                                Text("Kelembapan Tanah")
                                    .bold()
                                Text("Ideal: \(dataKebutuhanTanaman.kebutuhanTanah)")
                                HStack {
                                    if statusTanaman.kelembabanTanah < dataTanaman?.minKelembabanTanah ?? 0 || statusTanaman.kelembabanTanah > dataTanaman?.maxKelembabanTanah ?? 0{
                                        
                                        Image(systemName: "exclamationmark.circle")
                                            .foregroundColor(Color.red)
                                        
                                        Text("Kelembaban tanah kurang ideal")
                                            .foregroundColor(Warna.TextWarning)
                                            .font(.system(size: 14))
                                            .padding(.trailing, 20)
                                    }else{
                                        Text("Normal")
                                            .foregroundColor(Warna.TextSafe)
                                            .font(.system(size: 14))
                                            .padding(.trailing, 20)
                                    }
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
                                        viewModel.percentageProgressBarUdara = newValue
                                    }
                                }
                            
                            VStack (alignment: .leading) {
                                Text("Kelembapan Udara")
                                    .bold()
                                Text("Ideal: \(dataKebutuhanTanaman.kebutuhanUdara)")
                                HStack {
                                    if statusTanaman.kelembabanUdara < dataTanaman?.minKelembabanUdara ?? 0 || statusTanaman.kelembabanUdara > dataTanaman?.maxKelembabanUdara ?? 0{
                                        
                                        Image(systemName: "exclamationmark.circle")
                                            .foregroundColor(Color.red)
                                        
                                        Text("Pindahkan tanaman pada tempat dengan kelembaban udara yang ideal")
                                            .foregroundColor(Warna.TextWarning)
                                            .font(.system(size: 14))
                                            .padding(.trailing, 20)
                                    }else{
                                        Text("Normal")
                                            .foregroundColor(Warna.TextSafe)
                                            .font(.system(size: 14))
                                            .padding(.trailing, 20)
                                    }
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
        .navigationBarTitle(dataDevice.namaDevice ?? "")
        .onAppear(){
            viewModel.valueProgressBarSuhu = statusTanaman.suhu
            viewModel.valueProgressBarSinar = statusTanaman.sinarMatahari
            viewModel.valueProgressBarTanah = statusTanaman.kelembabanTanah
            viewModel.valueProgressBarUdara = statusTanaman.kelembabanUdara
            viewModel.getPlantConditionPersentage()
        }
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
