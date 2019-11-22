//
//  ViewController.swift
//  CustomButton
//
//  Created by Egor Tereshonok on 11/22/19.
//  Copyright © 2019 Egor Tereshonok. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


    @IBAction func button(_ sender: Any) {
        ChangeLabelcolor(rand: Int.random(in: 0...3), label: label)

    }
    
}

