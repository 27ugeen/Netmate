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
        let sut = DataBaseManager()
        
        var container: NSPersistentContainer!
        let imgMock = UIImage()
        var imgUrlTest: String!
        let imageUrlMock = URL(fileURLWithPath: "")
        let testFeedStub = FeedStub(userId: "test", avatar: imgMock, name: "test", prof: "", article: "test", image: imgMock)
        let testFavFeedStub = FavoriteFeedStub(author: "test", authorProf: "test", avatar: imgMock, image: imgMock, article: "test")
        var testFavFeed: FavoriteFeed?
        var testArrFavFeed = [testFavFeed]
        
        describe("Given init testing") {
            let expectedContainer = NSPersistentContainer(name: "DataBaseModel")
            context("When dbManager init") {
                beforeEach {
                    container = NSPersistentContainer(name: "DataBaseModel")
                }
                it("Then should init persistentContainer") {
                    let _ = DataBaseManager.init()
                    
                    expect(container.name).to(equal(expectedContainer.name))
                }
                
                afterEach {
                    container = nil
                }
            }
        }
        
        describe("Given getAllFeed() testing") {
            context("When getAllFeed() start") {
                it("Then expect receive FavoriteFeed array") {
                    let actualArr = sut.getAllFeed()
                    
                    expect(actualArr).to(beAKindOf([FavoriteFeed].self))
                }
            }
        }
        
        describe("Given addFeed() testing") {
            context("When addFeed() start") {
                beforeEach {
                    sut.deleteFeed(favFeed: testFavFeedStub)
                    testFavFeed = FavoriteFeed()
                    testArrFavFeed = []
                }
                it("Then expect added feed to db") {
                    let startArrCount = testArrFavFeed.count
                    waitUntil { done in
                        sut.addFeed(testFeedStub) { completion in
                            testArrFavFeed.append(testFavFeed)
                            expect(completion).to(beNil())
                            expect(testArrFavFeed.count).to(equal(startArrCount + 1))
                            done()
                        }
                    }
                }
                it("Then expect get error post added") {
                    waitUntil { done in
                        sut.addFeed(testFeedStub) {completion in done()}
                    }
                    waitUntil { done in
                        sut.addFeed(testFeedStub) { completion in
                            expect(completion).to(equal("This post has already been added!"))
                            done()
                        }
                    }
                }
                afterEach {
                    testFavFeed = nil
                    sut.deleteFeed(favFeed: testFavFeedStub)
                    testArrFavFeed = []
                }
            }
        }
        
        describe("Given deleteFeed() testing") {
            context("When deleteFeed() start") {
                beforeEach {
                    sut.addFeed(testFeedStub) {completion in}
                    testFavFeed = FavoriteFeed()
                    testArrFavFeed.append(testFavFeed)
                }
                it("Then expect delete feed from db") {
                    let startArrCount = sut.getAllFeed().count + 1
                    var endArrcount = 0
                    waitUntil { done in
                        sut.deleteFeed(favFeed: testFavFeedStub)
                        done()
                        endArrcount = sut.getAllFeed().count
                    }
                    expect(endArrcount).to(equal(startArrCount - 1))
                }
                
                afterEach {
                    sut.deleteFeed(favFeed: testFavFeedStub)
                    testFavFeed = nil
                    testArrFavFeed = []
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
