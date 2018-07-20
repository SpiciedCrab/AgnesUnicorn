//
//  ViewController.swift
//  AgnesUnicorn
//
//  Created by magic_harly@hotmail.com on 07/20/2018.
//  Copyright (c) 2018 magic_harly@hotmail.com. All rights reserved.
//

import UIKit
import AgnesUnicorn

let key: String = "first"

class ViewController: UIViewController {
    
    let viewModel = ViewModel()
    
    @IBOutlet weak var keyLabel: UILabel!
    
    @IBOutlet weak var contentText: UITextField!
    @IBOutlet weak var tapButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contentText.rx.text.map { $0 ?? "" }.bind(to: viewModel.input)
        
        viewModel.output.bind(to: keyLabel.rx.text)
    }

}

