//
//  PharmacyListView.swift
//  DutyPharmacies
//
//  Created by İbrahim Bayram on 16.03.2023.
//

import UIKit

class PharmacyListView: UIViewController {
    var pharmList = [Pharmacy]()
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    

}
extension PharmacyListView : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! PharmacyCell
        if !pharmList.isEmpty {
            let pharm = pharmList[indexPath.row]
            cell.pharmAddress.text = pharm.address
            cell.pharmDistrict.text = pharm.dist
            cell.pharmName.text = pharm.name
            cell.pharmPhone.text = pharm.phone
        }
        
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if !pharmList.isEmpty {
            return pharmList.count
        }else {
            return 0
        }
    }
    
}
