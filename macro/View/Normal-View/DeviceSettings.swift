//
//  DeviceSettings.swift
//  macro
//
//  Created by Vincent on 28/10/21.
//

import SwiftUI
import UserNotifications

struct DeviceSettings: View {
    @Binding var dataDevice: DeviceData
    let context = PersistenceController.shared.container.viewContext;
    
    @AppStorage("BackToMain") var backtomain:Bool = false
    @State var datePickerSelection = Date()
    
    @State var deviceName: String = ""
    @State var plantLocation: String = ""
    
    @State var plantAgeSelection = 0
    var plantAge: Int = 0
    
    @State var plantNameSelection: String
    @State var plantNames:[String] = []
    
    @State var allowAllNotif: Bool = true
    @State var allowSoilNotif: Bool = true
    @State var allowTempNotif: Bool = true
    @State var allowSunNotif: Bool = true
    @State var allowAirNotif: Bool = true
    
    @State var isAllowed: Bool = false
    @State var isNotDetermined: Bool = false
    @State var isDenied: Bool = false
    
    @State var isPresented: Bool = false
    
    init(dataDevice: Binding<DeviceData>) {
        self._dataDevice = dataDevice
        self._plantNameSelection = State(initialValue: dataDevice.namaTanaman.wrappedValue ?? "Kangkung")
        self._deviceName = State(initialValue: dataDevice.namaDevice.wrappedValue ?? "Unnamed")
        self._plantLocation = State(initialValue:dataDevice.lokasiTanaman.wrappedValue ?? "Unlocated")
        self._allowAllNotif = State(initialValue:dataDevice.allowNotif.wrappedValue)
        self._allowSoilNotif = State(initialValue:dataDevice.allowNotifSoil.wrappedValue)
        self._allowTempNotif = State(initialValue:dataDevice.allowNotifTemp.wrappedValue)
        self._allowSunNotif = State(initialValue:dataDevice.allowNotifSun.wrappedValue)
        self._allowAirNotif = State(initialValue:dataDevice.allowNotifAir.wrappedValue)
        self._datePickerSelection = State(initialValue:dataDevice.tanggalMenanam.wrappedValue ?? Date())
    }
    
    var body: some View {
        Form{
            Section(){
                HStack{
                    Text("Device Name")
                    TextField("Device Name", text: $deviceName)
                        .multilineTextAlignment(.trailing)
                }
                Picker(selection: $plantNameSelection, label: Text("Plant Name")) {
                    ForEach(PlantType.allCases, id: \.self){
                        Text($0.rawValue).tag($0.rawValue)
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
                    .onChange(of: allowAllNotif, perform: { newValue in
                        notif()
                        if allowAllNotif == true{
                            if isNotDetermined == true{
                                UNUserNotificationCenter.current().requestAuthorization(options: .alert) { settings, error in
                                }
                            }
                        }else if allowAllNotif == true{
                            if isNotDetermined == true{
                                allowAllNotif = false
                                isPresented = true
                            }
                        }
                        
                    })
                    .alert(isPresented: $isDenied) {
                        Alert(title: Text("Enable Notifications?"), message: Text("To use this feature you must enable notifications in settings"), primaryButton: .default(Text("Settings")){
                            if let url = URL(string: UIApplication.openSettingsURLString) {
                                if UIApplication.shared.canOpenURL(url) {
                                    UIApplication.shared.open(url, options: [:], completionHandler: nil)
                                }
                            }
                        }, secondaryButton: .cancel())
                    }
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
            
            Section(footer: Text("If you do not recognise this device, just simply remove it")){
                Button {
                    context.delete(dataDevice)
                    do {
                        try context.save()
                    } catch  {
                        
                    }
                } label: {
                    Text("Remove Device")
                }.foregroundColor(.red)
            }
        }
        .onAppear{
            plantNames = []
            for plant in PlantType.allCases{
                plantNames.append(plant.rawValue)
            }
            
            notif()
        }
        .navigationBarTitle("Device Settings")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                HStack{
                    Button("Selesai"){
                        dataDevice.namaDevice = deviceName
                        dataDevice.lokasiTanaman = plantLocation
                        dataDevice.allowNotif = allowAllNotif
                        dataDevice.allowNotifSoil = allowSoilNotif
                        dataDevice.allowNotifTemp = allowTempNotif
                        dataDevice.allowNotifSun = allowSunNotif
                        dataDevice.allowNotifAir = allowAirNotif
                        dataDevice.tanggalMenanam = datePickerSelection
                        dataDevice.namaTanaman = plantNameSelection
                        do {
                            try context.save()
                        } catch {
                            
                        }
                        backtomain.toggle();
                        print("oke de")
                    }
                }
            }
        }
    }
    
    func notif(){
        UNUserNotificationCenter.current().getNotificationSettings(completionHandler: { setting in
            if setting.authorizationStatus == .authorized{
                isAllowed = true
                isNotDetermined = false
                isDenied = false
            }else if setting.authorizationStatus == .notDetermined{
                allowAllNotif = false
                isNotDetermined = true
                isAllowed = false
                isDenied = false
            }else if setting.authorizationStatus == .denied{
                allowAllNotif = false
                isDenied = true
                isAllowed = false
                isNotDetermined = false
            }
        })
    }
}

//struct DeviceSettings_Previews: PreviewProvider {
//    static var previews: some View {
//        DeviceSettings()
//    }
//}
