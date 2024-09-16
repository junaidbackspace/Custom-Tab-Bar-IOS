//
//  CustomTabBar.swift
//  expense mgt
//
//  Created by Umer Farooq on 07/09/2024.
//
import UIKit

class CustomTabBar: UITabBar {

    
    private var shapeLayer: CALayer?
    private let plusButton = UIButton()

    override func draw(_ rect: CGRect) {
        addShape()
        setupPlusButton()
    }

    private func addShape() {
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = createPath()
        shapeLayer.strokeColor = UIColor.gray.cgColor
        shapeLayer.fillColor = UIColor.cyan.withAlphaComponent(0.15).cgColor
        shapeLayer.lineWidth = 1.0

        if let oldShapeLayer = self.shapeLayer {
            layer.replaceSublayer(oldShapeLayer, with: shapeLayer)
        } else {
            layer.insertSublayer(shapeLayer, at: 0)
        }

        self.shapeLayer = shapeLayer
    }

    private func createPath() -> CGPath {
        let height: CGFloat = 35.0
        let path = UIBezierPath()

        let centerWidth = self.frame.width / 2
        path.move(to: CGPoint(x: 0, y: 0)) // start top left
        path.addLine(to: CGPoint(x: centerWidth - height, y: 0)) // the beginning of the trough

        path.addQuadCurve(to: CGPoint(x: centerWidth + height, y: 0),
                          controlPoint: CGPoint(x: centerWidth, y: height + 10))

        path.addLine(to: CGPoint(x: self.frame.width, y: 0)) // complete the rect
        path.addLine(to: CGPoint(x: self.frame.width, y: self.frame.height))
        path.addLine(to: CGPoint(x: 0, y: self.frame.height))
        path.close()

        return path.cgPath
    }

    private func setupPlusButton() {
        plusButton.setImage(UIImage(systemName: "plus"), for: .normal)
        plusButton.frame.size = CGSize(width: 50, height: 50)
        plusButton.center = CGPoint(x: self.frame.width / 2, y: 0)
        plusButton.tintColor = .blue
        plusButton.backgroundColor = .white
        plusButton.layer.cornerRadius = 25 // make it circular
        plusButton.addTarget(self, action: #selector(plusButtonTapped), for: .touchUpInside)

        self.addSubview(plusButton)
    }

    @objc private func plusButtonTapped() {
        print("Plus button clicked")
        animatePlusButton()
    }

    private func animatePlusButton() {
        // First scale up (bounce effect)
        UIView.animate(withDuration: 0.2, animations: {
            self.plusButton.transform = CGAffineTransform(scaleX: 1.2, y: 1.2) // scale up
        }) { _ in
            // Then scale down (return to slightly smaller size)
            UIView.animate(withDuration: 0.2, animations: {
                self.plusButton.transform = CGAffineTransform(scaleX: 0.9, y: 0.9) // scale down slightly
            }) { _ in
                // Finally, bring it back to normal size
                UIView.animate(withDuration: 0.2) {
                    self.plusButton.transform = .identity // return to original size
                }
            }
        }
    }


}
