//
//  String + Ext.swift
//  SkillsShowApp
//
//  Created by Лена Мырленко on 2021/2/15.
//

import UIKit

extension String {
    func index(from: Int) -> Index {
        return self.index(startIndex, offsetBy: from)
    }

    func substring(from: Int) -> String {
        let fromIndex = index(from: from)
        return String(self[fromIndex...])
    }
}
