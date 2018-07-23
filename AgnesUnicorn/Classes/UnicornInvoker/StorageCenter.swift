//
//  StorageCenter.swift
//  AgnesUnicorn
//
//  Created by Harly on 2018/7/20.
//

import Foundation
import RxSwift
import RxCocoa

struct StorageCenter {
    static var center: [String : RxWrapper] = [:]
    
    static func push<T : ObservableType>(key: String , rxUnicorn: T) where T.E : Unicorn {
        let wrapper = RxWrapper(rxUnicorn: rxUnicorn)
        StorageCenter.center[key] = wrapper
    }
    
    @discardableResult
    static func pop(key: String)-> RxWrapper? {
        StorageCenter.center.removeValue(forKey: key)
        return StorageCenter.center[key]
    }
    
    static func rxUnicorn(key: String) -> RxWrapper? {
        return StorageCenter.center[key]
    }
    
}
