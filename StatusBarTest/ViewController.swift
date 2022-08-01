//
//  ViewController.swift
//  StatusBarTest
//
//  Created by Konstantinos Natsios on 29/7/22.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    let button = UIButton()
    
    var isDarkContentBackground = true // <1>

    func statusBarEnterLightBackground() { //
        isDarkContentBackground = false
        UIView.animate(withDuration: 0.3) {
            self.setNeedsStatusBarAppearanceUpdate()
        }
    }

    func statusBarEnterDarkBackground() { //
        isDarkContentBackground = true
        UIView.animate(withDuration: 0.3) {
            self.setNeedsStatusBarAppearanceUpdate()
        }
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        if isDarkContentBackground { // <5>
            return .lightContent
        } else {
            return .darkContent
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        button.addTarget(self, action: #selector(handle), for: .touchUpInside)
        button.setTitle("Eleor", for: .normal)
        button.backgroundColor = UIColor.blue
        view.addSubview(button)
        button.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.equalTo(50.0)
        }
        
        if isDarkContentBackground {
            view.backgroundColor = .black
        } else {
            view.backgroundColor = .white
        }
    }
    
    @objc func handle() {
        if isDarkContentBackground {
            view.backgroundColor = .white
            statusBarEnterLightBackground()
        } else {
            view.backgroundColor = .black
            statusBarEnterDarkBackground()
        }
    }
}

