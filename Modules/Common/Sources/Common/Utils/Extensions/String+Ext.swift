//
//  String+Ext.swift
//  Common
//
//  Created by Fakhri Rasyid Saputro on 23/12/24.
//

import Foundation

extension String {
    public func toLocalized() -> String {
        return NSLocalizedString(self, bundle: .module, comment: "")
    }
}
