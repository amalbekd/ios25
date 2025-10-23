//
//  ViewController.swift
//  DiceeApp
//
//  Created by Dimash Amalbek on 23.10.2025.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var leftDice: UIImageView!
    @IBOutlet weak var rightDice: UIImageView!

    let leftDiceImages =
    [
        UIImage(named: "dice-six-faces-one"),
        UIImage(named: "dice-six-faces-two"),
        UIImage(named: "dice-six-faces-three"),
        UIImage(named: "dice-six-faces-four"),
        UIImage(named: "dice-six-faces-five"),
        UIImage(named: "dice-six-faces-six")
    ]
    
    let rightDiceImages =
    [
        UIImage(named: "inverted-dice-1"),
        UIImage(named: "inverted-dice-2"),
        UIImage(named: "inverted-dice-3"),
        UIImage(named: "inverted-dice-4"),
        UIImage(named: "inverted-dice-5"),
        UIImage(named: "inverted-dice-6")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func rollButton(_ sender: Any) {
        rollDice()
    }

    func rollDice() {
        leftDice.image = leftDiceImages.randomElement() ?? UIImage(named: "dice-six-faces-one")
        rightDice.image = rightDiceImages.randomElement() ?? UIImage(named: "inverted-dice-1")
    }
}

