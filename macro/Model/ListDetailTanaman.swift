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
    let harvestTime: String
}



struct TanamanBaru: Hashable{
    let namaTanaman: String
    let imageTanaman: String
    let difficultyTanaman: String
    let harvestTime: String
    let minSuhu: Double
    let maxSuhu: Double
    let minSun: Double
    let maxSun: Double
    let minKelembabanTanah: Double
    let maxKelembabanTanah: Double
    let minKelembabanUdara: Double
    let maxKelembabanUdara: Double
    let desc: String
    let panduanPerawatan: [String]
    let tips: [String]
}

struct KebutuhanTanaman{
    let kebutuhanSuhu: String
    let kebutuhanSun: String
    let kebutuhanTanah: String
    let kebutuhanUdara: String
}

struct PlantedTanaman{
    let tanaman: TanamanBaru
    let suhu: Double
    let sun: Double
    let KelembabanTanah: Double
    let KelembabanUdara: Double
    
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
