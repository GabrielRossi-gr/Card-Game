//
//  CardCell.swift
//  ToComSorte
//
//  Created by Gabriel Rossi on 30/05/23.
//

import Foundation
import UIKit

class CardCell: UICollectionViewCell{

    @IBOutlet weak var topLabel: UILabel!
    
    @IBOutlet weak var topSymbol: UILabel!
    
    @IBOutlet weak var centerSymbol: UILabel!
    
    @IBOutlet weak var bottonSymbol: UILabel!
    
    @IBOutlet weak var bottonLabel: UILabel!
    
        
    func draw(card: Card){
        let color: UIColor = (card.suit == .clubs || card.suit == .spades) ? .label: .systemRed
        
        //top labels
        topLabel.text = card.getLabel()
        topLabel.textColor = color
        
        topSymbol.text = card.getSymbol()
        topSymbol.textColor = color
        
        
        //botton labels
        bottonLabel.text = card.getLabel()
        bottonLabel.textColor = color
        bottonLabel.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        
        bottonSymbol.text = card.getSymbol()
        bottonSymbol.textColor = color
        bottonSymbol.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        
        //center label
        centerSymbol.text = card.getSymbol()
        centerSymbol.textColor = color
    }
    
}
