//
//  DetailViewController.swift
//  ToComSorte
//
//  Created by Gabriel Rossi on 30/05/23.
//

import Foundation
import UIKit

class DetailViewControler: UIViewController{

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var textLabel: UILabel!
    
    @IBOutlet weak var deck: UICollectionView!
    

    var cards: [Card] = []
    var userCard: Card = Card()
    
    
    override func viewDidLoad() {
        let myCard: Card = Card()
        
        cards.append(userCard)
        cards.append(myCard)
        
        deck.dataSource = self
            
        
        
        titleLabel.text = (userCard == myCard) ? "Sortudo" : "Azarado"
        textLabel.text = (userCard == myCard) ? "Cagão" : "Éh a vida irmão"
    }
}

extension DetailViewControler: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return cards.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: CardCell = deck.dequeueReusableCell(withReuseIdentifier: "cardCell", for: indexPath) as! CardCell
        
        cell.draw(card: cards[indexPath.item])
        
        return cell
    }
}

