//
//  Screen1ViewController.swift
//  DiffableDataSource
//
//  Created by Shakir Husain on 11/11/23.
//

import UIKit

class Screen1ViewController: UIViewController,UITableViewDataSource {
    

    @IBOutlet weak var tblView: UITableView!
    
    var datalist:[Fruit] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configureUIElement()
    }
    
    func setupNavBar()  {
        title = "Simple DataSource"
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .done, target: self, action: #selector(addDataItem))
    }
    
    func configureUIElement() {
        tblView.dataSource = self
        setupNavBar()
    }
    
   
    @objc func addDataItem() {
        
       let  aFruit  = Fruit(title: "title \(datalist.count + 1)")
       datalist.append(aFruit)
        updateTable()
    }
    
    func updateTable()  {
        tblView.reloadData()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datalist.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tblView.dequeueReusableCell(withIdentifier: "Title1TableViewCell") as? Title1TableViewCell else {
            return UITableViewCell()
        }
        
        if  let title = datalist[indexPath.row].title {
            cell.lblTitle.text = title
        }
        return cell
                
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
