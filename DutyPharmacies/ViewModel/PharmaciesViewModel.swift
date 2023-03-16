//
//  PharmaciesViewModel.swift
//  DutyPharmacies
//
//  Created by İbrahim Bayram on 16.03.2023.
//

import Foundation
class PharmaciesViewModel : PharmacyViewModelOutput {
    func fetchData(city : String) {
        apiService.fetchPharmacies(city: city) { result in
            switch result {
            case .success(let pharmacyList):
                self.pharmacyList = pharmacyList
                self.viewOuput?.saveData(values: pharmacyList)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    init() {
        apiService = APIManager()
    }
    
    var apiService: APIService = APIManager()
    
    var viewOuput: PharmacyViewOutput?
    
    var pharmacyList: [Pharmacy] = []
    
    func setDelegate(output: PharmacyViewOutput) {
        viewOuput = output
    }
}


