//
//  SettingsViewController.swift
//  InstaClone
//
//  Created by Livia Carvalho Keller on 19/10/22.
//

import UIKit

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func logoutButton(_ sender: UIButton) {
        performSegue(withIdentifier: "toVC", sender: nil)
    }

}
