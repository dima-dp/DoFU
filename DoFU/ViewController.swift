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
    
    
    
// MARK -> Animation function
    func setupStartingAnimation() {
        animationView = .init(name: "liberate-ukraine")
        animationView.frame = view.frame
        animationView.contentMode = .scaleAspectFit
        animationView.animationSpeed = 1
        view.addSubview(animationView)
        
        animationView.play(toProgress: 0.983) {  [weak self] _ in  //0.983 - 98,3% of animation playing
            self?.moveToCalcVC()
        }
    }
    
// MARK -> Function to push CalcViewController with size and alpha animations
    private func moveToCalcVC() {
        UIView.animate(withDuration: 1) { [weak self] in
            let size = (self?.animationView.frame.size.width)! * 7
            let diffX = size - (self?.animationView.frame.size.width)!
            let diffY = (self?.animationView.frame.size.height)! - size
            
            self?.animationView.frame = CGRect(x: -(diffX/2), y: diffY/2, width: size, height: size)
            
            self?.animationView.alpha = 0
            
        } completion: { [weak self] done in
            if done {
                let storyboardName = "Main"
                let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
                let identifier = "TabBarController"
                let tabBarcontroller = storyboard.instantiateViewController(withIdentifier: identifier)
                tabBarcontroller.modalTransitionStyle = .crossDissolve
                tabBarcontroller.modalPresentationStyle = .fullScreen
                self?.present(tabBarcontroller, animated: true)
                
            }
        }
    }
}

