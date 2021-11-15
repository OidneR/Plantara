//
//  GridViewIpad.swift
//  macro
//
//  Created by Dion Lamilga on 12/11/21.
//
import SwiftUI

struct GridViewIpad: View {
    
    @Binding var viewModel: [Tanaman]
    @Binding var Grid : [Int]
    
    var body: some View{
        VStack{
            if !self.Grid.isEmpty{
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing : 25){
                        ForEach(self.Grid,id: \.self){i in
                            CardViewIpadHStack(i: i, viewModel: viewModel, Grid: Grid)
                        }
                    }
                    .padding()
                }
            }
        }
    }
}

struct CardViewIpadHStack: View{
    var i: Int
    var viewModel: [Tanaman]
    var Grid :[Int]
    var body: some View{
        HStack(spacing: 15){
            ForEach(i...i+3,id: \.self){j in
                VStack{
                    if j < viewModel.count{
                        CardViewIpad(dataTanaman: viewModel[j])
                    }
                }
            }
            if i == self.Grid.last && self.viewModel.count % 4 != 0 {
                Spacer(minLength: 0)
            }
        }
    }
}
