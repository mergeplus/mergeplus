//
//  SplashViewController.swift
//  mergeplus
//
//  Created by Tophun on 2021/11/04.
//

import UIKit
import Then
import SnapKit

class SplashViewController: UIViewController {
  
  // MARK: View
  private lazy var logoImageView = UIImageView().then {
    $0.image = UIImage(named: "mergeSymbolLogo")
    $0.contentMode = .scaleAspectFit
  }
  private lazy var typoImageView = UIImageView().then {
    $0.image = UIImage(named: "mergeTypoLogo")
    $0.contentMode = .scaleAspectFit
  }
  private lazy var companyImageView = UIImageView().then {
    $0.image = UIImage(named: "mergeholdings")
    $0.contentMode = .scaleAspectFit
  }
  
  // MARK: Object lifecycle
  
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    setup()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setup()
  }
  
  // MARK: Setup
  
  private func setup() {
    
  }
  
  // MARK: View lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    configuration()
    setupView()
    setupLayout()
    
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    
    self.perform(#selector(replaceRootView), with: nil, afterDelay: 2)
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
  }
  
  override func viewDidDisappear(_ animated: Bool) {
    super.viewDidDisappear(animated)
  }
  
  @objc func replaceRootView() {
    let viewController = ViewController()
    SceneDelegate.replace(rootView: viewController)
  }
}

extension SplashViewController {
  private func configuration() {
    view.backgroundColor = .mgRed
  }
  
  private func setupView() {
    [logoImageView, typoImageView, companyImageView].forEach {
      view.addSubview($0)
    }
  }
  
  private func setupLayout() {
    logoImageView.snp.makeConstraints {
      $0.centerX.equalToSuperview()
      $0.bottom.equalTo(typoImageView.snp.top).offset(-24)
    }
    
    typoImageView.snp.makeConstraints {
      $0.center.equalToSuperview()
    }
    
    companyImageView.snp.makeConstraints {
      $0.centerX.equalToSuperview()
      $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(30)
    }
  }
  
  private func updateView() {
    
  }
}
