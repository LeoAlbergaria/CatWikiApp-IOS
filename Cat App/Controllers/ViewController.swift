//
//  ViewController.swift
//  Cat App
//
//  Created by Leonardo Albergaria on 17/11/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var catBreeds = [Cat]()
    var catManager = CatManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        catManager.delegate = self
        
        catManager.performRequest()
        
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "CatCell", bundle: nil), forCellReuseIdentifier: "ReusableCell")
        
    }
    
}

extension ViewController: CatManagerDelegate {
    func didUpdateBreeds(_ catManager: CatManager, breeds: [Cat]) {
        DispatchQueue.main.async {
            self.catBreeds = breeds
            self.tableView.reloadData()
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return catBreeds.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReusableCell", for: indexPath) as! CatCell
        cell.nameLabel.text = catBreeds[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetails", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailsViewController {
            destination.breed = catBreeds[(tableView.indexPathForSelectedRow?.row)!]
        }
    }
}

