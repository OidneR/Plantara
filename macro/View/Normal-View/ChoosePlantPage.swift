//
//  ChoosePlantPage.swift
//  macro
//
//  Created by Dion Lamilga on 27/10/21.
//

import SwiftUI

struct ChoosePlantPage: View {
    @State var viewModel: ChoosePlantViewModel = ChoosePlantViewModel()
    @State var keyword: String = ""
    @State var Grid : [Int] = []
    @State var namaTanaman: String = ""
    
    var body: some View {
            if #available(iOS 15.0, *) {
                VStack{
                    VStack{
                        customSearchBar(keyword: $keyword)
                            .padding(.horizontal, 20)
                            .padding(.top, 10)
                        
                        CardView(viewModel: $viewModel.result, Grid: $Grid)
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
                    
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationBarTitle("Pilih Tanaman")
                }
                .foregroundColor(.black)
            } else {
                // Fallback on earlier versions
            }
        }
    
    func generateGrid(){
        Grid = []
        for i in stride(from: 0, to: self.viewModel.result.count, by: 2){
            if i != self.viewModel.result.count{
                self.Grid.append(i)
                }
            }
        }
}


//struct ChoosePlantPage_Previews: PreviewProvider {
//    static var previews: some View {
//        ChoosePlantPage()
//    }
//}
