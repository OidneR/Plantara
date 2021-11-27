//
//  SetupDevice.swift
//  macro
//
//  Created by Michael Tanakoman on 29/10/21.
//

import SwiftUI

struct SetupDevice: View {

    let context = PersistenceController.shared.container.viewContext
    @StateObject var viewModel = SetupDeviceViewModel()
    @AppStorage("BackToMain") var backtomain:Bool = false
    var passItem: String
    
    
    var body: some View {
        VStack{
            Form{
                Section(){
                    HStack{
                        Text("Nama Perangkat")
                        TextField("Device \(passItem)", text: $viewModel.deviceName)
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
                        TextField("Your Location", text: $viewModel.lokasiTanaman)
                            .multilineTextAlignment(.trailing)
                    }
                    
                    if #available(iOS 15, *) {
                        DatePicker("Tanggal Menanam", selection: $viewModel.selectedDate, in: Date.distantPast...Date.now, displayedComponents: .date)
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
                        viewModel.jenisTanaman = passItem
                        viewModel.saveData()
                        backtomain = true
                    } label: {
                        Text("Selesai")
                    }
                    .foregroundColor(toolbarButtonColor)
                    .disabled(viewModel.deviceName.isEmpty || viewModel.lokasiTanaman.isEmpty)
                }
            }
        }
    }
    
    var deviceNameValid: Bool{
        return !viewModel.deviceName.isEmpty
    }
    
    var lokasiTanamanValid: Bool{
        return !viewModel.lokasiTanaman.isEmpty
    }
    
    var toolbarButtonColor: Color{
        return deviceNameValid && lokasiTanamanValid ? Warna.Secondary : Color.gray
    }
}
