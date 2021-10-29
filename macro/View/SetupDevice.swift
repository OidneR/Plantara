//
//  SetupDevice.swift
//  macro
//
//  Created by Michael Tanakoman on 29/10/21.
//

import SwiftUI

struct SetupDevice: View {
    @State var deviceName: String = ""
    @State var lokasiTanaman: String = ""
    @State var selectedDate = Date()
    
    var body: some View {
        NavigationView{
            Form{
                Section(){
                    HStack{
                        Text("Nama Perangkat")
                        TextField("Device Bayam", text: $deviceName)
                            .multilineTextAlignment(.trailing)
                    }
                    
                    HStack{
                        Text("Tanaman")
                        NavigationLink(destination: DeviceSettings(), label: {
                                Spacer()
                                Text("Bayam Hijau")
                        })
                    }
                }
                
                Section(){
                    HStack{
                        Text("Lokasi Tanaman")
                        TextField("Taman", text: $lokasiTanaman)
                            .multilineTextAlignment(.trailing)
                    }
                    
                    if #available(iOS 15, *) {
                        DatePicker("Tanggal Menanam", selection: $selectedDate, in: Date.distantPast...Date.now, displayedComponents: .date)
                    } else {
                        // Fallback on earlier versions
                    }
                }
            }
            
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarTitle("Setup Device")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        print("ini selesai")
                    } label: {
                        Text("Selesai")
                    }.foregroundColor(Color.blue)
                }
            }
        }
    }
}

struct SetupDevice_Previews: PreviewProvider {
    static var previews: some View {
        SetupDevice()
    }
}
