//
//  RandomSquareApperance.swift
//  PlaysForCatv1
//
//  Created by azinavi on 24/12/23.
//

///     Homework: По нажатию кнопки экран заполняется разноцветными квадратами (3 штуки) с фиксированной стороной. Квадраты не пересекаются

import UIKit

class RandomSquareApperance: UIViewController {
    
    var squares: [UIView] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupButton()
        
    }
    
    func setupButton() {
        let startGameButton = createButton(name: "Start GAME", frame: CGRect(x: view.center.x - 50, y: view.center.y - 15, width: 100, height: 30))
        startGameButton.tintColor = UIColor.white
        startGameButton.backgroundColor = UIColor.systemPink
        startGameButton.layer.cornerRadius = 15
        startGameButton.layer.borderWidth = 1
        startGameButton.layer.borderColor = UIColor.red.cgColor
        self.view.addSubview(startGameButton)
    }
    
    func createButton(name: String, frame: CGRect) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(name, for: .normal)
        button.frame = frame
        button.addTarget(self, action: #selector(buttonAction(_:)), for: .touchUpInside)
        return button
    }
    
    @objc func buttonAction(_ sender: UIButton!) {
        removeSquares()
        createSquares()
    }
    
    // remove squares
    func removeSquares() {
        for square in squares {
            square.removeFromSuperview()
        }
        squares.removeAll()
    }
    
    // create new squares
    func createSquares() {
        let squareSide: CGFloat = 100
        let colors: [UIColor] = [.red, .green, .yellow, .systemPink, .purple, .blue, .brown, .orange, .white]

        for _ in 0..<5{
            var intersects = false
            var attempts = 0
            
            var newSquare: UIView!
            repeat {
                attempts += 1
                
                if attempts > 100 {
                    break
                }
                
                let randomX = CGFloat.random(in: 0...(self.view.frame.width - squareSide))
                let randomY = CGFloat.random(in: 0...(self.view.frame.height - squareSide))
                let randomColor = colors.randomElement()!
                
                let squareFrame = CGRect(x: randomX, y: randomY, width: squareSide, height: squareSide)
                
                newSquare = UIView(frame: squareFrame)
                newSquare.backgroundColor = randomColor
                newSquare.layer.cornerRadius = 10
                newSquare.layer.borderWidth = 0.5
                newSquare.layer.shadowOpacity = 2
                newSquare.layer.shadowOffset = CGSize(width: 5, height: 5)
                
                let buttonFrame = self.view.subviews.first(where: { $0 is UIButton })?.frame ?? CGRect.zero
                let buttonArea = buttonFrame.insetBy(dx: -20, dy: -20)
                
                intersects = squares.contains { $0.frame.intersects(squareFrame) } || buttonArea.intersects(squareFrame)
            } while intersects
            
            if !intersects {
                squares.append(newSquare)
                self.view.addSubview(newSquare)
            }
        }
    }
        

}
