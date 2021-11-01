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
                        //.padding(.horizontal, 20)
                }
                
                VStack{
                    Spacer()
                    Button("Tambah Perangkat"){
                        print("Hello")
                    }
                    .frame(maxWidth: .infinity ,maxHeight: 50)
                    .foregroundColor(.white)
                    .font(.system(size: 20 ,weight: .regular))
                    .background(RoundedRectangle(cornerRadius: 10)
                                    .fill(Color(#colorLiteral(red: 0.6157478094, green: 0.2447247803, blue: 0.1348765492, alpha: 1))))
                    .padding(.horizontal, 20)
                }
            }
            .navigationTitle("Semua Perangkat")
        }
    }
}

struct MainPage_Previews: PreviewProvider {
    static var previews: some View {
        if #available(iOS 15.0, *) {
            MainPage()
                .previewInterfaceOrientation(.portrait)
        } else {
            // Fallback on earlier versions
        }
    }
}
