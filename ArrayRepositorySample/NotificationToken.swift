//
//  NotificationToken.swift
//  ArrayRepositorySample
//
//  Created by Takehito Koshimizu on 2022/03/21.
//

protocol NotificationToken: AnyObject {
    func invalidate()
}
