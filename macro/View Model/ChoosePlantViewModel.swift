//
//  ChoosePlantViewModel.swift
//  macro
//
//  Created by Dion Lamilga on 27/10/21.
//

import Foundation
import SwiftUI

class ChoosePlantViewModel: ObservableObject{
    @Published var data: [Tanaman] = [Tanaman(namaTanaman: "Bayam", imageTanaman: "iconBayam", difficultyTanaman: "Easy", harvestTime: "20-21 Hari"),
                                      Tanaman(namaTanaman: "Tomat Ceri", imageTanaman: "iconTomat Ceri", difficultyTanaman: "Medium", harvestTime: "60-100 Hari"),
                                      Tanaman(namaTanaman: "Cabai", imageTanaman: "iconCabai", difficultyTanaman: "Hard", harvestTime: "75-85 Hari"),
                                      Tanaman(namaTanaman: "Pakcoy", imageTanaman: "iconPakcoy", difficultyTanaman: "Easy", harvestTime: "40-50 Hari"),
                                      Tanaman(namaTanaman: "Sawi", imageTanaman: "iconSawi", difficultyTanaman: "Easy", harvestTime: "40-70 Hari"),
                                      Tanaman(namaTanaman: "Kangkung", imageTanaman: "iconKangkung", difficultyTanaman: "Easy", harvestTime: "50-60 Hari"),
                                      Tanaman(namaTanaman: "Selada", imageTanaman: "iconSelada", difficultyTanaman: "Medium", harvestTime: "30-45 Hari"),
                                      Tanaman(namaTanaman: "Kemangi", imageTanaman: "iconKemangi", difficultyTanaman: "Hard", harvestTime: "42 Hari")]
    @Published var result : [Tanaman] = []
    
    func filterData(Keyword: String){
        result = []
        if (Keyword.isEmpty){
            for tanaman in data{
                result.append(tanaman)
            }
        }else{
            for tanaman in data{
                if tanaman.namaTanaman.localizedCaseInsensitiveContains(Keyword){
                    result.append(tanaman)
                    print(tanaman.namaTanaman)
                }
            }
        }
    }
}
