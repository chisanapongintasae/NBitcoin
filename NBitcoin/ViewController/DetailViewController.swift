//
//  DetailViewController.swift
//  NBitcoin
//
//  Created by Chisanapong Intasae on 28/3/2563 BE.
//  Copyright © 2563 Chisanapong. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
	
	
	@IBOutlet var titleLabel: UILabel!
	@IBOutlet var descriptionLabel: UILabel!
	@IBOutlet var newsImage: UIImageView!
	
	private var result: Articles? = nil
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		showDetail()
		// Do any additional setup after loading the view.
	}
	
	@IBAction func closeButton(_ sender: Any) {
		self.dismiss(animated: true, completion: nil)
	}
	
	func showDetail() {
		let data = self.result
		self.titleLabel.text = data?.title
		self.descriptionLabel.text = data?.description
		self.newsImage.sd_setImage(with: URL(string: data?.url ?? ""), placeholderImage: UIImage(named: "thumbnail-default") )
		self.newsImage.layer.cornerRadius = 12.0
		
	}
	
	func setShowDetail(result: Articles) {
		self.result = result
	}
	
}
