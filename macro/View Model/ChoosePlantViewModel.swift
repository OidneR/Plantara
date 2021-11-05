//
//  ChoosePlantViewModel.swift
//  macro
//
//  Created by Dion Lamilga on 27/10/21.
//

import Foundation
import SwiftUI

class ChoosePlantViewModel: ObservableObject{
    @Published var data: [Tanaman] = [Tanaman(namaTanaman: "Bayam", imageTanaman: "iconBayam", difficultyTanaman: "Easy"),
                                      Tanaman(namaTanaman: "Tomat Ceri", imageTanaman: "iconTomat", difficultyTanaman: "Medium"),
                                      Tanaman(namaTanaman: "Cabai", imageTanaman: "iconCabai", difficultyTanaman: "Hard"),
                                      Tanaman(namaTanaman: "Pakcoy", imageTanaman: "iconPakcoy", difficultyTanaman: "Easy"),
                                      Tanaman(namaTanaman: "Sawi", imageTanaman: "iconSawi", difficultyTanaman: "Easy"),
                                      Tanaman(namaTanaman: "Kangkung", imageTanaman: "iconKangkung", difficultyTanaman: "Easy"),
                                      Tanaman(namaTanaman: "Selada", imageTanaman: "iconSelada", difficultyTanaman: "Medium"),
                                      Tanaman(namaTanaman: "Kemangi", imageTanaman: "iconKemangi", difficultyTanaman: "Hard")]
    @Published var result : [Tanaman] = []
    
    func filterData(Keyword: String){
        result = []
        if (Keyword.isEmpty){
            for tanaman in data{
                result.append(tanaman)
            }
        }else{
            for tanaman in data{
                if tanaman.namaTanaman.contains(.caseInsensitiveCompare(Keyword)){
                    result.append(tanaman)
                    print(tanaman.namaTanaman)
                }
            }
        }
    }
}
