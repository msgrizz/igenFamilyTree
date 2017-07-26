//
//  iGenself.swift
//  iGenFamilyTree
//
//  Created by Paul Geurts on 03/07/2017.
//  Copyright © 2017 ben. All rights reserved.
//

import UIKit
@IBDesignable

class iGenCell: UICollectionViewCell {
    
    @IBOutlet weak var bgImg: UIImageView!
    
    @IBOutlet weak var diseaseImg1Color: UIImageView!
    @IBOutlet var diseaseImg2Colors: [UIImageView]!
    @IBOutlet var diseaseImg3Colors: [UIImageView]!
    
    @IBOutlet var diseaseLabel: [UILabel]!
    @IBOutlet weak var infoVerified: UILabel!
    
    @IBOutlet weak var patientAge: UILabel!
    @IBOutlet weak var genderImg: UIImageView!
    @IBOutlet weak var patientName: UILabel!
    
    override func prepareForReuse() {
        // initialize the cell
        self.bgImg.image = UIImage()
        self.genderImg.image = UIImage()
        self.diseaseImg1Color.backgroundColor = UIColor.clear
        self.diseaseImg2Colors[0].backgroundColor = UIColor.clear
        self.diseaseImg2Colors[1].backgroundColor = UIColor.clear
        for i in 0 ... 2 {
            self.diseaseLabel[i].backgroundColor = UIColor.clear
            self.diseaseLabel[i].text = ""
            self.diseaseImg3Colors[i].backgroundColor = UIColor.clear
        }
        self.infoVerified.backgroundColor = UIColor.clear
        self.infoVerified.text = ""
        self.patientName.text = ""
        self.patientAge.text = ""
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
        func setup() {
//            self.layer.borderWidth = 0.5
//            self.layer.borderColor = UIColor.lightGray.cgColor
            //self.layer.cornerRadius = 0.0
        }
        setup()
        
    }
    
    //process a cell for a Human
    func processHumanCellFor(_ currentHuman: Human) {
        print("currentHuman:", currentHuman.name)
        self.patientName.text = currentHuman.name
        self.patientAge.text = currentHuman.dob
        self.diseaseImg1Color.backgroundColor = UIColor.Colors.noDisease
        if currentHuman.id == currentHuman.editInfoID {
            self.infoVerified.backgroundColor = UIColor.Colors.infoVerifiedColor
            self.infoVerified.text = "✔️"
        }
    }
    
    // process a Human with Diseases
    // we can only show the first 3 diseases and we show them in different colors
    func processDiseaseCellFor(_ currentDisease: Disease) {
        print("currentDisease:", currentDisease.diseaseList)
        let diseaseCount = min(currentDisease.diseaseList.count, 3)
        for diseaseIndex in 0 ... diseaseCount - 1 {
            self.diseaseLabel[diseaseIndex].backgroundColor = UIColor.diseaseColor(diseaseIndex)
            self.diseaseLabel[diseaseIndex].text = String(currentDisease.diseaseList[diseaseIndex])
            switch diseaseCount {
            case 1:
                self.diseaseImg1Color.backgroundColor = UIColor.diseaseColor(diseaseIndex)
            case 2:
                self.diseaseImg2Colors[diseaseIndex].backgroundColor = UIColor.diseaseColor(diseaseIndex)
            case 3:
                self.diseaseImg3Colors[diseaseIndex].backgroundColor = UIColor.diseaseColor(diseaseIndex)
            default:
                break
            }
        }
    }
    
}
