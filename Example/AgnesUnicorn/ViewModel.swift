//
//  ViewModel.swift
//  AgnesUnicorn_Example
//
//  Created by Harly on 2018/7/20.
//  Copyright © 2018年 CocoaPods. All rights reserved.
//

import Foundation
import AgnesUnicorn
import RxCocoa
import RxSwift

extension String : Unicorn
{
    
}


class ViewModel {
    
    let input: PublishRelay<Unicorn> = PublishRelay()
    
    let output: PublishRelay<String> = PublishRelay()
    
    init() {
        input.donate(key: key).map({ (uni) -> String in
            guard let str = uni as? String else { return "" }
            return str + "gogo"
        }).bind(to: output)
    }
}
