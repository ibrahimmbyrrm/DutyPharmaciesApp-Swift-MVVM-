//
//  ViewController.swift
//  DutyPharmacies
//
//  Created by İbrahim Bayram on 15.03.2023.
//

import UIKit

class ViewController: UIViewController, ProvinceViewOutput {
    func saveData(values: [Sehir]) {
            self.provinceList = values
            self.provincePicker.reloadAllComponents()
        
    }
    var selectedCitiesList = [Pharmacy]()
    var selectedCity = "adana"
    @IBOutlet weak var provincePicker: UIPickerView!
    lazy var viewModel : ProvinceViewModelOutput = ProvincesViewModel()
    var provinceList = [Sehir]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        SQLService().copyDatabase()
        provincePicker.delegate = self
        provincePicker.dataSource = self
        viewModel.fetchProvinces()
        viewModel.setDelegate(output: self)
        
    }

    @IBAction func listButtonClicked(_ sender: Any) {
        APIManager().fetchPharmacies(city: selectedCity) { result in
            switch result {
            case .success(let pharmlist):
                DispatchQueue.main.async {
                    self.selectedCitiesList = pharmlist
                    self.performSegue(withIdentifier: "toList", sender: nil)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toList" {
            let destVC = segue.destination as! PharmacyListView
            destVC.pharmList = self.selectedCitiesList
        }
    }
    
}

extension ViewController : UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return provinceList.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return provinceList[row].name
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.selectedCity = provinceList[row].name.lowercased()
        print(selectedCity)
    }
    
    
}
    


