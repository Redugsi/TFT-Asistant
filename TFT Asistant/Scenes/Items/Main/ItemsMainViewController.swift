//
//  ItemsMainViewController.swift
//  TFT Asistant
//
//  Created by Erdem Isguder on 4.11.2019.
//  Copyright © 2019 Erdem Isguder. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class ItemsMainViewController: ButtonBarPagerTabStripViewController {
    
    let primaryColor = UIColor(named: "color_primary_second")!
    let dividerColor = UIColor(named: "color_divider")!
    let pinkColor = UIColor(named: "color_pink")!
    
    override func viewDidLoad() {
        // change selected bar color
        settings.style.buttonBarBackgroundColor = primaryColor
        settings.style.buttonBarItemBackgroundColor = primaryColor
        settings.style.selectedBarBackgroundColor = pinkColor
        
        settings.style.buttonBarItemFont = UIFont(name: "AvenirNext-Bold", size: 14)!
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
        self.view.backgroundColor = primaryColor
        buttonBarView.frame = CGRect(x: 0, y: 4, width: buttonBarView.frame.width, height: buttonBarView.frame.height)
    }
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        let itemsBuilderViewController = UIStoryboard.init(name: "ItemBuilder", bundle: nil).instantiateViewController(withIdentifier: "ItemBuilderViewController")
        
        let baseItemsViewController = UIStoryboard.init(name: "BaseItems", bundle: nil).instantiateViewController(withIdentifier: "BaseItemsViewController")

        let combinationsViewController = UIStoryboard.init(name: "Combinations", bundle: nil).instantiateViewController(withIdentifier: "CombinationsViewController")
        
        return [itemsBuilderViewController, baseItemsViewController, combinationsViewController]
    }
}
