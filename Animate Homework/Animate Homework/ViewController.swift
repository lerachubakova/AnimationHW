//
//  ViewController.swift
//  Animate Homework
//
//  Created by Пользователь on 10.02.21.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK:- @IBOutlets
    @IBOutlet weak var viewForAnimation: UIImageView!
    
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var widthSlider: UISlider!
    
    @IBOutlet weak var widthConstraint: NSLayoutConstraint!
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var horizontalConstraint: NSLayoutConstraint!
    @IBOutlet weak var verticalConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var upButton: UIButton!
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    @IBOutlet weak var downButton: UIButton!
    
    //MARK:-
    var startHeight: CGFloat = 0.0
    var startWidth: CGFloat = 0.0
  
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startWidth = widthConstraint.constant
        startHeight = heightConstraint.constant
        
//       let tapUpButton = UITapGestureRecognizer(target: self, action: #selector(goUp(_:)))
//        tapUpButton.numberOfTapsRequired = 1
//        tapUpButton.numberOfTouchesRequired = 1
//
//        upButton.addGestureRecognizer(tapUpButton)
        
        let gLPR  = UILongPressGestureRecognizer(target: self, action: #selector(goUp(_:)))
        gLPR.minimumPressDuration = 0.0
        upButton.addGestureRecognizer(gLPR)
        
        
     //   let pan = UIPanGestureRecognizer(target: self, action: #selector(goUp(_:)))
      //  pan.maximumNumberOfTouches = 1
        
      //  upButton.addGestureRecognizer(pan)
        
        //        loginErrorLabel.isUserInteractionEnabled = true
        //        loginErrorLabel.isHidden = true
        
        // Do any additional setup after loading the view.
    }
    
    
    //MARK:- @IBActions
    @IBAction func heighSliderValueChanged(_ sender: UISlider) {
        
        let newHeight = CGFloat((Float(startHeight) * Float(heightSlider.value)))
        
        let ourBounds = self.view.bounds
        
        let isUp: Bool = ourBounds.height / 2 + verticalConstraint.constant - newHeight / 2 > ourBounds.minY
        let isDown: Bool = ourBounds.height / 2 + verticalConstraint.constant + newHeight / 2 < ourBounds.maxY
       
        if isUp && isDown { heightConstraint.constant = newHeight}
        
    }
    
    @IBAction func widthSliderChangedValue(_ sender: UISlider) {
        
        let newWidth = CGFloat((Float(startWidth) * Float(widthSlider.value)))
        
        let ourBounds = self.view.bounds
        
        let isLeft: Bool = ourBounds.width / 2 + horizontalConstraint.constant - newWidth / 2 > ourBounds.minX
        let isRight: Bool = ourBounds.width / 2 + horizontalConstraint.constant + newWidth / 2 < ourBounds.maxX
        
        if  isLeft && isRight { widthConstraint.constant = newWidth }
        
    }
    
    
    @IBAction func leftButton(_ sender: UIButton) {
        let newHorizontConstant = horizontalConstraint.constant - 10

        if self.view.bounds.width / 2 + newHorizontConstant - widthConstraint.constant / 2  > self.view.bounds.minX {
        horizontalConstraint.constant = newHorizontConstant
        }
    }
    
    @IBAction func rightButton(_ sender: UIButton) {
        let newHorizontConstant = horizontalConstraint.constant + 10

        if self.view.bounds.width / 2 + newHorizontConstant + widthConstraint.constant / 2  < self.view.bounds.maxX {
        horizontalConstraint.constant = newHorizontConstant
        }
    }
    
//    @IBAction func goUp(_ gesture: UITapGestureRecognizer){
//        print("!")
//        switch gesture.state{
//        case .began:
//            print("!")
//        case .possible:
//            print("!!")
//        case .changed:
//            print("!!!")
//        case .ended:
//            print("!!!!")
//        case .cancelled:
//            print("!!!!!")
//        case .failed:
//            print("!!!!!!!")
//        @unknown default:
//            print("1")
//        }
//        let newVerticalConstant = verticalConstraint.constant - 10
//
//        if self.view.bounds.height / 2 + newVerticalConstant - heightConstraint.constant / 2  > self.view.bounds.minY {
//            verticalConstraint.constant = newVerticalConstant
//        }
//    }
    
    var i = 0
    var check: UILongPressGestureRecognizer.State = .ended
    
    
    @IBAction func goUp(_ gesture: UILongPressGestureRecognizer){
        print("Sign in method")
        switch gesture.state {
            case .began:
                print("began")
                check = .began
            case .ended:
                print("ended")
                check = .ended
            case .possible:
                print("possible")
            case .changed:
                print("changed")
            case .cancelled:
                print("cancelled")
            case .failed:
                print("failed")
            @unknown default:
                print("default")
        }
        
    }
    
    
    @IBAction func upButton(_ sender: UIButton) {
        
    }
    
    @IBAction func downButton(_ sender: UIButton) {
        let newVerticalConstant = verticalConstraint.constant + 10

        if self.view.bounds.height / 2 + newVerticalConstant + heightConstraint.constant / 2  < self.view.bounds.maxY {
            verticalConstraint.constant = newVerticalConstant
        }
    }
    
    
    
    func up(){
        
        let newVerticalConstant = verticalConstraint.constant - 10
        
        let isPossible = self.view.bounds.height / 2 + newVerticalConstant - heightConstraint.constant / 2  > self.view.bounds.minY
        
        if isPossible {
            verticalConstraint.constant = newVerticalConstant
        }
    
    }
    
    //cltkfnm
    //long tap
    //контекстное меню
    //отловить момент нажатия
    //запускать цикл(периодическую функцию)
    //через 0.02 секунды проверка, отпущена ли кнопка
    
    //
}

