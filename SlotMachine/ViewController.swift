//
//  ViewController.swift
//  SlotMachine
//
//  Created by Александр Подрабинович on 03/01/15.
//  Copyright (c) 2015 Alex Podrabinovich. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Контейнеры с информацией
    var firstContainer: UIView!
    var secondContainer: UIView!
    var thirdContainer: UIView!
    var fourthContainer: UIView!
    
    //Информационные лейблы
    var creditsLabel: UILabel!
    var betLabel: UILabel!
    var winnerPaidLabel: UILabel!
    var creditsTitleLabel: UILabel!
    var betTitleLabel: UILabel!
    var winnerTitleLabel: UILabel!
    
    //Верхний контейнер
    var titleLabel: UILabel!
    
    //Константы
    let kMarginForView: CGFloat = 10.0
    let kMarginForSlot: CGFloat = 2.0
    
    let kSixth: CGFloat = 1/6
    let kThird: CGFloat = 1/3
    
    let kNumberOfContainers = 3
    let kNumberOfSlots = 3

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setupContainerViews()
        setupFirstContainer(self.firstContainer)
        setupSecondContainer(self.secondContainer)
        setupThirdContainer(self.thirdContainer)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func setupContainerViews() {
        self.firstContainer = UIView(frame: CGRectMake(self.view.bounds.origin.x + kMarginForView, self.view.bounds.origin.y, self.view.bounds.width - (kMarginForView*2), self.view.bounds.height * kSixth))
        self.firstContainer.backgroundColor = UIColor.redColor()
        self.view.addSubview(firstContainer)
        
        self.secondContainer = UIView(frame: CGRectMake(self.view.bounds.origin.x + kMarginForView, firstContainer.frame.height, self.view.bounds.width - (kMarginForView*2), self.view.bounds.height * kSixth * 3))
        self.secondContainer.backgroundColor = UIColor.blackColor()
        self.view.addSubview(secondContainer)
        
        self.thirdContainer = UIView(frame: CGRectMake(self.view.bounds.origin.x + kMarginForView, firstContainer.frame.height + secondContainer.frame.height, self.view.bounds.width - (kMarginForView*2), self.view.bounds.height * kSixth))
        self.thirdContainer.backgroundColor = UIColor.lightGrayColor()
        self.view.addSubview(thirdContainer)
        
        self.fourthContainer = UIView(frame: CGRectMake(self.view.bounds.origin.x + kMarginForView, firstContainer.frame.height + secondContainer.frame.height + thirdContainer.frame.height, self.view.bounds.width - (kMarginForView*2), self.view.bounds.height * kSixth))
        self.fourthContainer.backgroundColor = UIColor.blackColor()
        self.view.addSubview(fourthContainer)
    }
    
    func setupFirstContainer(viewContainer: UIView) {
        self.titleLabel = UILabel()
        self.titleLabel.text = "Super Slots"
        self.titleLabel.textColor = UIColor.yellowColor()
        self.titleLabel.font = UIFont(name: "MarkerFelt-Wide", size: 40)
        self.titleLabel.sizeToFit()
        self.titleLabel.center = viewContainer.center
        
        viewContainer.addSubview(self.titleLabel)
    }
    
    func setupSecondContainer(viewContainer: UIView) {
        for var containerNumber=0; containerNumber<kNumberOfContainers; containerNumber++ {
            for var slotNumber=0; slotNumber<kNumberOfSlots; slotNumber++ {
                var imageView = UIImageView()
                imageView.backgroundColor = UIColor.yellowColor()
                    imageView.frame = CGRectMake(viewContainer.bounds.origin.x + (viewContainer.bounds.size.width * CGFloat(slotNumber) * kThird), viewContainer.bounds.origin.y + (viewContainer.bounds.size.height * CGFloat(containerNumber) * kThird), viewContainer.bounds.width * kThird - kMarginForSlot, viewContainer.bounds.height * kThird - kMarginForSlot)
                
                viewContainer.addSubview(imageView)
            }
        }
    }
    
    func setupThirdContainer(viewContainer: UIView) {
        self.creditsLabel = UILabel()
        self.creditsLabel.text = "000000"
        self.creditsLabel.textColor = UIColor.redColor()
        self.creditsLabel.font = UIFont(name: "Menlo-Bold", size: 16)
        self.creditsLabel.sizeToFit()
        self.creditsLabel.center = CGPointMake(viewContainer.frame.width * kSixth, viewContainer.frame.height * kThird)
        self.creditsLabel.textAlignment = NSTextAlignment.Center
        self.creditsLabel.backgroundColor = UIColor.darkGrayColor()
        viewContainer.addSubview(self.creditsLabel)
    }

}

