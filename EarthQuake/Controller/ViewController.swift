//
//  ViewController.swift
//  EarthQuake
//
//  Created by sh3ll on 9.01.2021.
//

import UIKit

class ViewController: UIViewController {

    var quakeList = [Quake]()

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.register(UINib(nibName: "EarthQuakeTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        self.tableView.delegate = self
        self.tableView.dataSource = self

        if let url = URL(string: "https://deprem.odabas.xyz/api/pure_api.php") {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let data = data {
                    do {
                        let decoder = JSONDecoder()
                        self.quakeList = try decoder.decode([Quake].self, from: data)
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                        }

                    } catch let error {
                        print(error)
                    }
                }
            }.resume()
        }
    }
}

//MARK: Tableview delegate and datasource

extension ViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quakeList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? EarthQuakeTableViewCell {
            
            let quakes = quakeList[indexPath.row]
            cell.labelCity.text = quakes.yer
            cell.labelDepth.text = quakes.derinlik
            cell.labelDate.text = quakes.tarih
            cell.labelTime.text = quakes.saat
            cell.labelViolence.text = quakes.siddet

            return cell
        }

        return UITableViewCell()
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 145
    }
}
