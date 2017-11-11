import Foundation
import UIKit

struct Move {
    var x:CGFloat!
    var y:CGFloat!
    var rot:CGFloat?
    
    init(x: CGFloat, y: CGFloat) {
        self.x = x
        self.y = y
    }
}

enum SeenObject : Int {
    case UP = 0
    case DOWN = 2
    case LEFT = 3
    case RIGTH = 1
}

class Carro {
    var isMoving = false
    let asset:UIView!
    var queue:[Move]!
    var moves = 0.0
    var lastRot:SeenObject
    var containerView:UIView!
    
    init(pista:UIView) {
        containerView = pista
        asset = UIImageView(image: UIImage(named: "carro"))
        
        var bounds = CGRect()
        bounds.origin = CGPointZero
        bounds.size = CGSize(width: 19.0, height: 38.0)
        
        asset.bounds = bounds
        asset.center = containerView.center
        
        
        containerView.addSubview(asset)
        
        asset.frame.offsetInPlace(dx: -20.0, dy: -7)
        
        
        asset.transform = CGAffineTransformMakeRotation(CGFloat(M_PI/2))
        
        queue = []
        lastRot = .LEFT
    }
    
    func moveLeft() {
        var mov = Move(x: 0, y: 0)
        mov.rot = (-90 * CGFloat(moves))
        lastRot = SeenObject(rawValue: Int(moves))!
        
        moves = ++moves % 4
        
        queue.append(mov)
        animate()
    }
    
    func moveStraight() {
        var move = Move(x: 0, y: 0)
        
        switch lastRot {
        case .UP:
            move.y = 50.0
            break
        case .DOWN:
            move.y = -50.0
            break
        case .LEFT:
            move.x = -50.0
            break
        default:
            move.x = 50.0
            break
        }
        
        queue.append(move)
        animate()
    }
    
    private func makeRadians(degress:CGFloat) -> CGFloat {
        return (degress / 180.0) * CGFloat(M_PI)
    }
    
    private func animate() {
        if !self.isMoving {
            func anime() {
                if let move = self.queue.first {
                    self.asset.frame.offsetInPlace(dx: move.x, dy: move.y)
                    self.isMoving = true;
                    if let angle = move.rot {
                        self.asset.transform = CGAffineTransformMakeRotation(makeRadians(angle))
                    }
                    
                }
            }
            
            func animateEnd(finish:Bool) {
                if !self.queue.isEmpty {
                    self.queue.removeFirst()
                    self.isMoving = false;
                    self.animate()
                }
            }
            
            UIView.animateWithDuration(0.25, animations: anime, completion: animateEnd)
        }
    }
}