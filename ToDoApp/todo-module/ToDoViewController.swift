//
//  ToDoViewController.swift
//  ToDoApp
//
//  Created by Riza Erdi Karakus on 29.12.2021.
//

import UIKit

class ToDoViewController: UIViewController {

    
    //MARK: - Properties
    var listemListesi = [Liste]()
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var todoPresenterNesnesi:ViewToPresenterProtocol?
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ToDoRouter.createModule(ref: self)
        
        veritabaniKopyala()
        
        searchBar.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        todoPresenterNesnesi?.listeyiAl()
        tableView.reloadData()
    }
    
    func veritabaniKopyala(){
        let bundleYolu = Bundle.main.path(forResource: "listem", ofType: ".sqlite")
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let fileManager = FileManager.default
        let kopyalanacakYer = URL(fileURLWithPath: hedefYol).appendingPathComponent("listem.sqlite")
        
        if fileManager.fileExists(atPath: kopyalanacakYer.path){
            print("Veritabanı zaten var. Kopyalamaya gerek yok")
        }else{
            do{
                try fileManager.copyItem(atPath: bundleYolu!, toPath: kopyalanacakYer.path)
            }catch{
                print(error)
            }
        }
    }
}

//MARK: - PresenterToViewProtocol
extension ToDoViewController:PresenterToViewProtocol{
    func viewaVeriGonder(liste: Array<Liste>) {
        listemListesi = liste.sorted(by: {$0.liste_id! > $1.liste_id!})
        tableView.reloadData()
    }
}

//MARK: - UITableViewDelegate,UITableViewDataSource
extension ToDoViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listemListesi.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "todoCell", for: indexPath) as! ToDoCell
        let liste = listemListesi[indexPath.row]
        
        cell.todoAdLabel.text = liste.liste_ad
        cell.todoTarihLabel.text = liste.liste_tarih
        cell.todoColorView.backgroundColor = UIColor(named: liste.liste_renk!)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let silAction = UIContextualAction(style: .destructive, title: "Sil") { [self] (contextualAction, view, bool) in
            let liste = listemListesi[indexPath.row]
            
            todoPresenterNesnesi?.sil(liste_id: liste.liste_id!)
            tableView.reloadData()
        }
        
        return UISwipeActionsConfiguration(actions: [silAction])
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "todoDetay", sender: indexPath.row)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    //Prepare method
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "todoDetay"{
            let index = sender as? Int
            let gidilecekVC = segue.destination as! ToDoDetayViewController
            gidilecekVC.liste = listemListesi[index!]
        }
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let label = UILabel()
        label.text = "Listeniz boş"
        label.textAlignment = .center
        label.textColor = .systemBlue
        label.font = .boldSystemFont(ofSize: 15)
        return label
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return listemListesi.count == 0 ? 100 : 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}

//MARK: - UISearchBarDelegate
extension ToDoViewController: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        todoPresenterNesnesi?.ara(liste_ad: searchText)
        tableView.reloadData()
    }
}
