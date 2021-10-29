//
//  DeviceSettings.swift
//  macro
//
//  Created by Vincent on 28/10/21.
//

import SwiftUI

struct DeviceSettings: View {
    
    @State var deviceName: String = ""
    @State var plantLocation: String = ""
    
    @State var plantAgeSelection = 0
    var plantAge = ["1", "2", "3"]
    
    @State var allowNotif: Bool = true
    
    var body: some View {
        Form{
            Section(){
                HStack{
                    Text("Device Name")
                    TextField("Device Bayem 1", text: $deviceName)
                        .multilineTextAlignment(.trailing)
                }
                Picker(selection: $plantAgeSelection, label: Text("Plant Name")) {
                    ForEach(0..<plantAge.count){
                        Text(self.plantAge[$0])
                    }
                }
            }
            
            Section(){
                HStack{
                    Text("Plant Location")
                    TextField("Ruang Tamu", text: $plantLocation)
                        .multilineTextAlignment(.trailing)
                }
                
                Picker(selection: $plantAgeSelection, label: Text("Plant Age")) {
                    ForEach(0..<plantAge.count){
                        Text(self.plantAge[$0])
                    }
                }
            }
            
            Section(){
                Toggle(isOn: $allowNotif) {
                    Text("Allow Notification")
                }
            }
            
            Section(){
                Toggle(isOn: $allowNotif) {
                    Text("Soil Moisture")
                }
                Toggle(isOn: $allowNotif) {
                    Text("Temperature")
                }
                Toggle(isOn: $allowNotif) {
                    Text("Sunlight Meter")
                }
                Toggle(isOn: $allowNotif) {
                    Text("Air Humidity")
                }
            }
            
            Section(footer: Text("If you do not recognise this device, remove it and see some butterfly 😎")){
                Button {
                    
                } label: {
                    Text("Remove Device")
                }.foregroundColor(.red)
            }
        }
        .navigationBarTitle("Device Settings")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                HStack{
                    Button("Selesai"){
                        print("oke de")
                    }
                }
            }
        }
    }
}

struct DeviceSettings_Previews: PreviewProvider {
    static var previews: some View {
        DeviceSettings()
    }
}
