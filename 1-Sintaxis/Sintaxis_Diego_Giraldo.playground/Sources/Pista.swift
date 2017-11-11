import Foundation
import UIKit

public class Circuit : UIView {
    public init() {
        super.init(frame: CGRect(x: 0.0, y: 0.0, width: 440.0, height: 430.0))
        
        let pista = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 440.0, height: 430.0))
        pista.backgroundColor = UIColor(patternImage: UIImage(named: "pista")!)
        
        self.addSubview(pista)
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}