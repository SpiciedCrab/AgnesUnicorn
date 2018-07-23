//
//  RxSaver.swift
//  AgnesUnicorn
//
//  Created by Harly on 2018/7/20.
//

import Foundation
import RxSwift
import RxCocoa

public extension ObservableType where E : Unicorn {
    public func donate(key : String, to agnes: Agnes? = nil) -> Self {
        
        StorageCenter.push(key: key, rxUnicorn: self)
        
        if let realAgnes = agnes
        {
            realAgnes.setupBag(key: key)
        }
        
        return self
    }
}

