//
//  MainViewController.swift
//  TFT Asistant
//
//  Created by Erdem Isguder on 7.11.2019.
//  Copyright © 2019 Erdem Isguder. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let seperatorView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 2))
        seperatorView.backgroundColor = UIColor(named: "color_pink")
        self.tabBar.insertSubview(seperatorView, at: 0)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
