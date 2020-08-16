//
//  FirstViewController.swift
//  Rolodex
//
//  Created by Dylan Floyd on 12/11/19.
//  Copyright © 2019 Dylan Floyd. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var lastSpokeDate: UILabel!
    
    @IBOutlet weak var contactName: UILabel!
    
    @IBOutlet weak var notes: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        pickRandomDate()
        let name_chosen = pickRandomName()
        updateNotes(name: name_chosen)
    }

    func pickRandomDate() {
        let month = String(Int.random(in: 1...12))
        let day = String(Int.random(in: 1...28))
        let year = String(Int.random(in: 1950...2019))
        let dateStr = month + "/" + day + "/" + year
        lastSpokeDate.text = dateStr
    }
    
    func pickRandomName() -> String
    {
        var namelist = [""]
        let friends = ["Reiman, A.", "Matthiessen, A.","Furman, D.", "Foley, E.", "Mahoney, T.", "Kulas, J.", "Berry, P.", "Fernandez-Rocha, L.", "Roberts, H.", "Smith, E.", "Tulis, R.", "Swope, E.", "Murphy, G.", "Culberson, M.", "Dumont, K.", "Flink, I.", "Bose, S.", "Duckworth, R."]
        let family = ["Mom", "Dad", "Walter", "Rebecca", "Nick", "Kelly", "Jess", "Brooke", "Lydia", "Brad", "Aunt Jan", "Uncle Rick", "Uncle Paul", "Sean", "Aunt Susan", "Aunt Elizabeth", "Mimi", "Katie", "Kyle", "Aunt Linda", "Ryan", "Brown, A."]
        let coin = Int.random(in: 0...1)
        
        if coin == 0 {
            namelist = friends
        }
        else {
            namelist = family
        }
        
        let i = Int.random(in: 0..<namelist.count)
        contactName.text = namelist[i]
        return namelist[i]
    }
    
    func updateNotes(name: String) {
        let backwards = String(name.reversed())
        let msg = "\(name) spelled backwards is \(backwards)"
        notes.text = msg
    }
    

    @IBAction func callButtonPressed(_ sender: UIButton) {
        makePhoneCall(phoneNumber: "4048675309")
        //Calls Dylan's cell
    }
    
    @IBAction func snoozeButtonPressed(_ sender: UIButton) {
        pickRandomDate()
        let name_chosen = pickRandomName()
        updateNotes(name: name_chosen)
    }
    
    func makePhoneCall(phoneNumber: String) {
        if let url = URL(string: "tel://\(phoneNumber)"),
            UIApplication.shared.canOpenURL(url) {
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    
}

