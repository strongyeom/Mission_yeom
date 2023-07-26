//
//  DetailViewController.swift
//  Mission_yeom
//
//  Created by 염성필 on 2023/07/26.
//

import UIKit

class DetailViewController: UIViewController {

    var detailImage: [String]?
    
    @IBOutlet var detailImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        print(detailImage)
    }
}
