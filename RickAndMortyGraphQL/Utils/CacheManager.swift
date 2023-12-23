//
//  CacheManager.swift
//  RickAndMortyGraphQL
//
//  Created by Ariel Ortiz on 12/22/23.
//

import UIKit

final class CacheManager{
    
    static let shared = CacheManager()
    
    private init(){}
    
    private let wrapped: NSCache<NSString, UIImage> = {
        let cache = NSCache<NSString, UIImage>()
        cache.countLimit = 100
        cache.totalCostLimit = 1024 * 1024 * 100
        return cache
    }()
    
    private func save(_ value: UIImage, forKey key: String) {
        wrapped.setObject(value, forKey: key as NSString)
    }
    
    private func retrieve(forKey key: String) -> UIImage? {
        let entry = wrapped.object(forKey: key as NSString)
        return entry
    }
    
    private func removeValue(forKey key: String) {
        wrapped.removeObject(forKey: key as NSString)
    }
    
    subscript(key: String) -> UIImage? {
        get {
            retrieve(forKey: key)
        }
        set {
            guard let value = newValue else{
                removeValue(forKey: key)
                return
            }
            save(value, forKey: key)
        }
    }
    
}

