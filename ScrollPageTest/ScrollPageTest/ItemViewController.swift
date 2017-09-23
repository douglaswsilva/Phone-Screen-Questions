//
//  ItemViewController.swift
//  ScrollPageTest
//
//  Created by Douglas MacbookPro on 9/23/17.
//  Copyright © 2017 Douglas MacbookPro. All rights reserved.
//

import UIKit

class ItemViewController: UIViewController {
    
    @IBOutlet weak var contentImageView: UIImageView!
    
    var itemIndex: Int = 0
    var imageName: String = "" {
        didSet {
            if let imageView = contentImageView {
                imageView.image = UIImage(named: imageName)
            }
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        contentImageView.image = UIImage(named: imageName)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

}
