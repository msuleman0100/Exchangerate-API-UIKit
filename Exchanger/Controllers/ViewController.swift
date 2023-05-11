//
//  ViewController.swift
//  Exchanger
//
//  Created by Content Arcade on 11/05/2023.
//

import UIKit

class ViewController: UIViewController {
    
    let apiHandler = APIHandler()
    @IBOutlet weak var usdTextField: UITextField!
    @IBOutlet weak var pkrTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        pkrTextField.isEnabled = false
        navigationController?.isNavigationBarHidden = true
    }
    @IBAction func convertBtnAction(_ sender: Any) {
        if usdTextField.text != "" {
            let loadingView = LoadingView(frame: view.bounds)
            view.addSubview(loadingView)
            loadingView.startAnimating()
            usdTextField.resignFirstResponder()
            
            let amount = Double(usdTextField.text ?? "0.0")
            apiHandler.fetchExchangeRate(to: "PKR", from: "USD", amount: amount ?? 0.0, completion: { rate in
                self.pkrTextField.text = String(format: "%.2f", rate)

                loadingView.stopAnimating()
                loadingView.removeFromSuperview()
            })
        } else { showAlert() }
    }
    private func showAlert() {
        let title = "Invalid Amount!"
        let msg = "Please enter valid USD amount to continue."
        let alertController = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Try Again", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
}
