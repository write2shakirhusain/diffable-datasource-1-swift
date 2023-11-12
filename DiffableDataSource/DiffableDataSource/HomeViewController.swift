//
//  ViewController.swift
//  DiffableDataSource
//
//  Created by Shakir Husain on 11/11/23.
//
import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupNavBar()
    }
    
    func setupNavBar()  {
        title = "Home Screen"
    }
    
    @IBAction func didClickOnDiffableTable(_ sender: UIButton) {
        guard let vCon = self.storyboard?.instantiateViewController(identifier: "Screen2ViewController")  as? Screen2ViewController else {
            return
        }
        self.navigationController?.pushViewController(vCon, animated: true)
    }
    
    @IBAction func didClickSimpleTable(_ sender: UIButton) {
        guard let vCon = self.storyboard?.instantiateViewController(identifier: "Screen1ViewController")  as? Screen1ViewController else {
            return
        }
        self.navigationController?.pushViewController(vCon, animated: true)
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
