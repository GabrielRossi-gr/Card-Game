//
//  ViewController.swift
//  ToComSorte
//
//  Created by Gabriel Rossi on 26/05/23.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var deck: UICollectionView!
    
    //data source and delegate
    //data source: apresentaçao da view
    //delegate: o que acontece quando é clicada
    
    var cards: [Card] = []
    var selectedCard:Card = Card()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //data source
        deck.dataSource = self
        //delegate
        deck.delegate = self
        
        let suits: [CardSuit] = [.clubs, .hearts, .spades, .diamonds]
        for suit in suits{
            for value in 1...13{
                let card = Card(value: value, suit: suit)
                cards.append(card)
            }
        }
    }
}

//data source
extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return cards.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: CardCell = deck.dequeueReusableCell(withReuseIdentifier: "cardCell", for: indexPath) as! CardCell
        
        cell.draw(card: cards[indexPath.item])
        
        return cell
    }
}

//delegate
extension MainViewController: UICollectionViewDelegate{
    //a função roda assim que ele selecionar,      ele pega o 'indexPhath', busca no vetor de cartas e coloca no 'selectedCard'
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedCard = cards[indexPath.item]
        //toda vez que clicar em um card ele vai selecionar a carta
        
        //aqui eu tenho a variavel que esta na selectedCard

        
        //performa a segue, essa função ja puxa altomaticamente a prepare for segue, essa função 'prepare for segue' tem acesso ao destino
        performSegue(withIdentifier: "showDetail", sender: self)
    }
                //prepara a segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    //                                           destino de uma segue é sempre uma                                                                          view controler, como é uma classe                                    destino da segue                      especifica precisa de casting
        let vc: DetailViewControler = segue.destination as! DetailViewControler
        
        
        vc.userCard = selectedCard
        //vc.userCard = selectedCard
    }
    
}
