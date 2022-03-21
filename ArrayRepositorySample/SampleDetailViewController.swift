//
//  SampleDetailViewController.swift
//  ArrayRepositorySample
//
//  Created by Takehito Koshimizu on 2022/03/21.
//

import UIKit

class SampleDetailViewController: UIViewController {
    private let date: Date

    @IBOutlet private weak var label: UILabel! {
        didSet {
            label.text = date.ISO8601Format()
        }
    }

    required init?(coder: NSCoder, date: Date) {
        self.date = date
        super.init(coder: coder)
    }

    required init?(coder: NSCoder) {
        self.date = Date()
        super.init(coder: coder)
    }
}
