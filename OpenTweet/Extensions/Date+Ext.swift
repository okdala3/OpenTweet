//
//  Date+Ext.swift
//  OpenTweet
//
//  Created by Dala  on 8/10/21.
//  Copyright © 2021 OpenTable, Inc. All rights reserved.
//

import Foundation

extension Date {
    func convertToMonthYearFormat() -> String {
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "MMM dd yyyy"
        
        return dateformatter.string(from: self)
    }
}
