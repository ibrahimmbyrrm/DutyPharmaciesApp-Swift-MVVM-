//
//  Protocols.swift
//  DutyPharmacies
//
//  Created by İbrahim Bayram on 16.03.2023.
//

import Foundation
//Province Protocols
protocol ProvinceService {
    func verileriAl() -> [Sehir]
}
protocol ProvinceViewModelOutput {
    func fetchProvinces()
    var provList : [Sehir] {get set}
    var provinceService : ProvinceService {get}
    var ProvinceViewOutput : ProvinceViewOutput? {get}
    
    func setDelegate(output : ProvinceViewOutput)
}
protocol ProvinceViewOutput {
    func saveData(values : [Sehir])
}
//API Protocols
protocol APIService {
    func fetchPharmacies(city : String ,completion : @escaping(Result<[Pharmacy], Error>)->Void)
}
//Pharmacies Protocols
protocol PharmacyViewModelOutput {
    func fetchData(city : String)
    var apiService : APIService {get}
    var viewOuput : PharmacyViewOutput? {get}
    var pharmacyList : [Pharmacy] {get set}
    
    func setDelegate(output : PharmacyViewOutput)
    
}
protocol PharmacyViewOutput {
    func saveData(values : [Pharmacy])
}
protocol CellButton {
    func goMaps(indexPath : IndexPath)
}
