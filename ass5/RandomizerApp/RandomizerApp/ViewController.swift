//
//  ViewController.swift
//  RandomizerApp
//
//  Created by Dimash Amalbek on 23.10.2025.
//

import UIKit


struct FavoriteItem {
    let title: String
    let imageName: String
}

class ViewController: UIViewController {
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var itemTitleLabel: UILabel!
    
    
    
    
    let items = [
            FavoriteItem(title: "Oscar Piastri", imageName: "81"),
            FavoriteItem(title: "Lando Norris", imageName: "4"),
            FavoriteItem(title: "George Russell", imageName: "63"),
            FavoriteItem(title: "Kimi Antonelli", imageName: "12"),
            FavoriteItem(title: "Charles Leclerc", imageName: "16"),
            FavoriteItem(title: "Lewis Hamilton", imageName: "44"),
            FavoriteItem(title: "Max Verstappen", imageName: "1"),
            FavoriteItem(title: "Yuki Tsunoda", imageName: "22"),
            FavoriteItem(title: "Alexandor Albon", imageName: "23"),
            FavoriteItem(title: "Carlos Sainz", imageName: "55"),
            FavoriteItem(title: "Fernando Alonso", imageName: "14"),
            FavoriteItem(title: "Nico Hulkenberg", imageName: "27"),
            FavoriteItem(title: "Pierre Gasly", imageName: "10")
            
        ]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
                
    }
    
    

    
    @IBAction func randomizeButton(_ sender: UIButton) {
        showRandomItem()
        
    }
    
    
    func showRandomItem(){
        let randomItem = items.randomElement()!
        itemImageView.image = UIImage(named: randomItem.imageName)
        itemTitleLabel.text = randomItem.title
    }


}

