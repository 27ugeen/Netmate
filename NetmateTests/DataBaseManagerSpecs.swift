//
//  DataBaseManagerTests.swift
//  NetmateTests
//
//  Created by GiN Eugene on 11/8/2022.
//

import Quick
import Nimble
import CoreData
@testable import Netmate

class DataBaseManagerSpecs: QuickSpec {
    
    override func spec() {
        //sut => system under test
        let container = NSPersistentContainer(name: "DataBaseModel") // - container name same real container
        let docUrl =  FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).last
        let storeUrl = docUrl?.appendingPathComponent("testModel.sqlite")
        do {
            try container.persistentStoreCoordinator.addPersistentStore(ofType: NSSQLiteStoreType,
                                                                        configurationName: nil, at: storeUrl)
        } catch let error {
            print(error)
        }
        
        let backContext = container.newBackgroundContext()
        let sut = DataBaseManager(persistentContainer: container, backgroundContext: backContext)
        
        let imgMock = UIImage()
        var imgUrlTest: String!
        let imageUrlMock = URL(fileURLWithPath: "")
        
        let testFeedStub = FeedStub(userId: "test", avatar: imgMock, name: "test", prof: "", article: "test", image: imgMock)
        let testFavFeedStub = FavoriteFeedStub(author: "test", authorProf: "test", avatar: imgMock, image: imgMock, article: "test")
        
        describe("Given getAllFeed() testing") {
            context("When getAllFeed() start") {
                it("Then expect receive FavoriteFeed array") {
                    waitUntil { done in
                        sut.addFeed(testFeedStub) { data in
                            let actualArr = sut.getAllFeed()
                            expect(actualArr).to(beAKindOf([FavoriteFeed].self))
                            expect(actualArr.count).to(equal(1))
                            done()
                        }
                    }
                }
                afterEach {
                    sut.deleteFeed(favFeed: testFavFeedStub)
                }
            }
        }
        
        describe("Given addFeed() testing") {
            context("When addFeed() start") {
                it("Then expect added feed to db") {
                    waitUntil { done in
                        sut.addFeed(testFeedStub) { completion in
                            let actualArr = sut.getAllFeed()
                            expect(completion).to(beNil())
                            expect(actualArr.first??.author).to(equal(testFeedStub.name))
                            done()
                        }
                    }
                }
                it("Then expect get error post added") {
                    waitUntil { done in
                        sut.addFeed(testFeedStub) {completion in
                            done()
                        }
                    }
                    waitUntil { done in
                        sut.addFeed(testFeedStub) { completion in
                            expect(completion).to(equal("This post has already been added!"))
                            done()
                        }
                    }
                }
                afterEach {
                    sut.deleteFeed(favFeed: testFavFeedStub)
                }
            }
        }
        
        describe("Given deleteFeed() testing") {
            context("When deleteFeed() start") {
                it("Then expect delete feed from db") {
                    var finishArrCount: Int?
                    waitUntil { done in
                        sut.addFeed(testFeedStub) { completion in
                            let actualArr = sut.getAllFeed()
                            sut.deleteFeed(favFeed: testFavFeedStub)
                            finishArrCount = sut.getAllFeed().count
                            expect(actualArr.count).to(equal(1))
                            expect(finishArrCount).to(equal(actualArr.count - 1))
                            done()
                        }
                    }
                }
            }
        }
        
        describe("Given saveImageToDocuments() testing") {
            context("When saveImageToDocuments() start") {
                it("Then expect save img to doc") {
                    let resultStr = sut.saveImageToDocuments(chosenImage: imgMock)
                    expect(resultStr).to(beAKindOf(String.self))
                }
            }
        }
        
        describe("Given getImageFromDocuments() testing") {
            context("When getImageFromDocuments() start") {
                beforeEach {
                    imgUrlTest = sut.saveImageToDocuments(chosenImage: UIImage(named: "default_pic")!)
                }
                it("Then expect get image from doc") {
                    let resultImg = sut.getImageFromDocuments(imageUrl: URL(string: imgUrlTest)!)
                    expect(resultImg).to(beAKindOf(UIImage.self))
                }
                
                it("Then expect get nil") {
                    let resultImg = sut.getImageFromDocuments(imageUrl: imageUrlMock)
                    expect(resultImg).to(beNil())
                }
                afterEach {
                    sut.deleteImageFromDocuments(imageUrl: URL(string: imgUrlTest)!)
                }
            }
        }
    }
}
