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


class ViewModel : NSObject {
    
    let input: PublishRelay<String> = PublishRelay()
    
    let output: PublishRelay<String> = PublishRelay()
    
    override init() {
        super.init()
        input.donate(key: key, to: agnes).bind(to: output)
    }
}
