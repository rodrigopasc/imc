//
//  ViewController.swift
//  IMC
//
//  Created by Rodrigo Paschoaletto on 27/06/18.
//  Copyright © 2018 Rodrigo Paschoaletto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var weight: UITextField!
    @IBOutlet weak var height: UITextField!
    @IBOutlet weak var result: UILabel!
    @IBOutlet weak var resultImage: UIImageView!
    @IBOutlet weak var resultSectionToShow: UIView!
    
    var imc: Double = 0

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    @IBAction func calculate(_ sender: Any) {
        if let weightToCalculate = Double(weight.text!), let heightToCalculate = Double(height.text!) {
            imc = weightToCalculate / pow(heightToCalculate, 2)
            showCalculatedResults()
        }
    }
    
    func showCalculatedResults() {
        var resultToShow  : String = ""
        var imageToShow   : String = ""
        
        switch imc {
            case 0..<16:
                resultToShow  = "Magreza"
                imageToShow   = "magreza"
            case 16..<18.5:
                resultToShow  = "Abaixo do peso"
                imageToShow   = "abaixo"
            case 18.5..<25:
                resultToShow  = "Peso ideal"
                imageToShow   = "ideal"
            case 25..<30:
                resultToShow  = "Sobrepeso"
                imageToShow   = "sobrepeso"
            default:
                resultToShow  = "Obesidade"
                imageToShow   = "obesidade"
        }
        
        result.text                     = "\(Int(imc)): \(resultToShow)"
        resultImage.image               = UIImage(named: imageToShow)
        resultSectionToShow.isHidden    = false
        view.endEditing(true)
    }
    
}

