//
//  ItemViewController.swift
//  Cubstart-Shopping-List
//
//  Created by Alex Lu on 10/11/20.
//  Copyright © 2020 Alexandra Lu. All rights reserved.
//

import UIKit

class ItemViewController: UIViewController {
    /** IBOutlets for each element in our ItemViewController; set in viewDidLoad below */
    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemCount: UILabel!

    /** Variables for passing data from ViewController; set in the prepare function */
    var name = ""
    var image = ""
    var count = 0
    
    /** viewDidLoad */
    override func viewDidLoad() {
        super.viewDidLoad()
        // Sets the IBOutlets in the VC to the ones passed in when segue was performed
        self.itemName.text = name
        self.itemCount.text = "Count: \(count)"
        self.itemImage.image = UIImage(named: image)
    }

}
