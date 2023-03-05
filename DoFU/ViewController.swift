//
//  ViewController.swift
//  DoFU
//
//  Created by Home on 16.02.2023.
//

import UIKit
import Lottie

class ViewController: UIViewController {
    private var animationView: LottieAnimationView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupStartingAnimation()
    }
    
    
    
    
    func setupStartingAnimation() {
        animationView = .init(name: "liberate-ukraine")
        animationView.frame = view.frame
        animationView.contentMode = .scaleAspectFit
        animationView.animationSpeed = 1
        view.addSubview(animationView)
        
        animationView.play(toProgress: 0.983) {  [weak self] _ in
            self?.moveToCalcVC()
        }
    }
    
    
    private func moveToCalcVC() {
        UIView.animate(withDuration: 1) { [weak self] in
            let size = (self?.animationView.frame.size.width)! * 7
            let diffX = size - (self?.animationView.frame.size.width)!
            let diffY = (self?.animationView.frame.size.height)! - size
            
            self?.animationView.frame = CGRect(x: -(diffX/2), y: diffY/2, width: size, height: size)
            
            self?.animationView.alpha = 0
            
        } completion: { done in
            if done {
                let calcVC = CalcViewConroller()
                calcVC.modalTransitionStyle = .crossDissolve
                calcVC.modalPresentationStyle = .fullScreen
                self.present(calcVC, animated: true)
            }
        }
    }
}

