//
//  DeviceSettings.swift
//  macro
//
//  Created by Vincent on 28/10/21.
//

import SwiftUI

struct DeviceSettings: View {
    
    @State var datePickerSelection = Date()
    
    @State var deviceName: String = ""
    @State var plantLocation: String = ""
    
    @State var plantAgeSelection = 0
    var plantAge = ["1", "2", "3"]
    
    @State var plantNameSelection = "Kangkung"
    var plantNames = ["Bayam", "Kangkung", "Melon"]
    
    @State var allowAllNotif: Bool = true
    @State var allowSoilNotif: Bool = true
    @State var allowTempNotif: Bool = true
    @State var allowSunNotif: Bool = true
    @State var allowAirNotif: Bool = true
    
    var body: some View {
        Form{
            Section(){
                HStack{
                    Text("Device Name")
                    TextField("Device Bayem 1", text: $deviceName)
                        .multilineTextAlignment(.trailing)
                }
                Picker(selection: $plantNameSelection, label: Text("Plant Name")) {
                    ForEach(plantNames, id: \.self){
                        Text($0)
                    }
                }
            }
            
            Section(){
                HStack{
                    Text("Plant Location")
                    TextField("Ruang Tamu", text: $plantLocation)
                        .multilineTextAlignment(.trailing)
                }
                
                DatePicker("Plant Age", selection: $datePickerSelection, displayedComponents: .date)
                    .frame(maxWidth: .infinity)
                    .id(datePickerSelection)
            }
            
            Section(){
                Toggle("Allow Notification", isOn: $allowAllNotif.animation(.easeInOut(duration: 2)))
            }
            
            if allowAllNotif{
                Section(){
                    Toggle(isOn: $allowSoilNotif.animation()) {
                        Text("Soil Moisture")
                    }
                    Toggle(isOn: $allowTempNotif.animation()) {
                        Text("Temperature")
                    }
                    Toggle(isOn: $allowSunNotif.animation()) {
                        Text("Sunlight Meter")
                    }
                    Toggle(isOn: $allowAirNotif.animation()) {
                        Text("Air Humidity")
                    }
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
