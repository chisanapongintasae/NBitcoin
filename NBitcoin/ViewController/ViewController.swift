//
//  ViewController.swift
//  NBitcoin
//
//  Created by Chisanapong Intasae on 27/3/2563 BE.
//  Copyright © 2563 Chisanapong. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
	
	@IBOutlet weak var tableView: UITableView!
	
	private var newsBitcoin: NewsItem? = nil
	private var service: NewbitcoinService? = nil
	
	override func viewDidLoad() {
		super.viewDidLoad()
		self.tableView.delegate = self
		self.tableView.dataSource = self
		self.service = NewbitcoinService()
		service?.fetchNewsBitcoin { (newsItem) in
			self.newsBitcoin = newsItem
			self.tableView.reloadData()
		}
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return self.newsBitcoin?.articles.count ?? 0
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: "NewsBitcoinTableViewCell", for: indexPath) as? NewsBitcoinTableViewCell else {
			return UITableViewCell()
		}
		cell.setData(result: (self.newsBitcoin?.articles[indexPath.row])!)
		return cell
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 110
	}
	
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		guard let selectNews = self.newsBitcoin?.articles[indexPath.row] else {
			return
		}
		let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
		let detailVC = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as!
		DetailViewController
		detailVC.setShowDetail(result: selectNews)
		self.present(detailVC, animated: true, completion: nil)
	}
}

extension UIImage {
    public static func loadFrom(url: URL, completion: @escaping (_ image: UIImage?) -> ()) {
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: url) {
                DispatchQueue.main.async {
                    completion(UIImage(data: data))
                }
            } else {
                DispatchQueue.main.async {
                    completion(nil)
                }
            }
        }
    }
}

