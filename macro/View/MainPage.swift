//
//  MainPage.swift
//  LearnSwiftUI
//
//  Created by Michael Tanakoman on 28/10/21.
//

import SwiftUI

struct MainPage: View {
    var body: some View {
        NavigationView{
            ZStack{
                ScrollView{
                    CardDevice()
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
        }
        .accentColor(Warna.Secondary)
    }
}

struct MainPage_Previews: PreviewProvider {
    static var previews: some View {
        MainPage()
    }
}
