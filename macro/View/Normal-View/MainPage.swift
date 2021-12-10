//
//  MainPage.swift
//  LearnSwiftUI
//
//  Created by Michael Tanakoman on 28/10/21.
//

import SwiftUI
import CoreData
import FirebaseMessaging
import Firebase
import FirebaseAnalytics

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
    
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    var sendNotif = PushNotificationSender()
    
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
                        LazyVStack(spacing: 0){
                            ForEach(dataFatched){i in
                                let deviceData = i
                                CardDevice(statusTanaman: $plantStatus,deviceData: deviceData)
                                    .padding(16)
                            }
                        }
                    }
                }//.animation(nil)
                
                VStack{
                    Spacer()
                    if UIDevice.current.userInterfaceIdiom == .pad{
                        NavigationLink(destination: ChoosePlantIpad()) {
                            Text("Tambah Perangkat")
                                .frame(maxWidth: .infinity ,maxHeight: 50)
                                .foregroundColor(.white)
                                .font(.system(size: 20 ,weight: .regular))
                                .background(RoundedRectangle(cornerRadius: 10)
                                                .fill(Warna.Secondary)
                                .padding(.horizontal, 20))
                                .animation(nil)
                            }
                        } else{
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
            }
            .navigationTitle("Semua Perangkat")
            .onChange(of: plantStatus.kelembabanTanah, perform: { newValue in
                print(newValue)
                if newValue < 20{
                    sendNotif.sendPushNotification(title: "Kelembaban Tanah Menurun!", body: "Segera siram tanaman Anda sebelum tanaman Anda layu")
                }else if newValue > 80{
                    sendNotif.sendPushNotification(title: "Kelembaban Tanah Kembali Normal!", body: "Kerja bagus! Terus rawat tanaman Anda!")
                }
            })
        }
        .onAppear{
            Messaging.messaging().subscribe(toTopic: "weather") { error in
              print("Subscribed to weather topic")
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .accentColor(Warna.Secondary)
    }
}
