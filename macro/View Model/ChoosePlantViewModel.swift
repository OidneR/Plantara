//
//  ChoosePlantViewModel.swift
//  macro
//
//  Created by Dion Lamilga on 27/10/21.
//

import Foundation

class ChoosePlantViewModel: ObservableObject{
    @Published var data: [Tanaman] = [Tanaman(namaTanaman: "Bayam", imageTanaman: "iconBayam", difficultyTanaman: "Easy"),
                                      Tanaman(namaTanaman: "Tomat Ceri", imageTanaman: "iconTomat", difficultyTanaman: "Medium"),
                                      Tanaman(namaTanaman: "Cabai", imageTanaman: "iconCabai", difficultyTanaman: "Hard"),
                                      Tanaman(namaTanaman: "Pakcoy", imageTanaman: "iconPakcoy", difficultyTanaman: "Easy"),
                                      Tanaman(namaTanaman: "Sawi", imageTanaman: "iconSawi", difficultyTanaman: "Easy"),
                                      Tanaman(namaTanaman: "Kangkung", imageTanaman: "iconKangkung", difficultyTanaman: "Easy"),
                                      Tanaman(namaTanaman: "Selada", imageTanaman: "iconSelada", difficultyTanaman: "Medium"),
                                      Tanaman(namaTanaman: "Kemangi", imageTanaman: "iconKemangi", difficultyTanaman: "Hard")]
}
