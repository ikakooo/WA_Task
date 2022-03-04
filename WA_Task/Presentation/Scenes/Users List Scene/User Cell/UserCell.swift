//
//  UserCell.swift
//  WA_Task
//
//  Created by Irakli Chkhitunidzde on 03.03.22.
//

import UIKit

class UserCell: UITableViewCell {
    @IBOutlet weak var useNameLabel: UILabel!
    
    private var user:User?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func configure( user: User){
        self.user = user
        useNameLabel.text = user.username
    }
    @IBAction func onDeleteClick(_ sender: Any) {
        UsersCoreDataManager.shared.delete(user: self.user!)

        
    }
    
}
