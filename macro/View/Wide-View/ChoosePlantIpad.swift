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
    
    init() {
        UINavigationBar.appearance().backgroundColor = UIColor(.white)
    }
    
    var body: some View {
        NavigationView{
            
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
            
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {print("Hello World")}) {
                Image(systemName: "chevron.left")
                        .foregroundColor(Warna.Secondary)
                        Text("Kembali")
                        .foregroundColor(Warna.Secondary)
                        }
                    }
                }
            
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarTitle("Pilih Tanaman")
            
        }
        .navigationViewStyle(StackNavigationViewStyle())
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
.previewInterfaceOrientation(.landscapeLeft)
    }
}
