//
//  DateRepository.swift
//  ArrayRepositorySample
//
//  Created by Takehito Koshimizu on 2022/03/21.
//

import Foundation

protocol DateRepository {
    func add(_ t: Date)
    func observe(callBack: @escaping ([Date]) -> Void) -> NotificationToken
}

extension ArrayRepository: DateRepository where T == Date {
    static func dateRepository() -> Self {
        .init(center: NotificationCenter.default)
    }
}
