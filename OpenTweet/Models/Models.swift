//
//  Models.swift
//  OpenTweet
//
//  Created by Dala  on 8/10/21.
//  Copyright © 2021 OpenTable, Inc. All rights reserved.
//

import Foundation

struct TimelineModel: Codable {
    let timeline: [Timeline]
}

struct Timeline: Codable {
    let id: String?
    let author: String?
    let content: String?
    let avatar: String?
    let date: String?
    let inReplyTo: String?
}
