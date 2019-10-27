//
//  ModalViewController+Animations.swift
//  TFT Asistant
//
//  Created by erdem on 27.10.2019.
//  Copyright © 2019 Erdem Isguder. All rights reserved.
//

import Foundation
import UIKit

extension ModalViewController{
    // MARK: Gestures
    @objc
    func handleModalTap(recognizer: UITapGestureRecognizer){
        switch recognizer.state {
        case .ended:
            animateTransitionIfNeeded(state: nextState, duration: 0.9)
        default:
            break
        }
    }
    
    @objc
    func handleModalPan(recognizer: UIPanGestureRecognizer){
        switch recognizer.state {
        case .began:
            startInteractiveTransition(state: nextState, duration: 0.9)
        case .changed:
            let translation = recognizer.translation(in: self.thumbView)
            var fractionComplete = translation.y / self.modalView.frame.height
            fractionComplete = modalVisible ? fractionComplete : -fractionComplete
            updateInteractiveTransition(fractionComplated: fractionComplete)
        case .ended:
            continueInteractiveTransition()
        default:
            break
        }
    }
    // MARK: Transitions
    private func animateTransitionIfNeeded(state: State, duration: TimeInterval){
        if runningAnimations.isEmpty{
            let frameAnimator = UIViewPropertyAnimator(duration: duration, dampingRatio: 1, animations: {
                switch state{
                case .expanded:
                    self.modalView.frame.origin.y = self.view.frame.height - self.modalView.frame.height
                case .collapsed:
                    self.modalView.frame.origin.y = self.view.frame.height - self.thumbView.frame.height
                }
            })
            
            frameAnimator.addCompletion { _ in
                self.modalVisible = !self.modalVisible
                self.runningAnimations.removeAll()
                
                if !self.modalVisible{
                    self.dismiss(animated: false, completion: nil)
                }
            }
            
            frameAnimator.startAnimation()
            runningAnimations.append(frameAnimator)
            
            let blurAnimator = UIViewPropertyAnimator(duration: duration, dampingRatio: 1, animations: {
                switch state{
                case .expanded:
                    self.visualEffectView.effect = UIBlurEffect(style: .extraLight)
                case .collapsed:
                    self.visualEffectView.effect = nil
                }
            })
            
            blurAnimator.startAnimation()
            runningAnimations.append(blurAnimator)
            
            let conerRadiusAnimator = UIViewPropertyAnimator(duration: duration, dampingRatio: 1, animations: {
                switch state{
                case .expanded:
                    self.modalView.layer.cornerRadius = 12
                case .collapsed:
                    self.modalView.layer.cornerRadius = 0
                }
            })
            
            conerRadiusAnimator.startAnimation()
            runningAnimations.append(conerRadiusAnimator)
            
            
        }
    }
    
    func animateModalOnLoad(state: State, duration: TimeInterval){
        if runningAnimations.isEmpty{
            animateTransitionIfNeeded(state: state, duration: duration)
        }
    }
    
    private func startInteractiveTransition(state: State, duration: TimeInterval){
        if runningAnimations.isEmpty{
            animateTransitionIfNeeded(state: state, duration: duration)
        }
        
        for animator in runningAnimations{
            animator.pauseAnimation()
            animationProgressWhenInterrupdated = animator.fractionComplete
        }
    }
    
    private func updateInteractiveTransition(fractionComplated: CGFloat){
        for animator in runningAnimations{
            animator.fractionComplete = fractionComplated + animationProgressWhenInterrupdated
        }
    }
    
    private func continueInteractiveTransition(){
        for animator in runningAnimations{
            animator.continueAnimation(withTimingParameters: nil, durationFactor: 0)
        }
    }
}
