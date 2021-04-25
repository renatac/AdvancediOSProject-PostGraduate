//
//  MainViewController.swift
//  Avaliacao2
//
//  Created by RENATA on 18/04/21.
//

import UIKit

class MainViewController: UIViewController {

    var seconds: Int = 0
    var secondTimer: Timer?

    @IBOutlet weak var pickerView: UIPickerView?
    @IBOutlet weak var label: UILabel?
    @IBOutlet var startBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        pickerView?.delegate = self
        pickerView?.dataSource = self
        
        pickerView?.backgroundColor = .white
        label?.isHidden = true
    }
    
    func setupLabel() {
        label?.text = "\(seconds)"
        label?.isHidden = false
        startsCountdown()
    }
    
    func startsCountdown() {
        secondTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] timer in
            self?.seconds -= 1
            if self?.seconds == 0 {
                print("Go!")
                self?.label?.text = "0"
                timer.invalidate()
            } else if let seconds = self?.seconds {
                print(seconds)
                self?.label?.text = "\(seconds)"
            }
        }
    }
    
    deinit {
        secondTimer?.invalidate()
    }

    @IBAction func startBtnClick(_ sender: Any) {
        if pickerView?.isHidden == false {
            pickerView!.removeFromSuperview()
            setupLabel()
            startBtn.setTitle("Cancelar", for: .normal)
        } else {
            secondTimer?.invalidate()
        }
    }
}

extension MainViewController: UIPickerViewDelegate, UIPickerViewDataSource{

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 60
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(format: "%02d", row)
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            seconds = row
            print("minute: \(seconds)")
    }
}
