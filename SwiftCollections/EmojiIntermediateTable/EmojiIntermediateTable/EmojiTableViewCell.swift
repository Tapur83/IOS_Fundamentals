//
//  EmojiTableViewCell.swift
//  EmojiIntermediateTable
//
//  Created by Tapur Aggarwal on 25/08/25.
//

import UIKit

class EmojiTableViewCell: UITableViewCell {

    
    @IBOutlet weak var symbolLabel: UILabel!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func updateUI(emoji: Emoji){
        symbolLabel.text = emoji.symbol
        nameLabel.text = emoji.name
        descriptionLabel.text = emoji.description
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
