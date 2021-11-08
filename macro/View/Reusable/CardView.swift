//
//  CardView.swift
//  macro
//
//  Created by Dion Lamilga on 01/11/21.
//

import Foundation
import SwiftUI

struct CardView: View{
    
    @Binding var viewModel: [Tanaman]
    @Binding var Grid : [Int]
    
    var body: some View{
        VStack{
            if !self.Grid.isEmpty{
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing : 25){
                        ForEach(self.Grid,id: \.self){i in
                            
                            CardViewHStack(i: i, viewModel: viewModel, Grid: Grid)
                        }
                    }
                    .padding()
                }
            }
        }
    }
}

struct CardViewHStack: View{
    var i: Int
    var viewModel: [Tanaman]
    var Grid :[Int]
    var body: some View{
        HStack(spacing: 15){
            ForEach(i...i+1,id: \.self){j in
                VStack{
                    if j != viewModel.count{
                        CardViewReusable(dataTanaman: viewModel[j])
                    }
                }
            }
            if i == self.Grid.last && self.viewModel.count % 2 != 0 {
                Spacer(minLength: 0)
            }
        }
    }
}
