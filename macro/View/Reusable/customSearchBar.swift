//
//  customSearchBar.swift
//  macro
//
//  Created by Meichel Rendio on 04/11/21.
//

import SwiftUI

struct customSearchBar: View {
    @Binding var keyword: String
    @State var secondaryIcon = "mic.fill"
    @State var showKeyboard = false
    var body: some View {
        HStack{
            Image(systemName: "magnifyingglass")
                .padding(.leading, 8)
                .foregroundColor(Warna.Gray3)
            TextField("Pencarian", text: $keyword, onEditingChanged: { changed in
                showKeyboard = true
            })
                .foregroundColor(Warna.Gray3)
            Button {
                if(showKeyboard){
                    
                    DispatchQueue.main.async {
                        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                        showKeyboard.toggle()
                        keyword = ""
                    }
                    

                }
            } label: {
                Image(systemName: secondaryIcon)
                    .padding(.trailing, 8)
                    .foregroundColor(Warna.Gray3)
            }

            
        }
        .padding(8)
        .background(Warna.Gray2.opacity(0.12))
        .cornerRadius(8)
        .onChange(of: showKeyboard) { newValue in
            if(!showKeyboard){
                secondaryIcon = "mic.fill"
            }else{
                secondaryIcon = "multiply.circle.fill"
            }
            
        }
        
    }
}

