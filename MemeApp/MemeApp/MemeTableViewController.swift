//
//  MemeTableViewController.swift
//  MemeApp
//
//  Created by Geek on 1/16/19.
//  Copyright © 2019 Geek. All rights reserved.
//

import UIKit
class MemeTableViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    var memes: [Meme]?
    @IBOutlet weak var tableView: UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        memes = Memes.sharedInstance.memes
        tableView.reloadData()
        tableView.register(ImageViewCell.self, forCellReuseIdentifier: "ImageViewCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memes!.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MemeCell")!
        let meme = self.memes?[(indexPath as NSIndexPath).row]
        cell.textLabel?.text = "\(meme!.bottomText) \(meme!.topText)"
        cell.imageView?.image = meme?.memedImage
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailController = self.storyboard!.instantiateViewController(withIdentifier: "MemeImageViewController") as! MemeImageViewController
        detailController.meme = self.memes![(indexPath as NSIndexPath).row]
        self.navigationController!.pushViewController(detailController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let currentImage = self.memes?[(indexPath as NSIndexPath).row].memedImage
        let imageCrop = currentImage?.getCropRatio()
        return tableView.frame.width / imageCrop! / 5
    }
}

extension UIImage{
    func getCropRatio() -> CGFloat{
        let widthRation = self.size.width / self.size.height
        return widthRation
    }
}

