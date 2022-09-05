//
//  NetmateTests.swift
//  NetmateTests
//
//  Created by GiN Eugene on 7/8/2022.
//

import Quick
import Nimble
import iOSIntPackage
@testable import Netmate
import CoreData

final class UIViewControllerMock: UIViewController {}

class AppCoordinatorSpecs: QuickSpec {
    private var viewController: UIViewControllerMock!
    private var imagePublisherFacade: ImagePublisherFacade!
    
    private var mainVM: MainViewModel!
    private var infoVM: InfoViewModel!
    private var feedMenuVM: FeedMenuViewModel!
    private var menuVM: MenuViewModel!
    private var profileVM: ProfileViewModel!
    private var favVM: FavoriteViewModel!
    private var followerVM: FollowerViewModel!
    
    private var container: NSPersistentContainer!
    private var backContext: NSManagedObjectContext!
    private var dbManager: DataBaseManager!

    private var mainVC: MainViewController!
    private var profileVC: ProfileViewController!
    private var favVC: FavoriteViewController!

    private var mainCoord: MainCoordinator!
    private var profileCoord: ProfileCoordinator!
    private var favCoord: FavoriteCoordinator!
    
    private var appCoordinator: AppCoordinator!
    
    override func spec() {
        self.viewController = UIViewControllerMock()
        self.imagePublisherFacade = ImagePublisherFacade()
        
        self.container = NSPersistentContainer(name: "DataBaseModel")
        self.backContext = container.newBackgroundContext()
        
        self.dbManager = DataBaseManager(persistentContainer: container, backgroundContext: backContext)
        
        self.mainVM = MainViewModel(dbManager: dbManager)
        self.infoVM = InfoViewModel()
        self.feedMenuVM = FeedMenuViewModel()
        self.menuVM = MenuViewModel()
        self.profileVM = ProfileViewModel()
        self.favVM = FavoriteViewModel(dbManager: dbManager)
        self.followerVM = FollowerViewModel()

        self.mainVC = MainViewController(mainVM: mainVM)
        self.profileVC = ProfileViewController()
        self.favVC = FavoriteViewController(favoriteViewModel: favVM)

        self.mainCoord = MainCoordinator(rootViewController: viewController, mainVC: mainVC, infoVM: infoVM, feedMenuVM: feedMenuVM, followerVM: followerVM, imagePublisherFacade: imagePublisherFacade)
        self.profileCoord = ProfileCoordinator(rootViewController: viewController, profileVC: profileVC, infoVM: infoVM, menuVM: menuVM, profileVM: profileVM, imgPubFascade: imagePublisherFacade)
        self.favCoord = FavoriteCoordinator(rootViewController: viewController, favVC: favVC)
        
        self.appCoordinator = AppCoordinator(mainCoordinator: mainCoord, profileCoordinator: profileCoord, favoriteCoordinator: favCoord)
        
        //MARK: - start() testing
        describe("start() testing") {
            context("when func started") {
                it("expect return tabBarVC as rootVC") {
                    let actual = self.appCoordinator.start()

                    expect(actual).to(beAKindOf(UITabBarController.self))
                    expect(actual.isViewLoaded).to(equal(true))
                }
            }
        }
    }
}


