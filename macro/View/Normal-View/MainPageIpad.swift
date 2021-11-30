//
//  MainPageIpad.swift
//  macro
//
//  Created by Vincent on 30/11/21.
//

import SwiftUI
import CoreData

struct MainPageIpad: View {
    @StateObject var firebaseHelper: firebaseHelper
    @Binding var plantStatus: StatusTanaman
    var weatherAPI = WeatherAPI()
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(
        entity: DeviceData.entity(),
        sortDescriptors: [
            //NSSortDescriptor(keyPath: \DeviceData.tanggalMenanam, ascending: true)
        ]
    )var dataFatched: FetchedResults<DeviceData>
    
    let column = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        NavigationView{
            ZStack{
                if(dataFatched.count == 0){
                    VStack(){
                        Image("maskot_brown")
                            .resizable()
                            .frame(width: 125, height: 125)
                        Text("Belum Ada Perangkat")
                            .foregroundColor(Warna.Gray3)
                    }.offset(y:-50)
                }else{
                    ScrollView{
                        LazyVGrid(columns: column){
                            ForEach(dataFatched){i in
                                let deviceData = i
                                CardDeviceIpad(statusTanaman: $plantStatus,deviceData: deviceData)
                                    .padding(16)
                            }
                        }
                        .padding(.horizontal, 52)
                    }
                }//.animation(nil)
                
                VStack{
                    Spacer()
                    NavigationLink(destination: ChoosePlantPage()) {
                        Text("Tambah Perangkat")
                            .frame(maxWidth: .infinity ,maxHeight: 50)
                            .foregroundColor(.white)
                            .font(.system(size: 20 ,weight: .regular))
                            .background(RoundedRectangle(cornerRadius: 10)
                                            .fill(Warna.Secondary)
                            .padding(.horizontal, 20))
                            .animation(nil)
                    }
                }
            }
            .navigationTitle("Semua Perangkat")
            .onChange(of: plantStatus.suhu, perform: { newValue in
                print(newValue)
            })
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .accentColor(Warna.Secondary)
    }
}
