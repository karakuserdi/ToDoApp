//
//  ToDoEkleViewController.swift
//  ToDoApp
//
//  Created by Riza Erdi Karakus on 29.12.2021.
//

import UIKit

class ToDoEkleViewController: UIViewController{

    //MARK: - Properties
    @IBOutlet weak var listeAdTextField: UITextField!
    @IBOutlet weak var tarihTextField: UITextField!
    
    @IBOutlet weak var renkView: UIView!
    @IBOutlet weak var listeOnizlemeLabel: UILabel!
    @IBOutlet weak var tarihOnizlemeLabel: UILabel!
    
    var datePicker:UIDatePicker?
    
    var renk = "kirmizi"
    
    var eklePresenterNesnesi:ViewToPresenterEkleProtocol?
    
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        renkView.layer.cornerRadius = 15
        renkView.backgroundColor = UIColor(named: "kirmizi")
        
        listeAdTextField.delegate = self
        
        ToDoEkleRouter.createModule(ref: self)
       
        configurePickers()
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleGesture))
        view.addGestureRecognizer(gestureRecognizer)
    }
    
    func configurePickers(){
        tarihTextField.delegate = self
        
        datePicker = UIDatePicker()
        
        //Bugünün tarihi veya ilerisini seçebilir
        datePicker?.minimumDate = Date()
        datePicker?.locale = Locale(identifier: "tr")
        datePicker?.preferredDatePickerStyle = .wheels
        datePicker?.datePickerMode = .date
        tarihTextField.inputView = datePicker
        datePicker?.addTarget(self, action: #selector(tarihGoster), for: .valueChanged)
        
        let todayDate = Date()
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "tr")
        formatter.dateFormat = "dd MMMM yyyy"
        
        let today = formatter.string(from: todayDate)
        tarihTextField.text = today
        tarihOnizlemeLabel.text = today
    }
    
    //MARK: - Helpers and Actions
    @objc func tarihGoster(datePicker:UIDatePicker){
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "tr")
        dateFormatter.dateFormat = "dd MMMM yyyy"
        let userDate = dateFormatter.string(from: datePicker.date)
        tarihTextField.text = userDate
        tarihOnizlemeLabel.text = userDate
    }
    
    
    func viewRenk(renk:String){
        renkView.backgroundColor = UIColor(named: renk)
        self.renk = renk
    }
    
    @objc func handleGesture(){
        view.endEditing(true)
    }
    
    @IBAction func kirmiziButtonPressed(_ sender: Any) {
        viewRenk(renk: "kirmizi")
    }
    @IBAction func maviButtonPressed(_ sender: Any) {
        viewRenk(renk: "mavi")
    }
    @IBAction func yesilButtonPressed(_ sender: Any) {
        viewRenk(renk: "yesil")
    }
    @IBAction func griButtonPressed(_ sender: Any) {
        viewRenk(renk: "gri")
    }
    @IBAction func siyahButtonPressed(_ sender: Any) {
        viewRenk(renk: "siyah")
    }
    
    @IBAction func ekleButtonPressed(_ sender: Any) {
        if let listeAd = listeAdTextField.text,let tarih = tarihTextField.text{
            if (listeAd.isEmpty){
                alertTimer(title: "", mesaj: "Liste başlığı boş geçilemez")
            }else{
                eklePresenterNesnesi?.ekle(liste_ad: listeAd, liste_tarih: tarih, liste_renk: renk)
                self.navigationController?.popViewController(animated: true)
            }
        }
    }
}

//MARK: - UITextFieldDelegate
extension ToDoEkleViewController: UITextFieldDelegate{
    func textFieldDidEndEditing(_ textField: UITextField) {
        if !(listeAdTextField.text!.isEmpty){
            listeOnizlemeLabel.text = listeAdTextField.text
        }else{
            listeOnizlemeLabel.text = "Örnek Liste"
        }
    }
}
