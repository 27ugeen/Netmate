//
//  PhotoViewController.swift
//  Netmate
//
//  Created by GiN Eugene on 1/8/2022.
//

import UIKit
import iOSIntPackage

class PhotoViewController: UIViewController {
    //MARK: - props
    private let photoCellID = PhotoCollectionViewCell.cellId
    private let imagePublisherFacade: ImagePublisherFacade
    
    var model: [PhotoStub] = []
    
    private var userImages: [UIImage]? {
        didSet { collectionView.reloadData() }
    }
    //MARK: - localization
    private let titleGallery = "photo_gallery_title".localized()
    
    //MARK: - subviews
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.backgroundColor = Palette.appTintColor
        
        collection.translatesAutoresizingMaskIntoConstraints = false
        
        collection.register(PhotoCollectionViewCell.self, forCellWithReuseIdentifier: photoCellID)
        
        collection.dataSource = self
        collection.delegate = self
        
        return collection
    }()
    //MARK: - init
    init(imagePublisherFacade: ImagePublisherFacade) {
        self.imagePublisherFacade = imagePublisherFacade
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        subscribe()
        setupViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let button = UIBarButtonItem(image: UIImage(systemName: "plus"), style: UIBarButtonItem.Style.done, target: self, action: nil)
        self.navigationItem.setRightBarButtonItems([button], animated: true)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        imagePublisherFacade.rechargeImageLibrary()
        imagePublisherFacade.removeSubscription(for: self)
        self.navigationController?.popViewController(animated: true)
    }
    //MARK: - methods
    private func subscribe() {
        let photoArr = model.map { el in el.photo }
        imagePublisherFacade.subscribe(self)
        imagePublisherFacade.addImagesWithTimer(time: 1, repeat: photoArr.count , userImages: photoArr)
    }
}
//MARK: - setupViews
extension PhotoViewController {
    func setupViews() {
        self.title = titleGallery
        self.view.backgroundColor = Palette.appTintColor
        
        self.view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            collectionView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor)
        ])
    }
}
//MARK: - ImageLibrarySubscriber
extension PhotoViewController: ImageLibrarySubscriber {
    func receive(images: [UIImage]) {
        userImages = images
    }
}
//MARK: - UICollectionViewDataSource
extension PhotoViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return userImages?.count ?? 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: photoCellID, for: indexPath) as! PhotoCollectionViewCell
        
        cell.imageView.image = userImages?[indexPath.row]
        return cell
    }
}
//MARK: - UICollectionViewDelegateFlowLayout
extension PhotoViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let photoWidth = CGFloat(collectionView.frame.width - 4 * 8) / 3
        
        return CGSize(width: photoWidth, height: photoWidth)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Photo Gallery: item: \(indexPath.item)")
    }
}
