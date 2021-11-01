//
//  ChoosePlantPage.swift
//  macro
//
//  Created by Dion Lamilga on 27/10/21.
//

import SwiftUI

struct ChoosePlantPage: View {
    @State var viewModel: ChoosePlantViewModel = ChoosePlantViewModel()
    @State var Grid : [Int] = []
    @State var namaTanaman: String = ""
    
    init() {
        UINavigationBar.appearance().backgroundColor = UIColor(Color("Abu"))
    }
    
    var body: some View {
        if #available(iOS 15.0, *) {
            VStack{
                CardView(viewModel: self.$viewModel.data, Grid: self.$Grid)
                    .navigationBarTitle("Pilih Tanaman")
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button("Ha"){
                                print("hehe")
                            }
                        }
                    }

            }
            .onAppear{
                self.generateGrid()}

                }
            }
            .foregroundColor(.black)
            .searchable(text: $namaTanaman, placement: .navigationBarDrawer(displayMode: .always)){
                CardView(viewModel: $viewModel.data, Grid: $Grid)
                    .searchCompletion(namaTanaman)
            }
            .foregroundColor(.black)
        } else {
            
        }
    }
    
    func generateGrid(){
        Grid = []
        for i in stride(from: 0, to: self.viewModel.data.count, by: 2){
            if i != self.viewModel.data.count{
                self.Grid.append(i)
            }
        }
    }
}

struct ChoosePlantPage_Previews: PreviewProvider {
    static var previews: some View {
        ChoosePlantPage()
    }
}
