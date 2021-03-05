//
//  ViewController.swift
//  StormViewerCollectionView
//
//  Created by Shah, Shubham on 23/02/21.
//

import UIKit

class ViewController: UICollectionViewController {

    var pictures = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Storm Viewer"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)

        for item in items {
            if item.hasPrefix("nssl") {
                pictures.append(item)
                print(pictures)
            }
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pictures.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Picture", for: indexPath) as? PictureCollectionViewCell else {
                // we failed to get a PersonCell – bail out!
                fatalError("Unable to dequeue PictureCollectionViewCell.")
            }
            cell.name.text = pictures[indexPath.row]
            cell.name.textColor = UIColor.black
            cell.backgroundColor = UIColor.red
            // if we're still here it means we got a PictureCollectionViewCell, so we can return it
            return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(identifier: "Detail") as? DetailViewController {
            vc.selectedImage = pictures[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
    }


}

