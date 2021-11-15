//
//  ListDetailTanaman.swift
//  macro
//
//  Created by Dion Lamilga on 27/10/21.
//

import Foundation

struct Tanaman: Hashable{
    let namaTanaman: String
    let imageTanaman: String
    let difficultyTanaman: String
}



struct TanamanBaru: Hashable{
    let namaTanaman: String
    let imageTanaman: String
    let difficultyTanaman: String
    let harvestTime: String
    let minSuhu: Int
    let maxSuhu: Int
    let minSun: Int
    let maxSun: Int
    let minKelembabanTanah: Int
    let maxKelembabanTanah: Int
    let minKelembabanUdara: Int
    let maxKelembabanUdara: Int
    let desc: String
    let panduanPerawatan: [String]
    let tips: [String]
}

struct PlantedTanaman{
    let tanaman: TanamanBaru
    let suhu: Int
    let sun: Int
    let KelembabanTanah: Int
    let KelembabanUdara: Int
    
    func suhuCondition() -> indicatorCondition{
        if(suhu > tanaman.maxSuhu){
            return .over
        }else if( suhu < tanaman.minSuhu){
            return .under
        }else{
            return .normal
        }
    }
    
    func sunCondition() -> indicatorCondition{
        if(sun > tanaman.maxSun){
            return .over
        }else if(sun < tanaman.minSun){
            return .under
        }else{
            return .normal
        }
    }
    
    func kelembabanTanahCondition() -> indicatorCondition{
        if(KelembabanTanah > tanaman.maxKelembabanTanah){
            return .over
        }else if( KelembabanTanah < tanaman.minKelembabanTanah){
            return .under
        }else{
            return .normal
        }
    }
    
    func kelembabanUdaraCondition() -> indicatorCondition{
        if(KelembabanUdara > tanaman.maxKelembabanUdara){
            return .over
        }else if( KelembabanUdara < tanaman.minKelembabanUdara){
            return .under
        }else{
            return .normal
        }
    }
    
//    func suhuPersentage() -> Double{
//        return suhu/
//    }
}

enum indicatorCondition{
    case under
    case normal
    case over
}
