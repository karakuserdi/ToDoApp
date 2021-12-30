//
//  ToDoDetayViewController.swift
//  ToDoApp
//
//  Created by Riza Erdi Karakus on 29.12.2021.
//

import UIKit

class ToDoDetayViewController: UIViewController {

    //MARK: - Properties
    var yapilacaklarListesi = [Yapilacaklar]()
    var liste:Liste?
    var detayPresenterNesnesi:ViewToPresenterDetayProtocol?
    
    @IBOutlet weak var yapilacakEkleTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.allowsSelection = false
        
        ToDoDetayRouter.createModule(ref: self)
        
        if let liste = liste {
            self.navigationItem.title = liste.liste_ad
            detayPresenterNesnesi?.yapilacaklariAl(liste_id: liste.liste_id!)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let liste = liste {
            self.navigationItem.title = liste.liste_ad
            detayPresenterNesnesi?.yapilacaklariAl(liste_id: liste.liste_id!)
            tableView.reloadData()
        }
    }
    
    
    //MARK: - Actions
    @IBAction func ekleButtonPressed(_ sender: Any) {
        if let liste = self.liste,let ad = yapilacakEkleTextField.text{
            if ad.isEmpty{
                alertTimer(title: "", mesaj: "Yapılacak ekle boş geçilemez.")
            }else{
                detayPresenterNesnesi?.ekle(liste_id: liste.liste_id!, yapilacaklar_ad: ad, yapilacaklar_tarih: "13 Mart 2023", yapilacaklar_bittimi: "false")
                yapilacakEkleTextField.text = ""
            }
        }
        
        if let liste = self.liste {
            detayPresenterNesnesi?.yapilacaklariAl(liste_id: liste.liste_id!)
        }
        tableView.reloadData()
    }
    
    func isCheck(indexPath: IndexPath) {
        let yapilacaklar = yapilacaklarListesi[indexPath.row]
        
        if yapilacaklar.yapilacaklar_bittimi == "false" {
            detayPresenterNesnesi?.bitti(yapilacaklar_id: yapilacaklar.yapilacaklar_id!, yapilacaklar_bittimi: "true")
        }else{
            detayPresenterNesnesi?.bitti(yapilacaklar_id: yapilacaklar.yapilacaklar_id!, yapilacaklar_bittimi: "false")
        }
        
        if let liste = self.liste {
            detayPresenterNesnesi?.yapilacaklariAl(liste_id: liste.liste_id!)
        }
        tableView.reloadData()
    }
    
}

//MARK: - PresenterToViewDetayProtocol
extension ToDoDetayViewController:PresenterToViewDetayProtocol{
    func viewaVeriGonder(yapilacaklarListesi: Array<Yapilacaklar>) {
        self.yapilacaklarListesi = yapilacaklarListesi
        tableView.reloadData()
    }
}

//MARK: - ToDoDetayViewController: UITableViewDelegate,UITableViewDataSource, ToDoDetayCellDeletage
extension ToDoDetayViewController: UITableViewDelegate,UITableViewDataSource, ToDoDetayCellDeletage{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return yapilacaklarListesi.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tododetayCell", for: indexPath) as! ToDoDetayCell
        let yapilacaklar = yapilacaklarListesi[indexPath.row]
        
        cell.yapilacaklarAdLabel.text = yapilacaklar.yapilacaklar_ad
        
        if yapilacaklar.yapilacaklar_bittimi == "false"{
            cell.bittiView.isHidden = true
            cell.bittiButton.setImage(UIImage(named: "uncheck"), for: .normal)
        }else{
            cell.bittiView.isHidden = false
            cell.bittiButton.setImage(UIImage(named: "check"), for: .normal)
        }
        
        cell.delegate = self
        cell.indexPath = indexPath
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let silAction = UIContextualAction(style: .destructive, title: "Sil") { [self] (contextualAction, view, bool) in
            let yapilacaklar = yapilacaklarListesi[indexPath.row]
            
            detayPresenterNesnesi?.sil(yapilacaklar_id: yapilacaklar.yapilacaklar_id!)
            
            if let liste = self.liste {
                detayPresenterNesnesi?.yapilacaklariAl(liste_id: liste.liste_id!)
            }
            tableView.reloadData()
        }
        
        return UISwipeActionsConfiguration(actions: [silAction])
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}


