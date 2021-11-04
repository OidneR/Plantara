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
    let passItem: String
    
    var body: some View {
        VStack{
            Form{
                Section(){
                    HStack{
                        Text("Nama Perangkat")
                        TextField("Device \(passItem)", text: $deviceName)
                            .multilineTextAlignment(.trailing)
                    }
                    
                    HStack{
                        Text("Tanaman")
                        Spacer()
                        Text(passItem)
                    }
                }
                
                Section(){
                    HStack{
                        Text("Lokasi Tanaman")
                        TextField("Your Location", text: $lokasiTanaman)
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
            .navigationBarTitle("Pengaturan Perangkat")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        
                    } label: {
                        Text("Selesai")
                    }
                    .foregroundColor(toolbarButtonColor)
                    .disabled(self.deviceName.isEmpty || self.lokasiTanaman.isEmpty)
                }
            }
        }
    }
    
    var deviceNameValid: Bool{
        return !deviceName.isEmpty
    }
    
    var lokasiTanamanValid: Bool{
        return !lokasiTanaman.isEmpty
    }
    
    var toolbarButtonColor: Color{
        return deviceNameValid && lokasiTanamanValid ? Warna.Secondary : Color.gray
    }
}
