//
//  Sehirlerdao.swift
//  DutyPharmacies
//
//  Created by İbrahim Bayram on 16.03.2023.
//

import Foundation

struct Provincedao : ProvinceService {
    let db : FMDatabase?
    
    init() {
        let hedefyol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let databaseURL = URL(fileURLWithPath: hedefyol).appendingPathComponent("illerDeprem.db")
        db = FMDatabase(path: databaseURL.path)
    }
    
    func verileriAl() -> [Sehir] {
        var liste = [Sehir]()
        db?.open()
        
        do {
            let rs = try db!.executeQuery("SELECT * FROM iller", values: nil)
            
            while(rs.next()) {
                let province = Sehir(name: rs.string(forColumn: "sehir")!)
                liste.append(province)
            }
        }catch {
            print(error.localizedDescription)
        }
        db?.close()
        return liste
    }
    
}
