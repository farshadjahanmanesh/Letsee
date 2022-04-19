//
//  File.swift
//  
//
//  Created by Farshad Macbook M1 Pro on 4/19/22.
//

import Foundation
public struct KeyValue<Key, Value>: Codable where Key: Codable, Value: Codable {
    let key: Key
    let value: Value
}
