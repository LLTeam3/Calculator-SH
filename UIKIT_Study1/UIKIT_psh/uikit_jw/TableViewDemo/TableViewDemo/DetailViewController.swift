//
//  DetailViewController.swift
//  TableViewDemo
//
//  Created by Park Jungwoo on 2022/12/08.
//

import UIKit
import Then
import FlexLayout
import PinLayout

class DetailViewController: UIViewController {
    let rootFlexContainer: UIView = UIView().then {
        $0.layer.borderColor = UIColor.black.cgColor
        $0.layer.borderWidth = 2
    }
    
    private lazy var mainLabel: UILabel = UILabel().then {
        $0.text = "DetailViewController"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
    }
    
    override func viewDidLayoutSubviews() {
        rootFlexContainer.pin.top(rootFlexContainer.pin.safeArea).left(rootFlexContainer.pin.safeArea).right(rootFlexContainer.pin.safeArea).aspectRatio().margin(10.0)
        rootFlexContainer.flex.layout(mode: .adjustHeight)
    }
}

extension DetailViewController {
    func setupLayout() {
        view.backgroundColor = .white
        
        view.addSubview(rootFlexContainer)
        
        rootFlexContainer.flex.define { flex in
            flex.addItem(mainLabel)
        }
    }
}
