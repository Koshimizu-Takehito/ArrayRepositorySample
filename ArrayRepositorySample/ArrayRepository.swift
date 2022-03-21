//
//  ArrayRepository.swift
//  ArrayRepositorySample
//
//  Created by Takehito Koshimizu on 2022/03/21.
//

import Foundation

class ArrayRepository<T> {
    private let center: NotificationCenter
    private lazy var notificationName: NSNotification.Name
        = .init(rawValue: "\(type(of: self)).\(ObjectIdentifier(self))")

    private var array: [T] = [] {
        didSet {
            center.post(name: notificationName, object: nil)
        }
    }

    required init(center: NotificationCenter) {
        self.center = center
    }

    func add(_ t: T) {
        array.append(t)
    }

    func observe(callBack: @escaping ([T]) -> Void) -> NotificationToken {
        let name = notificationName
        let observer = center.addObserver(forName: name, object: nil, queue: .main) { [self] _ in
            callBack(array)
        }
        return Token(center: center, observer: observer)
    }
}

extension ArrayRepository {
    private class Token: NotificationToken {
        private let center: NotificationCenter
        private(set) var observer: NSObjectProtocol?

        init(center: NotificationCenter, observer: NSObjectProtocol) {
            self.center = center
            self.observer = observer
        }

        func invalidate() {
            if let observer = observer {
                center.removeObserver(observer)
                self.observer = nil
            }
        }
    }
}
