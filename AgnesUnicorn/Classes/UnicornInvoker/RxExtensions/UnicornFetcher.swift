//
//  UnicornFetcher.swift
//  AgnesUnicorn
//
//  Created by Harly on 2018/7/20.
//

import Foundation
import RxCocoa
import RxSwift

private let castError = "Cannot find your unicorn, but giving you 🦄️🦄️ to be happy~"

struct UnicornFinder {
    static func findUnicorn<T : Unicorn>(key: String) -> PublishRelay<T> {
        guard let rxUnicorn = StorageCenter.rxUnicorn(key: key) else {
            assert(false, castError)
            return PublishRelay()
        }
        
        guard rxUnicorn.box is AnyRxWrapper<PublishRelay<T>> else
        {
            assert(false, castError)
            return PublishRelay()
        }
        
        let rxWrapper = rxUnicorn.box as! AnyRxWrapper<PublishRelay<T>>
        return rxWrapper.unicornWithRx
    }
    
    static func howManyUnicons() -> Int {
        return StorageCenter.center.count
    }
}
