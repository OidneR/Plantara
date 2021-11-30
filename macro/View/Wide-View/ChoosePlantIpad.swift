//
//  ChoosePlantIpad.swift
//  macro
//
//  Created by Dion Lamilga on 12/11/21.
//

import SwiftUI

struct ChoosePlantIpad: View {
    
    @State var viewModel: ChoosePlantViewModel = ChoosePlantViewModel()
    @State var keyword:String = ""
    @State var Grid : [Int] = []
    @State var namaTanaman: String = ""
    
    var body: some View {
            VStack{
                customSearchBar(keyword: $keyword)
                GridViewIpad(viewModel: $viewModel.result, Grid: $Grid)
            }
            .onAppear{
                self.viewModel.filterData(Keyword: "")
                self.generateGrid()
            }
            .onChange(of: keyword, perform: { V in
                viewModel.filterData(Keyword: keyword)
                print(viewModel.result)
                self.generateGrid()
                print(Grid)
            })
    }
    
    func generateGrid(){
        Grid = []
        for i in stride(from: 0, to: self.viewModel.result.count, by: 4){
            if i != self.viewModel.result.count{
                self.Grid.append(i)
                }
            }
        }
    }

struct ChoosePlantIpad_Previews: PreviewProvider {
    static var previews: some View {
        ChoosePlantIpad()
.previewInterfaceOrientation(.portrait)
    }
}

