//
//  FilmViewController.swift
//  FilmlerUygulamasi
//
//  Created by Bartu Kara on 20.04.2023.
//

import UIKit

class FilmViewController: UIViewController {
    
    @IBOutlet weak var filmCollectionView: UICollectionView!
    
    var filmlerListe = [Filmler]()
    
    var kategori:Kategoriler?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        filmCollectionView.delegate = self
        filmCollectionView.dataSource = self
        
        let tasarim :UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        
        let genislik = self.filmCollectionView.frame.size.width
        
        tasarim.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
        let hucreGenislik = (genislik-30) / 2
        
        tasarim.itemSize = CGSize(width: hucreGenislik, height: hucreGenislik*1.80)
        
        tasarim.minimumInteritemSpacing = 10
        tasarim.minimumLineSpacing = 10
        
        filmCollectionView.collectionViewLayout = tasarim
        
        if let k = kategori{
            
            navigationItem.title = k.kategori_ad
            
            filmlerListe = Filmlerdao().filmlerAl(kategori_id: k.kategori_id!)
            
        }
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let indeks = sender as? Int
        let gidilecekVC = segue.destination as! FilmDetayViewController
        gidilecekVC.film = filmlerListe[indeks!]
        
    }
    
}

extension FilmViewController : UICollectionViewDelegate, UICollectionViewDataSource, FilmHucreCollectionViewCellProtocol{
    
    func sepeteEkle(indexPath: IndexPath) {
        print("Sepete Eklenen Film: \(filmlerListe[indexPath.row].film_ad!)")
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filmlerListe.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let film = filmlerListe[indexPath.row]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "filmHucre", for: indexPath) as! FilmHucreCollectionViewCell
        
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.borderWidth = 0.5
        cell.layer.cornerRadius = 10
        
        
        cell.labelFilmAd.text = film.film_ad
        cell.labelFilmFiyat.text = "14.99 TL"
        cell.imageViewFilm.image = UIImage(named: film.film_resim!)
        
        cell.hucreProtocol = self
        cell.indexPath = indexPath
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "toDetay", sender: indexPath.row)
    }
    
}
