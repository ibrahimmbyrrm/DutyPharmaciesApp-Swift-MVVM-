//
//  PharmacyCell.swift
//  DutyPharmacies
//
//  Created by İbrahim Bayram on 16.03.2023.
//

import UIKit

class PharmacyCell: UITableViewCell {

    @IBOutlet weak var pharmAddress: UILabel!
    @IBOutlet weak var pharmPhone: UILabel!
    @IBOutlet weak var pharmDistrict: UILabel!
    @IBOutlet weak var pharmName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func openInMap(_ sender: Any) {
    }
    
}
