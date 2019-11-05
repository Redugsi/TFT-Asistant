//
//  ChampionsMain+IndicatorInfoProvider.swift
//  TFT Asistant
//
//  Created by erdem on 5.11.2019.
//  Copyright © 2019 Erdem Isguder. All rights reserved.
//

import Foundation
import XLPagerTabStrip

extension ChampionsViewController: IndicatorInfoProvider {
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "Champions")
    }
}

extension TraitsViewController: IndicatorInfoProvider {
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(stringLiteral: "Traits")
    }
}
