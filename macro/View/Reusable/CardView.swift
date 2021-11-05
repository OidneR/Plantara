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
                            HStack(spacing: 15){
                                ForEach(i...i+1,id: \.self){j in
                                    VStack{
                                        if j != self.viewModel.count{
                                            CardViewReusable(dataTanaman: viewModel[j])
                                        }
                                    }
                                }
                                if i == self.Grid.last && self.viewModel.count % 2 != 0 {
                                    Spacer(minLength: 0)
                                }
                            }
                            //CardViewHStack(i: i, viewModel: $viewModel, Grid: $Grid)
                        }
                    }
                    .padding()
                }
            }
        }
    }
}

//struct CardViewHStack: View{
//    @State var i: Int
//    @Binding var viewModel: [Tanaman]
//    @Binding var Grid :[Int]
//    var body: some View{
//        
//    }
//}
