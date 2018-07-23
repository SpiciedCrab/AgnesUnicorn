//
//  SecondViewController.swift
//  AgnesUnicorn_Example
//
//  Created by Harly on 2018/7/20.
//  Copyright © 2018年 CocoaPods. All rights reserved.
//

import UIKit
import AgnesUnicorn
import RxSwift
import RxCocoa

class SecondViewController: UIViewController {

    let disposeBag = DisposeBag()
    let secondPusher: PublishRelay<String> = PublishRelay<String>()
    @IBOutlet weak var secondButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        secondButton.rx.tap.map { "Unicorn comes!" }.bind(to: secondPusher).disposed(by: disposeBag)
        secondButton.rx.tap.map {} .subscribe(onNext: {[weak self] (_) in
            guard let strongSelf = self else { return }
            print("unicon counts: tap \(strongSelf.agnes.unicornCountsInBag())")
            strongSelf.dismiss(animated: true, completion: nil)
        })
        
        secondPusher.donate(key: "gogo" , to: self.agnes).bind(to: agnes.unicorn(key: key)).disposed(by: disposeBag)
        // Do any additional setup after loading the view.
    }
    
    deinit {
        print("deni")
    }


}
