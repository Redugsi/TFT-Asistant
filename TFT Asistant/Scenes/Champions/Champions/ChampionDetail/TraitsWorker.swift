//
//  TraitsWorker.swift
//  TFT Asistant
//
//  Created by erdem on 28.10.2019.
//  Copyright (c) 2019 Erdem Isguder. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit
import Domain

class TraitsWorker
{
    let championUseCase: ChampionsUseCase
    let originsUseCase: OriginsUseCase
    let classesUseCase: ClassesUseCase
    
    init(championUseCase: ChampionsUseCase,
         originsUseCase: OriginsUseCase,
         classesUseCase: ClassesUseCase) {
        
        self.championUseCase = championUseCase
        self.originsUseCase = originsUseCase
        self.classesUseCase = classesUseCase
    }
    
    func getAllTraits() -> Traits.GetAllTraits.Response {
        
        let originsViewModels = originsUseCase.getOrigins()?.map {
            Traits.TraitViewModel(key: $0.key, name: $0.name, description: $0.originDescription, accentChampionImage: $0.accentChampionImage, bonuses: $0.bonuses.map{
                Traits.BonusViewModel(needed: $0.needed, effect: $0.effect)
            }, champions: getChampions(by: $0.name))
            } ?? [Traits.TraitViewModel]()
        
        let classesViewModels = classesUseCase.getClasses()?.map {
            Traits.TraitViewModel(key: $0.key, name: $0.name, description: $0.classDescription, accentChampionImage: $0.accentChampionImage, bonuses: $0.bonuses.map{
                Traits.BonusViewModel(needed: $0.needed, effect: $0.effect)
            }, champions: getChampions(with: $0.name))
        } ?? [Traits.TraitViewModel]()
        
        let traitViewModels = originsViewModels + classesViewModels
        
        let resultModel = traitViewModels.sorted { (first, second) -> Bool in
            guard let firstName = first.name else {
                return false
            }
            
            guard let secondName = second.name else {
                return true
            }
            return firstName.compare(secondName) == ComparisonResult.orderedAscending
        }
        
        return Traits.GetAllTraits.Response(traitViewModels: resultModel)
    }
    
    private func getChampions(by originName: String?) -> [Traits.ChampionViewModel]? {
        guard let originName = originName else {
            return nil
        }
        
        return championUseCase.getChampions()?
            .filter { $0.origin.contains(originName)}
            .map { Traits.ChampionViewModel(name: $0.name, cost: $0.cost)}
    }
    
    private func getChampions(with className: String?) -> [Traits.ChampionViewModel]? {
        guard let className = className else {
            return nil
        }
        
        return championUseCase.getChampions()?
            .filter { $0.championClass.contains(className)}
            .map { Traits.ChampionViewModel(name: $0.name, cost: $0.cost)}
    }
}
