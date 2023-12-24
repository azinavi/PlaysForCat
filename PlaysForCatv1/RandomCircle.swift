//
//  ViewController.swift
//  PlaysForCatv1
//
//  Created by azinavi on 24/12/23.
//


/// Homework: Игрушка для котиков - появление разноцветного кружочка, по тапу исчезает и появляется в новом месте (кодом)
import UIKit

class RandomCircle: UIViewController {
    
    var clubView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(circleTapped))
        view.addGestureRecognizer(tapGesture)

        createCircleView()
        
    }
    
    
    func createCircleView() {
        let circleSize: CGFloat = 100
        let randomX = CGFloat.random(in: 0...(view.bounds.width - circleSize))
        let randomY = CGFloat.random(in: 0...(view.bounds.height - circleSize))
        
        clubView = UIView(frame: CGRect(x: randomX, y: randomY, width: circleSize, height: circleSize))
        clubView.backgroundColor = UIColor.systemPink
        clubView.layer.cornerRadius = circleSize / 2
        view.addSubview(clubView)
        view.backgroundColor = UIColor.yellow
    }
    
    
    @objc func circleTapped() {
        let circleSize: CGFloat = 100
        
        let randomX = CGFloat.random(in: 0...(view.bounds.width - circleSize))
        let randomY = CGFloat.random(in: 0...(view.bounds.height - circleSize))
        
        UIView.animate(withDuration: 0.3) {
            self.clubView.frame = CGRect(x: randomX, y: randomY, width: circleSize, height: circleSize)
        }
    }
    
    @objc func moveCircleRight() {
        UIView.animate(withDuration: 0.3) {
            self.clubView.frame.origin.x += 10
        }
    }


}





 /* - ДЗ:
• Функция Random - самостоятельно, найти и изучить применение
• Игрушка для котиков - появление разноцветного кружочка, по тапу
исчезает и появляется в новом месте (кодом)


• По нажатию кнопки экран заполняется разноцветными квадратами (3 штуки) с
фиксированной стороной. Квадраты не пересекаются


• На экране кружок по центру. Четыре кнопки - вверх, вниз, вправо,
влево. При нажатии кнопки кружок перемещается на фиксированное
расстояние. За края экрана не выходит, на кнопки не налезает */
