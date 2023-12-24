//
//  MoveCircle.swift
//  PlaysForCatv1
//
//  Created by azinavi on 24/12/23.
//

/// Homework: На экране кружок по центру. Четыре кнопки - вверх, вниз, вправо,влево. При нажатии кнопки кружок перемещается на фиксированноерасстояние. За края экрана не выходит, на кнопки не налезает

import UIKit

class MoveCircle: UIViewController {
    
    var circleView: UIView!
    let circleSize: CGFloat = 70
    var buttonToMoveCircle: [UIButton] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCircleView()
        arrowsToMoveCircle()
        
    }


    //  Setup for circle
    func setupCircleView() {
        circleView = UIView(frame: CGRect(x: view.center.x - circleSize/2, y: view.center.y - circleSize/2, width: circleSize, height: circleSize))
        circleView.backgroundColor = UIColor.systemPink
        circleView.layer.cornerRadius = circleSize / 2
        circleView.layer.borderWidth = 1
        circleView.layer.borderColor = UIColor.red.cgColor
        circleView.layer.shadowOpacity = 1.5
        circleView.layer.shadowColor = UIColor.black.cgColor
        circleView.layer.shadowOffset = CGSize(width: 10, height: 10)
        view.addSubview(circleView)
        view.backgroundColor = UIColor.yellow
    }
    
    //  Setup for buttons
    func arrowsToMoveCircle() {
        let upBotton = createButton(name: "▲", frame: CGRect(x: view.center.x - 20, y: 50, width: 40, height: 40))
        upBotton.backgroundColor = UIColor.systemBlue
        upBotton.tintColor = UIColor.white
        let dowmBotton = createButton(name: "▼", frame: CGRect(x: view.center.x - 20, y: 140, width: 40, height: 40))
        dowmBotton.backgroundColor = UIColor.systemBlue
        dowmBotton.tintColor = UIColor.white
        let rightBotton = createButton(name: "▶", frame: CGRect(x: view.center.x + 25, y: 95, width: 40, height: 40))
        rightBotton.backgroundColor = UIColor.systemBlue
        rightBotton.tintColor = UIColor.white
        let leftBotton = createButton(name: "◀", frame: CGRect(x: view.center.x - 65, y: 95, width: 40, height: 40))
        leftBotton.backgroundColor = UIColor.systemBlue
        leftBotton.tintColor = UIColor.white
        let resetButton = createButton(name: "🔄", frame: CGRect(x: view.center.x - 20, y: 95, width: 40, height: 40))
        resetButton.backgroundColor = UIColor.systemBlue
        resetButton.tintColor = UIColor.white
        
        buttonToMoveCircle = [upBotton, dowmBotton, rightBotton, leftBotton, resetButton]
        
        // adds buttons to the VIEW
        for button in buttonToMoveCircle {
            view.addSubview(button)
        }
    }
    
    //  Custom method creates button
    func createButton(name: String, frame: CGRect) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(name, for: .normal)
        button.frame = frame
        button.addTarget(self, action: #selector(moveCircle(_:)), for: .touchUpInside)
        return button
    }

    @objc func moveCircle(_ sender: UIButton) {
        var newFrame = circleView.frame
        
        switch sender.titleLabel?.text {
        case "▲":
            newFrame.origin.y -= 30
        case "▼":
            newFrame.origin.y += 30
        case "▶":
            newFrame.origin.x += 30
        case "◀":
            newFrame.origin.x -= 30
        case "🔄":
            newFrame.origin.x = view.center.x - self.circleSize/2
            newFrame.origin.y = view.center.y - self.circleSize/2
        default:
            break
        }
        
        if isFrameValid(frame: newFrame) {
            UIView.animate(withDuration: 0.4) {
                self.circleView.frame = newFrame
            }
        }
    }
    
    // check not to go beyond
    func isFrameValid(frame: CGRect) -> Bool {
        if (frame.minX < 0 || frame.minY < 0 || frame.maxX > view.frame.width || frame.maxY > view.frame.height+10) {
            return false
        }
        for button in buttonToMoveCircle {
            if frame.intersects(button.frame) {
                return false
            }
        }
        return true
    }
}

