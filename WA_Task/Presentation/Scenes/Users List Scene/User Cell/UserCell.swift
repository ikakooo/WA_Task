//
//  UserCell.swift
//  WA_Task
//
//  Created by Irakli Chkhitunidzde on 03.03.22.
//

import UIKit

class UserCell: UITableViewCell {
    @IBOutlet weak var useNameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func configure( name: String){
        useNameLabel.text = name
    }
    @IBAction func onDeleteClick(_ sender: Any) {
        
        
    }
    
}
