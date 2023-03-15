//
//  ProvincesViewModel.swift
//  DutyPharmacies
//
//  Created by İbrahim Bayram on 16.03.2023.
//

import Foundation

class ProvincesViewModel : ProvinceViewModelOutput{
    var provList: [Sehir] = []
    var provinceService: ProvinceService = Provincedao()
    var ProvinceViewOutput: ProvinceViewOutput?
    
    
    init() {
        provinceService = Provincedao()
    }
    func fetchProvinces() {
        self.provList = provinceService.verileriAl()
        DispatchQueue.main.async {
            self.ProvinceViewOutput?.saveData(values: self.provList)
        }
        
    }
    func setDelegate(output: ProvinceViewOutput) {
        ProvinceViewOutput = output
    }
   
   
}
