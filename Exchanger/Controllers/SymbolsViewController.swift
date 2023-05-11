//
//  SymbolsViewController.swift
//  Exchanger
//
//  Created by Content Arcade on 11/05/2023.
//

import UIKit

class SymbolsViewController: UIViewController {
    
    let apiHandler = APIHandler()
    var fetchedSymbols: [String] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setting the table view's data source and delegate
        tableView.dataSource = self
        tableView.delegate = self
        fetchSymbols()
    }
    
    
    func fetchSymbols() {
        
        let loadingView = LoadingView(frame: view.bounds)
        view.addSubview(loadingView)
        loadingView.startAnimating()
        apiHandler.fetchSymbols { result in
            self.fetchedSymbols.removeAll()
            self.fetchedSymbols.append(result.symbols.afn)
            self.fetchedSymbols.append(result.symbols.aed)
            self.fetchedSymbols.append(result.symbols.amd)
            self.fetchedSymbols.append(result.symbols.all)
            self.tableView.reloadData()
            
            loadingView.stopAnimating()
            loadingView.removeFromSuperview()
        }
    }
    
    
    @IBAction func backBtnAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
}

extension SymbolsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        fetchedSymbols.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        cell.textLabel?.text = "\(fetchedSymbols[indexPath.row])"
        return cell
    }
    
}
