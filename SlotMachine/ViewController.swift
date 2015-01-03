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
    
    //Кнопки
    var resetButton: UIButton!
    var betOneButton: UIButton!
    var betMaxButton: UIButton!
    var spinButton: UIButton!
    
    //Верхний контейнер
    var titleLabel: UILabel!
    
    //Константы
    let kMarginForView: CGFloat = 10.0
    let kMarginForSlot: CGFloat = 2.0
    
    let kSixth: CGFloat = 1/6
    let kThird: CGFloat = 1/3
    
    let kNumberOfContainers = 3
    let kNumberOfSlots = 3
    
    let kHalf: CGFloat = 1/2
    let kEight: CGFloat = 1/8

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setupContainerViews()
        setupFirstContainer(self.firstContainer)
        setupSecondContainer(self.secondContainer)
        setupThirdContainer(self.thirdContainer)
        setupFourthContainer(self.fourthContainer)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func resetButtonPressed(button: UIButton) {
        println("resetButtonPressed")
    }
    
    func betOneButtonPressed(button: UIButton) {
        println("betOneButtonPressed")
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
        
        self.betLabel = UILabel()
        self.betLabel.text = "0000"
        self.creditsLabel.textColor = UIColor.redColor()
        self.betLabel.font = UIFont(name: "Menlo-Bold", size: 16)
        self.betLabel.sizeToFit()
        self.betLabel.center = CGPointMake(viewContainer.frame.width * kSixth * 3, viewContainer.frame.height * kThird)
        self.betLabel.textAlignment = NSTextAlignment.Center
        self.betLabel.backgroundColor = UIColor.darkGrayColor()
        viewContainer.addSubview(self.betLabel)
        
        self.winnerPaidLabel = UILabel()
        self.winnerPaidLabel.text = "000000"
        self.winnerPaidLabel.textColor = UIColor.redColor()
        self.winnerPaidLabel.font = UIFont(name: "Menlo-Bold", size: 16)
        self.winnerPaidLabel.sizeToFit()
        self.winnerPaidLabel.center = CGPointMake(viewContainer.frame.width * kSixth * 5, viewContainer.frame.height * kThird)
        self.winnerPaidLabel.textAlignment = NSTextAlignment.Center
        self.winnerPaidLabel.backgroundColor = UIColor.darkGrayColor()
        viewContainer.addSubview(self.winnerPaidLabel)
        
        self.creditsTitleLabel = UILabel()
        self.creditsTitleLabel.text = "Credits"
        self.creditsTitleLabel.textColor = UIColor.blackColor()
        self.creditsTitleLabel.font = UIFont(name: "AmericanTypewriter", size: 14)
        self.creditsTitleLabel.sizeToFit()
        self.creditsTitleLabel.center = CGPointMake(viewContainer.frame.width * kSixth, viewContainer.frame.height * kThird * 2)
        viewContainer.addSubview(self.creditsTitleLabel)
        
        self.betTitleLabel = UILabel()
        self.betTitleLabel.text = "Bet"
        self.betTitleLabel.textColor = UIColor.blackColor()
        self.betTitleLabel.font = UIFont(name: "AmericanTypewriter", size: 14)
        self.betTitleLabel.sizeToFit()
        self.betTitleLabel.center = CGPointMake(viewContainer.frame.width * kSixth * 3, viewContainer.frame.height * kThird * 2)
        viewContainer.addSubview(self.betTitleLabel)
        
        self.winnerTitleLabel = UILabel()
        self.winnerTitleLabel.text = "Winner paid"
        self.winnerTitleLabel.textColor = UIColor.blackColor()
        self.winnerTitleLabel.font = UIFont(name: "AmericanTypewriter", size: 14)
        self.winnerTitleLabel.sizeToFit()
        self.winnerTitleLabel.center = CGPointMake(viewContainer.frame.width * kSixth * 5, viewContainer.frame.height * kThird * 2)
        viewContainer.addSubview(self.winnerTitleLabel)
    }
    
    func setupFourthContainer(viewContainer: UIView) {
        self.resetButton = UIButton()
        self.resetButton.setTitle("Reset", forState: UIControlState.Normal)
        self.resetButton.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        self.resetButton.titleLabel?.font = UIFont(name: "Superclarendon-Bold", size: 12)
        self.resetButton.backgroundColor = UIColor.lightGrayColor()
        self.resetButton.sizeToFit()
        self.resetButton.center = CGPointMake(viewContainer.frame.width * kEight, viewContainer.frame.height * kHalf)
        self.resetButton.addTarget(self, action: "resetButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        viewContainer.addSubview(self.resetButton)
        
        self.betOneButton = UIButton()
        self.betOneButton.setTitle("Bet One", forState: UIControlState.Normal)
        self.betOneButton.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        self.betOneButton.titleLabel?.font = UIFont(name: "Superclarendon-Bold", size: 12)
        self.betOneButton.backgroundColor = UIColor.lightGrayColor()
        self.betOneButton.sizeToFit()
        self.betOneButton.center = CGPointMake(viewContainer.frame.width * kEight * 3, viewContainer.frame.height * kHalf)
        self.betOneButton.addTarget(self, action: "betOneButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        viewContainer.addSubview(self.betOneButton)
    }

}

