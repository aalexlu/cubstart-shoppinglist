//
//  ViewController.swift
//  Cubstart-Shopping-List
//
//  Created by Alex Lu on 10/11/20.
//  Copyright © 2020 Alexandra Lu. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var itemCount: UILabel!
    @IBOutlet weak var itemImage: UIImageView!
}

class ViewController : UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    let itemName = ["Apple", "Orange", "Banana"]
    let itemCount = [4, 10, 3]
    let imageName = ["apple.jpeg", "orange.jpg", "banana.jpg"]
    
    var selectedIndex = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "custom")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : CustomTableViewCell = self.tableView.dequeueReusableCell(withIdentifier: "custom") as! CustomTableViewCell
        
        cell.itemName.text = itemName[indexPath.row]
        cell.itemCount.text = "Count: \(itemCount[indexPath.row])"
        cell.itemImage.image = UIImage(named: imageName[indexPath.row])
        
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndex = indexPath.row
        performSegue(withIdentifier: "item", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "item" {
            let vc : ItemViewController = segue.destination as! ItemViewController
            
            vc.name = itemName[selectedIndex]
            vc.count = itemCount[selectedIndex]
            vc.image = imageName[selectedIndex]
        }
    }
}

