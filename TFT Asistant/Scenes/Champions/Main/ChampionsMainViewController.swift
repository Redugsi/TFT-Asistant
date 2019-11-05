//
//  ChampionsMainViewController.swift
//  TFT Asistant
//
//  Created by Erdem Isguder on 5.11.2019.
//  Copyright © 2019 Erdem Isguder. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class ChampionsMainViewController: ButtonBarPagerTabStripViewController {
    
    let primaryColor = UIColor(named: "color_primary_second")!
    let dividerColor = UIColor(named: "color_divider")!
    let pinkColor = UIColor(named: "color_pink")!
    
    override func viewDidLoad() {
        // change selected bar color
        settings.style.buttonBarBackgroundColor = primaryColor
        settings.style.buttonBarItemBackgroundColor = primaryColor
        settings.style.selectedBarBackgroundColor = pinkColor
        
        settings.style.buttonBarItemFont = .boldSystemFont(ofSize: 14)
        settings.style.selectedBarHeight = 2.0
        settings.style.buttonBarMinimumLineSpacing = 0
        settings.style.buttonBarItemTitleColor = .white
        settings.style.buttonBarItemsShouldFillAvailableWidth = true
        settings.style.buttonBarLeftContentInset = 0
        settings.style.buttonBarRightContentInset = 0
        
        changeCurrentIndexProgressive = { [weak self] (oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
            guard changeCurrentIndex == true else { return }
            oldCell?.label.textColor = .white
            newCell?.label.textColor = self?.pinkColor
        }
        super.viewDidLoad()
    }
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        let championViewController = UIStoryboard.init(name: "Champions", bundle: nil).instantiateViewController(withIdentifier: "ChampionsViewController")
        
        let traitsViewController = UIStoryboard.init(name: "Traits", bundle: nil).instantiateViewController(withIdentifier: "TraitsViewController")
        
        return [championViewController, traitsViewController]
    }
}
