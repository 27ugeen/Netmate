//
//  MainCoordinatorTests.swift
//  NetmateTests
//
//  Created by GiN Eugene on 7/8/2022.
//

import Quick
import Nimble
import iOSIntPackage
@testable import Netmate

final class UINavigationControllerMock: UINavigationController {
    var pushViewControllerCalled = false
    var instanceVC: UIViewController?
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        super.pushViewController(viewController, animated: animated)
        instanceVC = viewController
        pushViewControllerCalled = true
    }
    
    var presentCalled = false
    override func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)? = nil) {
        super.present(viewControllerToPresent, animated: flag, completion: completion)
        presentCalled = true
    }
}

class MainCoordinatorTests: QuickSpec {
    private var viewController: UIViewControllerMock!
    private var imagePublisherFacade: ImagePublisherFacade!
    
    private var mainVM: MainViewModel!
    private var infoVM: InfoViewModel!
    private var feedMenuVM: FeedMenuViewModel!
    
    private var mainVC: MainViewController!
    
    private var mainCoord: MainCoordinator!
    
    private var navigationController: UINavigationControllerMock!
    
    override func spec() {
        self.viewController = UIViewControllerMock()
        self.imagePublisherFacade = ImagePublisherFacade()
        
        self.mainVM = MainViewModel()
        self.infoVM = InfoViewModel()
        self.feedMenuVM = FeedMenuViewModel()
        
        self.mainVC = MainViewController(mainVM: mainVM)
        
        self.mainCoord = MainCoordinator(rootViewController: viewController, mainVC: mainVC, infoVM: infoVM, feedMenuVM: feedMenuVM, imagePublisherFacade: imagePublisherFacade)
        self.navigationController = UINavigationControllerMock(rootViewController: mainVC)
        
        //MARK: - start() testing
        describe("start() testing") {
            context("when func started") {
                it("expect return mainVC as rootVC") {
                    let actual = self.mainCoord.start()
                    
                    expect(actual).to(beAKindOf(UINavigationController.self))
                    expect(actual.isViewLoaded).to(equal(true))
                }
            }
        }
        //MARK: - goToProfileVC() testing
        describe("goToProfileVC() testing") {
            context("when func started") {
                beforeEach {
//                    self.navigationController.pushViewControllerCalled = false
//                    self.mainCoord.navigationRootViewController = self.navigationController
                }
                it("expect go to tab ProfileVC") {
                   self.mainCoord.goToProfileVC()
                    
//                    expect(self.navigationController.instanceVC).to(beAKindOf(ProfileViewController.self))

                }
            }
        }
        //MARK: - goToPostScreen() testing
        describe("goToFollowerVC() testing") {
            context("when func started") {
                beforeEach {
                    self.navigationController.pushViewControllerCalled = false
                    self.mainCoord.navigationRootViewController = self.navigationController
                }
                it("expect push vc to FollowerVC") {
                    let testIdx = 0
                    self.mainCoord.goToFollowerVC(testIdx)

                    expect(self.navigationController.instanceVC).to(beAKindOf(FollowerViewController.self))
                    expect(self.navigationController.pushViewControllerCalled).to(equal(true))
                }
            }
        }
    }
}
