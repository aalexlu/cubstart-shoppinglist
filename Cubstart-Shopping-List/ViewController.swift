//
//  ViewController.swift
//  Cubstart-Shopping-List
//
//  Created by Alex Lu on 10/11/20.
//  Copyright © 2020 Alexandra Lu. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    /** IBOutlets for each element in our CustomTableViewCell; set in cellForRowAt */
    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var itemCount: UILabel!
    @IBOutlet weak var itemImage: UIImageView!
}

class ViewController : UIViewController, UITableViewDataSource, UITableViewDelegate {
    /** IBOutlet for tableView */
    @IBOutlet weak var tableView: UITableView!
    
    /** Arrays with our data */
    let itemName = ["Apple", "Orange", "Banana"]
    let itemCount = [4, 10, 3]
    let imageName = ["apple.jpeg", "orange.jpg", "banana.jpg"]
    
    /** Index of the row clicked by the user */
    var selectedIndex = Int()
    
    /** viewDidLoad */
    override func viewDidLoad() {
        super.viewDidLoad()
        // Registers the CustomTableViewCell
        self.tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "custom")
    }
    
    /** DataSource function: How many rows does this table view have */
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // How many elements in our data array
        return itemName.count
    }
    
    /** DataSource function: For every row in this table view, set the cells to, in this case, in instance of our CustomTableViewCell */
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : CustomTableViewCell = self.tableView.dequeueReusableCell(withIdentifier: "custom") as! CustomTableViewCell
        // Sets the labels/image in each row of the Table View; remember each row is a CustomTableViewCell
        cell.itemName.text = itemName[indexPath.row]
        cell.itemCount.text = "Count: \(itemCount[indexPath.row])"
        cell.itemImage.image = UIImage(named: imageName[indexPath.row])
        
        return cell
    }

    /** Delegate function: when a user selects a row, what happens */
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Saves the row clicked by the user in a variable, so that when we perform/prepare, we can pass the correct data specific to the row clicked
        selectedIndex = indexPath.row
        // Performs segue to ItemVC when any row is clicked
        performSegue(withIdentifier: "item", sender: self)
    }
    
    /** prepare function passes data from this VC to the ItemVC */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "item" {
            let vc : ItemViewController = segue.destination as! ItemViewController
            // Using the selectedIndex (set in didSelectRowAt,) set these instance variables in ItemVC to the corresponding data from the arrays
            vc.name = itemName[selectedIndex]
            vc.count = itemCount[selectedIndex]
            vc.image = imageName[selectedIndex]
        }
    }
}

