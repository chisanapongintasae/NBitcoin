//
//  NewsBitcoinTableViewCell.swift
//  NBitcoin
//
//  Created by Chisanapong Intasae on 27/3/2563 BE.
//  Copyright © 2563 Chisanapong. All rights reserved.
//

import UIKit
import SDWebImage

class NewsBitcoinTableViewCell: UITableViewCell {
	
	
	@IBOutlet var titleLabel: UILabel!
	@IBOutlet var authorLabel: UILabel!
	@IBOutlet var newsImage: UIImageView!
	
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
	
	func setData(result: Articles) {
		self.titleLabel.text = result.title
		self.authorLabel.text = result.author
		self.newsImage.sd_setImage(with: URL(string: result.url ?? ""), placeholderImage: UIImage(named: "thumbnail-default") )
		self.newsImage.layer.cornerRadius = 12.0
	}

}
