//
//  SecondViewController.swift
//  AgnesUnicorn_Example
//
//  Created by Harly on 2018/7/20.
//  Copyright © 2018年 CocoaPods. All rights reserved.
//

import UIKit
import AgnesUnicorn


class SecondViewController: UIViewController {

    @IBOutlet weak var secondButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        secondButton.rx.tap.map { "Unicorn comes!" }.bind(to: UnicornFinder.findUnicorn(key: key))
        secondButton.rx.tap.map {} .subscribe(onNext: { (_) in
            self.dismiss(animated: true, completion: nil)
        })
        
        // Do any additional setup after loading the view.
    }


}
