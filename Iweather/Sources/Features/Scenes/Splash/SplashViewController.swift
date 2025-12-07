//
//  SplashViewController.swift
//  Iweather
//
//  Created by pablo henrique on 07/12/25.
//

import Foundation
import UIKit

class SplashViewController: UIViewController {
    
    let contentView: SplashView
    weak var flowDelegate: SplashFlowDelegate?
    
    init(contentView: SplashView, flowDelegate: SplashFlowDelegate) {
        self.contentView = contentView
        self.flowDelegate = flowDelegate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        startBreathingAnimation()
        decideFlow()
    }
    
    private func setup() {
        view.addSubview(contentView)
        contentView.backgroundColor = Colors.gray900
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: view.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func decideFlow() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.5) { [ weak self ] in
            self?.flowDelegate?.navigateToHome()
        }
    }
}

extension SplashViewController {
    
    private func startBreathingAnimation() {
        UIView.animate(withDuration: 2.0,
                       delay: 0.0,
                       options: [.repeat, .autoreverse, .allowUserInteraction, .curveEaseInOut],
                       animations: {
                self.contentView.logoImageView.transform = CGAffineTransform(scaleX: 1.5, y: 1.6)
            }
        )
    }
}
