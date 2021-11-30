//
//  DeviceDetailPageViewModel.swift
//  macro
//
//  Created by Meichel Rendio on 29/11/21.
//

import Foundation

class DeviceDetailPageViewModel: ObservableObject{
    @Published var valueProgressBarSinar: Double = 0
    @Published var valueProgressBarSuhu: Double = 0
    @Published var valueProgressBarUdara: Double = 0
    @Published var valueProgressBarTanah: Double = 0
    @Published var percentageProgressBarSinar: Double = 0
    @Published var percentageProgressBarSuhu: Double = 0
    @Published var percentageProgressBarUdara: Double = 0
    @Published var percentageProgressBarTanah: Double = 0
    func getPlantConditionPersentage(){
        percentageProgressBarSuhu = valueProgressBarSuhu/40 * 100
        percentageProgressBarSinar = valueProgressBarSinar
        percentageProgressBarUdara = valueProgressBarUdara
        percentageProgressBarTanah = valueProgressBarTanah
    }
}
