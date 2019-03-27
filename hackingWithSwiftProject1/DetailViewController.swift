//
//  DetailViewController.swift
//  hackingWithSwiftProject1
//
//  Created by karim metawea on 3/13/19.
//  Copyright © 2019 karim metawea. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var backGroundImage: UIImageView!
    var selectedImage:String?
    var x:Int = 0
    var y:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
        title = "picture \(x) of \(y)"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
        guard let selectedimage = selectedImage else{return}
        backGroundImage.image = UIImage(named: selectedimage)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    override func viewWillDisappear(_ animated: Bool) {
            super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    

    @objc func shareTapped()  {
        guard let image = backGroundImage.image?.jpegData(compressionQuality: 0.8) else {return}
        let vc = UIActivityViewController(activityItems: [image], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc,animated: true)
    }


}
