//
//  SampleTableViewController.swift
//  ArrayRepositorySample
//
//  Created by Takehito Koshimizu on 2022/03/21.
//

import UIKit

class SampleTableViewController: UITableViewController {
    private var token: NotificationToken?
    private let repository: DateRepository = ArrayRepository.dateRepository()
    private var array: [Date] = [] {
        didSet {
            DispatchQueue.main.async { [weak tableView] in
                tableView?.reloadData()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        token = repository.observe { [weak self] array in
            self?.array = array
        }
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // ⚠️ ↓Your subscription will be suspended and you will not be added thereafter.↓ ⚠️
//        token?.invalidate()
    }

    @IBAction func add(sender: Any) {
        repository.add(Date())
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        var configuration = cell.defaultContentConfiguration()
        configuration.text = array[indexPath.row].ISO8601Format()
        cell.contentConfiguration = configuration
        return cell
    }

    @IBSegueAction
    func makeDetail(coder: NSCoder, sender: Any?, segueIdentifier: String?) -> UIViewController? {
        if let cell = sender as? UITableViewCell, let indexPath = tableView.indexPath(for: cell) {
            return SampleDetailViewController(coder: coder, date: array[indexPath.row])
        }
        return SampleDetailViewController(coder: coder)
    }
}
