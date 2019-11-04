//
//  ItemsMain+IndicatorInfoProvider.swift
//  TFT Asistant
//
//  Created by Erdem Isguder on 4.11.2019.
//  Copyright © 2019 Erdem Isguder. All rights reserved.
//

import Foundation
import XLPagerTabStrip

extension ItemBuilderViewController: IndicatorInfoProvider {
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "Item Builder")
    }
}

extension BaseItemsViewController: IndicatorInfoProvider {
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "Base Items")
    }
}

extension CombinationsViewController: IndicatorInfoProvider {
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(stringLiteral: "Combinations")
    }
}
