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
    
    var body: some View {
        NavigationView{
            VStack{
                CardView(viewModel: self.$viewModel.data, Grid: self.$Grid)
            }
            .onAppear{
                self.generateGrid()}
            
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarTitle("Choose Plant")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {print("Hello World")}) {
                        Image(systemName: "chevron.left")
                        Text("Back")
                    }
                }
            }
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
                                            CardViewReusable(dataTanaman: self.viewModel[j])
                                        }
                                    }
                                }
                                if i == self.Grid.last && self.viewModel.count % 2 != 0 {
                                    Spacer(minLength: 0)
                                }
                            }
                        }
                    }
                    .padding()
                }
            }
        }
    }
}
