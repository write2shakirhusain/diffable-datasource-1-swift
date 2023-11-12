//
//  Screen2ViewController.swift
//  DiffableDataSource
//
//  Created by Shakir Husain on 11/11/23.
//

import UIKit

class Screen2ViewController: UIViewController {

    @IBOutlet weak var tblView: UITableView!
    
    var datasource:UITableViewDiffableDataSource<Section,Fruit>!
    
        
    var datalist:[Fruit] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configureUIElement()
    }
    
    func setupNavBar()  {
        title = "Diffable DataSource"
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .done, target: self, action: #selector(addDataItem))
    }
    
    func configureUIElement() {
        setupNavBar()
        setupDatasource()
    }
    
   
    @objc func addDataItem() {
        
       let  aFruit  = Fruit(title: "title \(datalist.count + 1)")
       datalist.append(aFruit)
        updateTable()
    }
    
    func updateTable()  {
        
        var snapshot = NSDiffableDataSourceSnapshot<Section,Fruit>()
        snapshot.appendSections([Section.first])
        snapshot.appendItems(datalist)
        datasource.apply(snapshot, animatingDifferences: true)
        
    }
    
    func setupDatasource() {
        
        datasource = UITableViewDiffableDataSource(tableView: tblView, cellProvider: { tableView, indexPath, itemIdentifier -> UITableViewCell in
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "Title2TableViewCell") as? Title2TableViewCell else {
                return UITableViewCell()
            }
            
            cell.lblTitle.text = itemIdentifier.title
           
            return cell
        })
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
