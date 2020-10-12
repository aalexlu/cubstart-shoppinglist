//
//  ItemViewController.swift
//  Cubstart-Shopping-List
//
//  Created by Alex Lu on 10/11/20.
//  Copyright © 2020 Alexandra Lu. All rights reserved.
//

import UIKit

class ItemViewController: UIViewController {
    
    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemCount: UILabel!

    var name = ""
    var image = ""
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.itemName.text = name
        self.itemCount.text = "Count: \(count)"
        self.itemImage.image = UIImage(named: image)
    }

}
