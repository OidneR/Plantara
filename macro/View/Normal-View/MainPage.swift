//
//  MainPage.swift
//  LearnSwiftUI
//
//  Created by Michael Tanakoman on 28/10/21.
//

import SwiftUI
import CoreData

struct MainPage: View {
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
    
    
   
    var body: some View {
        NavigationView{
            ZStack{
                ScrollView{
                    if(dataFatched.count == 0){
                        Text("nil")
                    }else{
                        LazyVStack{
                            ForEach(dataFatched){_ in
                                CardDevice(statusTanaman: $plantStatus)
                            }
                        }
                        
                    }
                    
                }
                .animation(nil)
                
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
        .accentColor(Warna.Secondary)
    }
}
