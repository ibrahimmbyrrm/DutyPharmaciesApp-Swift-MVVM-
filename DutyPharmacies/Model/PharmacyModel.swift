//
//  PharmacyModel.swift
//  DutyPharmacies
//
//  Created by İbrahim Bayram on 16.03.2023.
//

import Foundation

struct InitialData : Codable {
    let result : [Pharmacy]
}
struct Pharmacy : Codable {
    let name : String
    let dist : String
    let address : String
    let phone : String
    let loc : String
}
