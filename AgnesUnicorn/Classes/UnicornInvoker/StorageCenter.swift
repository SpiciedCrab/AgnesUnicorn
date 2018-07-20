//
//  StorageCenter.swift
//  AgnesUnicorn
//
//  Created by Harly on 2018/7/20.
//

import Foundation
import RxSwift
import RxCocoa

public struct StorageCenter {
    private static var center: [String : RxWrapper<Unicorn>] = [:]
    
    static func push(key: String , rxUnicorn: PublishRelay<Unicorn>)
    {
        StorageCenter.center[key] = RxWrapper(rxUnicorn: rxUnicorn)
    }
    
    static func push(key: String , rxUnicorn: BehaviorRelay<Unicorn>)
    {
        StorageCenter.center[key] = RxWrapper(rxUnicorn: rxUnicorn)
    }
    
    static func pop(key: String)-> RxWrapper<Unicorn>?
    {
        StorageCenter.center.removeValue(forKey: key)
        return StorageCenter.center[key]
    }
    
    static func rxUnicorn(key: String) -> RxWrapper<Unicorn>?
    {
        return StorageCenter.center[key]
    }
    
}
