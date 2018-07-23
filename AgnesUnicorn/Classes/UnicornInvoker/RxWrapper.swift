//
//  ObsWrapper.swift
//  AgnesUnicorn
//
//  Created by Harly on 2018/7/20.
//

import Foundation
import RxSwift
import RxCocoa

public protocol Unicorn {
    
}

class RxBox : ObservableType
{
    func subscribe<O>(_ observer: O) -> Disposable where O : ObserverType, RxBox.E == O.E {
        fatalError()
    }
    
    typealias E = Unicorn
}

class AnyRxWrapper<RxUnicorn : ObservableType> : RxBox
{
    var unicornWithRx : RxUnicorn
    
    init(rxUnicorn: RxUnicorn) {
        self.unicornWithRx = rxUnicorn
    }
    
    override func subscribe<O>(_ observer: O) -> Disposable where RxUnicorn.E == O.E, O : ObserverType {
        return unicornWithRx.subscribe(observer)
    }
}

class RxWrapper: ObservableType {
    
    func subscribe<O>(_ observer: O) -> Disposable where O : ObserverType, RxWrapper.E == O.E {
        return box.subscribe(observer)
    }
    
    typealias E = Unicorn
    
    let box: RxBox
    
    init<RxUnicorn: ObservableType>(rxUnicorn: RxUnicorn) where RxUnicorn.E: E {
        box = AnyRxWrapper(rxUnicorn: rxUnicorn)
    }
}
