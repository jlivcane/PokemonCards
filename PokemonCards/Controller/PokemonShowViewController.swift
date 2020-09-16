//
//  PokemonShowViewController.swift
//  PokemonCards
//
//  Created by jekaterina.livcane on 15/09/2020.
//  Copyright © 2020 jekaterina.livcane. All rights reserved.
//

import UIKit

class PokemonShowViewController: UIViewController {

    @IBOutlet weak var ImageView: UIImageView!
    @IBOutlet weak var pokeyName: UILabel!
    @IBOutlet weak var pokeyHp: UILabel!
    @IBOutlet weak var pokeyNumber: UILabel!
    @IBOutlet weak var pokeySeries: UILabel!
    @IBOutlet weak var pokeySet: UILabel!
    
    var pokemon: Pokemon?
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let pokemon = pokemon {
            ImageController.getImage(for: pokemon.imageUrl ?? "", completion: { (image) in
                self.ImageView.image = image
            // or NetworkController.performRequest(for: <#T##URL#>, httpMethod: <#T##NetworkController.HTTPMethod#>, urlParameters: [String : String]?, body: <#T##Data?#>, completion: <#T##((Data?, Error?) -> Void)?##((Data?, Error?) -> Void)?##(Data?, Error?) -> Void#>)
                self.pokeyName.text = pokemon.name
                self.pokeyHp.text = pokemon.hp
                self.pokeyNumber.text = pokemon.number
                self.pokeySeries.text = pokemon.series
                self.pokeySet.text = pokemon.pokemonSet
            })
            }else{
                print("pokemon image is nil")
            }
        }
    }



