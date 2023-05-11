//
//  LatestRatesViewController.swift
//  Exchanger
//
//  Created by Content Arcade on 11/05/2023.
//

import UIKit

class LatestRatesViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    let apiHandler = APIHandler()
    @IBOutlet weak var eurLabel: UILabel!
    @IBOutlet weak var gbpLabel: UILabel!
    @IBOutlet weak var jpyLabel: UILabel!
    @IBOutlet weak var basePickerView: UIPickerView!
    let baseCurrencies = ["USD", "AUD", "PKR", "INR", "SAR"]
    override func viewDidLoad() {
        super.viewDidLoad()

        basePickerView.dataSource = self
        basePickerView.delegate = self
        fetchLatestRate(for: baseCurrencies[0])
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return baseCurrencies.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return baseCurrencies[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let currency = baseCurrencies[row]
        fetchLatestRate(for: currency)
    }

    func fetchLatestRate(for currency: String) {
        let loadingView = LoadingView(frame: view.bounds)
        view.addSubview(loadingView)
        loadingView.startAnimating()
        apiHandler.fetchLatest(base: currency, symbols: "EUR,GBP,JPY") { [weak self] result in
            self?.eurLabel.text = "\(result.eur)"
            self?.gbpLabel.text = "\(result.gbp)"
            self?.jpyLabel.text = "\(result.jpy)"
            loadingView.stopAnimating()
            loadingView.removeFromSuperview()
        }
    }
    
    @IBAction func backBtnAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }

}
