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
    var activityIndicator: UIActivityIndicatorView!
    var overlayView: UIView!
    
    var isTraitsLoaded = false
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
            if let self = self {
                let isRootingToTraitsFirstTime = newCell?.label.text.stringValue == "Traits" && changeCurrentIndex && !self.isTraitsLoaded
                if isRootingToTraitsFirstTime {
                    self.overlayView.isHidden = false
                    self.isTraitsLoaded = true
                }
            }
            
            guard changeCurrentIndex == true else { return }
            oldCell?.label.textColor = .white
            newCell?.label.textColor = self?.pinkColor
        }
        
        super.viewDidLoad()
        self.view.backgroundColor = primaryColor
        buttonBarView.frame = CGRect(x: 0, y: 14, width: buttonBarView.frame.width, height: buttonBarView.frame.height)
        containerView.isScrollEnabled = false
        setupIndicator()
    }
    
    private func setupIndicator() {
        NotificationCenter.default.addObserver(self, selector: #selector(stopIndicator), name: .traitsLoaded, object: nil)
        
        overlayView = UIView(frame: self.view.frame)
        overlayView.backgroundColor = UIColor.black
        overlayView.alpha = 0.5
        overlayView.isHidden = true
        
        activityIndicator = UIActivityIndicatorView(frame: self.view.frame)
        activityIndicator.startAnimating()
        self.overlayView.addSubview(activityIndicator)
        self.view.addSubview(self.overlayView)
    }
    
    @objc
    func stopIndicator() {
        isTraitsLoaded = true
        overlayView.isHidden = true
        print("ERDEM Stop")
        NotificationCenter.default.removeObserver(self)
    }
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        let championViewController = UIStoryboard.init(name: "Champions", bundle: nil).instantiateViewController(withIdentifier: "ChampionsViewController")
        
        let traitsViewController = UIStoryboard.init(name: "Traits", bundle: nil).instantiateViewController(withIdentifier: "TraitsViewController")
        
        return [championViewController, traitsViewController]
    }
}
