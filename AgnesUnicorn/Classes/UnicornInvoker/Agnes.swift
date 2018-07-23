//
//  Agnes.swift
//  AgnesUnicorn
//
//  Created by Harly on 2018/7/23.
//

import Foundation
import RxSwift
import RxCocoa

// MARK: - .Agnes Definitions
private var agnesContext: UInt8 = 0

extension NSObject: AgnesGift {  }

public protocol AgnesGift {

    var agnes: Agnes { get set }
}

extension AgnesGift where Self: AnyObject {
    
    public var agnes: Agnes {
        get {
            if let ag = objc_getAssociatedObject(self, &agnesContext) as? Agnes {
                return ag
            }
            let newAg = Agnes()
            objc_setAssociatedObject(self, &agnesContext, newAg, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            return newAg
        }
        
        set {
            objc_setAssociatedObject(self, &agnesContext, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}


// MARK: - Agnes Funcitions
public class Agnes {
    
    /// Find your unicorn
    ///
    /// - Parameter key: unicon key
    /// - Returns: rxUnicorn
    public func unicorn<T : Unicorn>(key: String) -> PublishRelay<T> {
        return UnicornFinder.findUnicorn(key: key)
    }
    
    /// Provides the counts of the caches
    ///
    /// - Returns: counts
    public func unicornCountsInBag() -> Int {
        return UnicornFinder.howManyUnicons()
    }
    
    private var agnesBag: [String] = []
    
    func setupBag(key : String) {
        agnesBag.append(key)
    }
    
    deinit {
        agnesBag.forEach { StorageCenter.pop(key: $0) }
    }
}
