//
//  ViewController.swift
//  UIKIT_Study11
//
//  Created by 앙겔로스 on 2022/11/30.
//

import UIKit
import SwiftUI
import SnapKit


class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //키보드 view
        let keyboardView =  UIView()
        keyboardView.backgroundColor = UIColor(red:212/255, green:213/255, blue:216/255,
                                               alpha:1)
        self.view.addSubview(keyboardView)
        
        ///
        keyboardView.snp.makeConstraints { (make) -> Void in
            
            make.bottom.equalTo(self.view.snp.bottom)
            make.left.right.equalTo(self.view)
            make.height.equalTo(self.view.snp.width).multipliedBy(1.25)
        }
        
        //displayView
        let displayView =  UIView()
        displayView.backgroundColor = UIColor.black
        self.view.addSubview(displayView)
        
        //결과나오는 부분
        displayView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(self.view.snp.top)
            make.bottom.equalTo(keyboardView.snp.top)
            make.left.right.equalTo(self.view)
        }
        
        //숫자입력부분ui
        let displayNum =  UILabel()
        displayNum.text = "0"
        displayNum.font = UIFont(name:"HeiTi SC", size:70)
        displayNum.textColor = UIColor.white
        displayNum.textAlignment = .right
        displayView.addSubview(displayNum)
        //
        //                //
        displayNum.snp.makeConstraints { (make) -> Void in
            make.left.right.equalTo(displayView).offset(-10)
            make.bottom.equalTo(displayView).offset(-10)
        }
        
        //버튼 목록
        let keys = ["AC","+/-","%","÷"
                    ,"7","8","9","x"
                    ,"4","5","6","-"
                    ,"1","2","3","+"
                    ,"0","?",".","="]
        
        //버튼들
        var keyViews = [UIButton]()
        
        //추가버튼???? 머지 이건??
        for i in 0..<5{
            for j in 0..<4 {
                let indexOfKeys = i * 4 + j
                let key = keys[indexOfKeys]
                
                //버튼 스타일~
                let keyView =  UIButton(type:.custom)
                keyboardView.addSubview(keyView)
                keyViews.append(keyView)
                keyView.setTitleColor(UIColor.black, for: .normal)
                keyView.setTitle(key, for: .normal)
                keyView.layer.borderWidth = 0.5
                keyView.layer.borderColor = UIColor.black.cgColor
                keyView.titleLabel?.font = UIFont(name:"Arial-BoldItalicMT", size:30)
                
                //머지......???
                if key == "?"{
                    keyView.removeFromSuperview()
                    continue
                }
                
                //키보드????
                keyView.snp.makeConstraints { (make) -> Void in
                    
                    //
                    make.height.equalTo(keyboardView.snp.height).multipliedBy(0.2)
                    
                    //
                    if key == "0" {
                        //0처리
                        make.width.equalTo(keyboardView.snp.width).multipliedBy(0.5)
                    }else {
                        //일반크기
                        make.width.equalTo(keyboardView.snp.width).multipliedBy(0.25)
                    }
                    
                    //
                    if i == 0{
                        make.top.equalTo(0)
                        keyView.backgroundColor = UIColor(red:201/255, green:202/255,
                                                          blue:204/255, alpha:1)
                    }else{
                        make.top.equalTo(keyViews[indexOfKeys-4].snp.bottom)
                    }
                    
                    //
                    switch (j) {
                    case 0:
                        make.left.equalTo(keyboardView.snp.left)
                    case 1:
                        make.right.equalTo(keyboardView.snp.centerX)
                    case 2:
                        make.left.equalTo(keyboardView.snp.centerX)
                    case 3:
                        make.right.equalTo(keyboardView.snp.right)
                        keyView.backgroundColor = UIColor(red:249/255, green:138/255,
                                                          blue:17/255, alpha:1)
                    default:
                        break
                        
                    }
                }
            }
        }
        
        
    }
}


struct ViewControllerRepresentable: UIViewControllerRepresentable {
    typealias UIViewControllerType = ViewController
    
    func makeUIViewController(context: Context) -> ViewController {
        return ViewController()
    }
    
    func updateUIViewController(_ uiViewController: ViewController, context: Context) {
    }
}

@available(iOS 14.0.0, *)
struct ViewPreview: PreviewProvider {
    static var previews: some View {
        ViewControllerRepresentable()
    }
}
