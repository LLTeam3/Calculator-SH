//
//  ViewController.swift
//  TableViewDemo
//
//  Created by Park Jungwoo on 2022/12/08.
//

import UIKit
import FlexLayout
import PinLayout
import Then

class ListViewController: UITableViewController {
    
    var data = [
        "1",
        "2",
        "3"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView = UITableView(frame: tableView.frame, style: .insetGrouped)
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        
        setupLayout()
    }
    
}

extension ListViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = data[indexPath.row]
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailViewController = DetailViewController()
        
        self.show(detailViewController, sender: nil)
        //        self.present(detailViewController, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            data.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            
        }
        print(data)
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let targetItem: String = self.data[sourceIndexPath.row]
            self.data.remove(at: sourceIndexPath.row)
            self.data.insert(targetItem, at: destinationIndexPath.row)
    }
}

extension ListViewController {
    
    func setupLayout() {
        self.view.backgroundColor = .lightGray
        title = "title"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(editButtonTapped))
        
        navigationItem.rightBarButtonItem =  UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(plusButtonTapped))
        
    }
    
    @objc func editButtonTapped() {
        if self.tableView.isEditing {
            self.tableView.setEditing(false, animated: true)
        } else {
            self.tableView.setEditing(true, animated: true)
        }
    }
    
    @objc func plusButtonTapped() {
        self.present(AddCellViewController(), animated: true)
        data.append("\(data.count)")
        tableView.reloadData()
    }
}

// 프리뷰 생성
import SwiftUI

struct ViewControllerRepresentable: UIViewControllerRepresentable {
    typealias UIViewControllerType = ListViewController
    
    func makeUIViewController(context: Context) -> ListViewController {
        return ListViewController()
    }
    
    func updateUIViewController(_ uiViewController: ListViewController, context: Context) {
    }
}

@available(iOS 14.0.0, *)
struct ViewPreview: PreviewProvider {
    static var previews: some View {
        ViewControllerRepresentable()
    }
}
