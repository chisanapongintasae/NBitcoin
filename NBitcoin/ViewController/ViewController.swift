//
//  ViewController.swift
//  NBitcoin
//
//  Created by Chisanapong Intasae on 27/3/2563 BE.
//  Copyright © 2563 Chisanapong. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
	
	@IBOutlet var searchBar: UISearchBar!
	@IBOutlet weak var tableView: UITableView!
	
	private var newsBitcoin: NewsItem? = nil
	private var service: NewbitcoinService? = nil
	
	override func viewDidLoad() {
		super.viewDidLoad()
		self.tableView.delegate = self
		self.tableView.dataSource = self
		self.searchBar.delegate = self
		self.searchBar.resignFirstResponder()
		self.hindKeyBoard()
		self.service = NewbitcoinService()
		service?.fetchNewsBitcoin { (newsItem) in
			self.newsBitcoin = newsItem
			guard let news = newsItem else {
				return
			}
			NewsManager.shared.news = news
			self.tableView.reloadData()
		}
	}
	
	@objc func doneClicked() {
		view.endEditing(true)
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

// การทำ Searchbar ด้วยการ filter มี 2 แบบ
extension ViewController: UISearchBarDelegate {
	
//	func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//		print(searchText)
//		let data = NewsManager.shared.news
//		if searchText.isEmpty {
//			self.newsBitcoin = NewsManager.shared.news
//			tableView.reloadData()
//		} else {
//			let filterdItemsArray = data?.articles.filter { item in
//				return ((item.title.lowercased())).contains(searchText.lowercased())
//			}
//			guard let filter = filterdItemsArray else {
//				return
//			}
//			self.newsBitcoin?.articles = filter
//			tableView.reloadData()
//		}
//	}
//
		func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
			print(searchText)
			let data = NewsManager.shared.news
			if searchText.isEmpty {
				self.newsBitcoin = NewsManager.shared.news
				tableView.reloadData()
			} else {
				let filterdItemsArray = data?.articles.filter { return (($0.title.lowercased())).contains(searchText.lowercased()) }

				guard let filter = filterdItemsArray else {
					return
				}
				self.newsBitcoin?.articles = filter
				tableView.reloadData()
			}
		}
}

extension UIViewController {
	// for hind keyboard
	func hindKeyBoard() {
		let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
		view.addGestureRecognizer(tap)
	}
	@objc func dismissKeyboard() {
		view.endEditing(true)
	}
}

