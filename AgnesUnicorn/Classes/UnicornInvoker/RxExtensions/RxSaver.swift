//
//  RxSaver.swift
//  AgnesUnicorn
//
//  Created by Harly on 2018/7/20.
//

import Foundation
import RxSwift
import RxCocoa

public extension PublishRelay where Element : Unicorn
{
    public func donate(key : String) -> PublishRelay
    {
        StorageCenter.push(key: key, rxUnicorn: self)
        return self
    }
}

