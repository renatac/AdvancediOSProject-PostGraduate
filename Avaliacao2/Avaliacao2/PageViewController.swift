//
//  PageViewController.swift
//  Avaliacao2
//
//  Created by RENATA on 15/04/21.
//

import UIKit
import Nuke

//Para representar uma das nossas páginas
class PageViewController: UIViewController {
    var page: Page
    
    lazy var image: UIImageView = {
        let image = UIImageView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        image.image = UIImage(named:"time.png")
        self.view.addSubview(image)
        return image
    }()
    
    lazy var titleLabel: UILabel = {
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        titleLabel.textAlignment = .center
        titleLabel.text = "Olá"
        return titleLabel
    }()
    
    lazy var descr: UILabel = {
        let descr = UILabel(frame: CGRect(x: 0, y: 0, width: 350, height: 42))
        descr.textAlignment = .center
        descr.lineBreakMode = .byWordWrapping
        descr.numberOfLines = 2
        descr.text = page.subtitle
        return descr
    }()
    
    private lazy var jumpBtn: UIButton = {
        let jumpBtn = UIButton()
        jumpBtn.translatesAutoresizingMaskIntoConstraints = false
        jumpBtn.setTitle("Pular", for: .normal)
        jumpBtn.backgroundColor = .black
        jumpBtn.layer.cornerRadius = jumpBtn.bounds.size.height/2
        jumpBtn.addTarget(self, action: #selector(goToNextPageOk), for: .touchUpInside)
        return jumpBtn
    }()
    
    init(with page: Page) {
        self.page = page
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        image.center = CGPoint(x: 200, y: 200)
        titleLabel.center = CGPoint(x: 200, y: 450)
        descr.center = CGPoint(x: 200, y: 500)
        setupButton()
        
        self.view.addSubview(image)
        self.view.addSubview(titleLabel)
        self.view.addSubview(descr)
    }
    
    private func setupButton() {
        view.addSubview(jumpBtn)
        
        NSLayoutConstraint.activate([
            jumpBtn.widthAnchor.constraint(equalToConstant: 100),
            jumpBtn.heightAnchor.constraint(equalToConstant: 44)
        ])
        
        NSLayoutConstraint(item: jumpBtn, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leadingMargin, multiplier: 1.0, constant: 00.0).isActive = true
        
        NSLayoutConstraint(item: jumpBtn, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailingMargin, multiplier: 1.0, constant: 0.0).isActive = true
        
        NSLayoutConstraint(item: jumpBtn, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottomMargin, multiplier: 1.0, constant: 0.0).isActive = true
    }
    
    @objc
    func goToNextPageOk() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let secondVC = storyboard.instantiateViewController(identifier: "MainController")
        show(secondVC, sender: self)
    }
}
