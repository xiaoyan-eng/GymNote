//
//  Extensions.swift
//  GymNote
//
//  Created by Xiao Yan on 11/14/21.
//

import RealmSwift

extension Results {
    func toArray() -> [Element] {
        return compactMap { $0 }
    }
}
