//
//  UnicornFetcher.swift
//  AgnesUnicorn
//
//  Created by Harly on 2018/7/20.
//

import Foundation
import RxCocoa
import RxSwift

private let castError = "Cannot find your unicorn, but giving you some suprice to be happy~"

public struct UnicornFinder {
    public static func findUnicorn(key: String) -> PublishRelay<Unicorn>
    {
        guard let rxUnicorn = StorageCenter.rxUnicorn(key: key) else {
            assert(true, castError)
            return PublishRelay()
        }
        
        guard rxUnicorn.box is AnyRxWrapper<PublishRelay<Unicorn>> else
        {
            assert(true, castError)
            return PublishRelay()
        }
        
        let rxWrapper = rxUnicorn.box as! AnyRxWrapper<PublishRelay<Unicorn>>
        return rxWrapper.unicornWithRx
    }
}
