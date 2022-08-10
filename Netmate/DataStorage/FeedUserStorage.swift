//
//  FriendsList.swift
//  Netmate
//
//  Created by GiN Eugene on 26/7/2022.
//

import UIKit

struct User {
    let avatar: String
    let firstName: String
    let lastName: String
    let nickName: String
    let profession: String
    let feeds: [Feed]
}

struct Feed {
    let article: String
    let image: String
}

//struct User {
//    let avatar: UIImage
//    let firstName: String
//    let lastName: String
//    let nickName: String
//    let profession: String
//    let photo: [Photo]
//    let feed: [Feed]
//}
//
//struct Feed {
//    let article: String
//    let image: UIImage
//}

//struct FeedStorage1 {
//    static var tableModel: [User] = [
//        User(avatar: #imageLiteral(resourceName: "Margot_Robbie_2"),
//             firstName: "Margot",
//             lastName: "Robbie",
//             nickName: "harley_quinn",
//             profession: "Actress, model",
//             photo: [Photo(image: #imageLiteral(resourceName: "bmw")), Photo(image: #imageLiteral(resourceName: "beach")), Photo(image: #imageLiteral(resourceName: "dog-")), Photo(image: #imageLiteral(resourceName: "ocean")), Photo(image: #imageLiteral(resourceName: "zakynthos")), Photo(image: #imageLiteral(resourceName: "cat")), Photo(image: #imageLiteral(resourceName: "woman2")), Photo(image: #imageLiteral(resourceName: "drop")),Photo(image: #imageLiteral(resourceName: "women")), Photo(image: #imageLiteral(resourceName: "jellyfish")), Photo(image: #imageLiteral(resourceName: "smoothie")), Photo(image: #imageLiteral(resourceName: "strawberries")), Photo(image: #imageLiteral(resourceName: "girl-26")), Photo(image: #imageLiteral(resourceName: "kingfisher")), Photo(image: #imageLiteral(resourceName: "man")), Photo(image: #imageLiteral(resourceName: "sailboat")),Photo(image: #imageLiteral(resourceName: "sea-shell")), Photo(image: #imageLiteral(resourceName: "car2"))],
//             feed: [
//                Feed(article: "Margot Elise Robbie (/ˈmɑːrɡoʊ ˈrɒbi/; born 2 July 1990) is an Australian actress and producer. Known for her roles in both blockbusters and independent films, she has received several accolades, including nominations for two Academy Awards, three Golden Globe Awards, and five British Academy Film Awards. Time magazine named her one of the 100 most influential people in the world in 2017 and she was ranked as one of the world's highest-paid actresses by Forbes in 2019.", image: #imageLiteral(resourceName: "beach")),
//                Feed(article: "Robbie received critical acclaim and a nomination for the Academy Award for Best Actress for her portrayal of disgraced figure skater Tonya Harding in the biopic I, Tonya (2017). This acclaim continued with her roles as Queen Elizabeth I in the period drama Mary Queen of Scots (2018), Sharon Tate in the comedy-drama Once Upon a Time in Hollywood (2019), and a fictional Fox News employee in the drama Bombshell (2019); she received BAFTA Award nominations for all three and a nomination for the Academy Award for Best Supporting Actress for the lattermost.", image: #imageLiteral(resourceName: "Margot_Robbie")),
//                Feed(article: "Get ready to watch this team of super-villains including Bloodsport, Peacemaker, Captain Boomerang, Ratcatcher 2, Savant, King Shark, Blackguard, Javelin and Harley Quinn band together to destroy every trace of something known only as \"Project Starfish.\" \"If anyone’s laying down bets, the smart money is against them—all of them,\" read line in the description. \"The Suicide Squad' is something of a sideways sequel to the 2016 film 'Suicide Squad'. This is Gunn's first feature since 2017's 'Guardians of the Galaxy Vol. 2'. He is expected to begin production on a third 'Guardians' film in London later this year. 'The Suicide Squad', which promises to be a fun, icky, and very chaotic good time, sMargot Robbie, Idris Elba, John Cena, Joel Kinnaman, Jai Courtney, Peter Capaldi, David Dastmalchian, Daniela Melchior, Michael Rooker, Alice Braga, Pete Davidson, Joaquín Cosio, Juan Diego Botto, Storm Reid, Nathan Fillion, Steve Agee, Sean Gunn, Mayling Ng, Flula Borg, Jennifer Holland and Tinashe Kajese, with Sylvester Stallone, and Viola Davis. It is slated to release on August 6 in theatres and on an OTT platform.", image: #imageLiteral(resourceName: "Margot_Robbie_1"))]),
//        User(avatar: #imageLiteral(resourceName: "Elon_Mask"),
//             firstName: "Elon",
//             lastName: "Mask",
//             nickName: "the_alien",
//             profession: "FRS, business magnate and investor",
//             photo: [Photo(image: #imageLiteral(resourceName: "macroperspective")), Photo(image: #imageLiteral(resourceName: "ferrari-458-spider")), Photo(image: #imageLiteral(resourceName: "cat")), Photo(image: #imageLiteral(resourceName: "wolf")), Photo(image: #imageLiteral(resourceName: "tasmanian-devil")), Photo(image: #imageLiteral(resourceName: "palm-trees")),Photo(image: #imageLiteral(resourceName: "shoes")), Photo(image: #imageLiteral(resourceName: "sea-25")), Photo(image: #imageLiteral(resourceName: "surf-15")), Photo(image: #imageLiteral(resourceName: "road")), Photo(image: #imageLiteral(resourceName: "porsche")), Photo(image: #imageLiteral(resourceName: "waves")), Photo(image: #imageLiteral(resourceName: "girls")), Photo(image: #imageLiteral(resourceName: "tree"))],
//             feed: [
//                Feed(article: "Elon Reeve Musk FRS (/ˈiːlɒn/ EE-lon; born June 28, 1971) is a business magnate and investor. He is the founder, CEO, and Chief Engineer at SpaceX; angel investor, CEO, and Product Architect of Tesla, Inc.; founder of The Boring Company; and co-founder of Neuralink and OpenAI. With an estimated net worth of around US$242 billion as of July 25, 2022,[5] Musk is the wealthiest person in the world according to both the Bloomberg Billionaires Index and Forbes' real-time billionaires list.", image: #imageLiteral(resourceName: "man")),
//                Feed(article: "Super Heavy is the first stage of SpaceX's two-stage, fully reusable Starship system, which the company is developing to send people and cargo to Mars and other distant destinations. The upper stage is a 165-foot-tall (50 m) spacecraft known as Starship. Starship spacecraft prototypes have flown before. This past May, for instance, a vehicle known as SN15 aced a 6.2-mile-high (10 kilometers) test flight into the South Texas sky. Super Heavy has yet to fly, but SpaceX aims to change that soon. The recently moved Super Heavy, known as Booster 4, is being prepped for an orbital test flight, which will also feature the SN20 Starship prototype. (On Tuesday, Musk tweeted a photo of SN20's six Raptor engines, which technicians had just installed.)", image: #imageLiteral(resourceName: "Super_heavy_rocket")),
//                Feed(article: "Sales rose to $12bn (£8.6bn) in the three months to the end of June, up from $6bn a year ago, when its US factory was shut down. The electric carmaker said it delivered a record 200,000 cars to customers in the same period. It added that public support for greener cars was greater than ever. The company, led by billionaire entrepreneur Elon Musk, reported on Monday that profits soared off the back of strong sales. Profits for the second three months of the year were $1.1bn, up from $104m last year, bolstered by sales of its cheaper Model 3 sedan and Model Y.", image: #imageLiteral(resourceName: "desert"))]),
//        User(avatar: #imageLiteral(resourceName: "Gal_Gadot"),
//             firstName: "Gal",
//             lastName: "Gadot",
//             nickName: "wonder_woman",
//             profession: "Actress, model",
//             photo: [Photo(image: #imageLiteral(resourceName: "ladybug")), Photo(image: #imageLiteral(resourceName: "raccoon")), Photo(image: #imageLiteral(resourceName: "dog-2")), Photo(image: #imageLiteral(resourceName: "zakynthos")), Photo(image: #imageLiteral(resourceName: "face-painting")), Photo(image: #imageLiteral(resourceName: "boat")), Photo(image: #imageLiteral(resourceName: "girls")), Photo(image: #imageLiteral(resourceName: "milky-way")), Photo(image: #imageLiteral(resourceName: "waves")), Photo(image: #imageLiteral(resourceName: "the-sun"))],
//             feed: [
//                Feed(article: "Gadot married Israeli real estate developer Yaron \"Jaron\" Varsano[note 2] in 2008.[89] They have three daughters, born in 2011,[90] 2017, and 2021.[91][50][92][93] The two formed their own film-television production company, Pilot Wave, in 2019.[77] Gadot and Varsano owned a boutique hotel in Tel Aviv, Israel, which she helped run,[94] that eventually was sold to Roman Abramovich in 2015 for $26 million.", image: #imageLiteral(resourceName: "woman2")),
//                Feed(article: "Gadot, fellow Wonder Woman actress Lynda Carter, DC Entertainment President Diane Nelson, Wonder Woman director Patty Jenkins and U.N. Under-Secretary-General Cristina Gallach appeared at the United Nations on 21 October 2016, the 75th anniversary of the first appearance of Wonder Woman, to mark the character's designation by the United Nations as its \"Honorary Ambassador for the Empowerment of Women and Girls\".[53][54] The gesture was intended to raise awareness of UN Sustainable Development Goal No. 5, which seeks to achieve gender equality and empower all women and girls by 2030.[53][54][55] The decision was met with protests from UN staff members who stated in their petition to UN Secretary-General Ban Ki-moon that the character is \"not culturally encompassing or sensitive\" and served to objectify women. As a result, the character was stripped of the designation, and the project ended on 16 December.", image: #imageLiteral(resourceName: "surf-15")),
//                Feed(article: "Gal Gadot-Varsano[6][7][8] (Hebrew: גל גדות [ˈɡal ɡaˈdot];[9] born 30 April 1985[10]) is an Israeli actress and model. At age 18, she was crowned Miss Israel 2004. She then served two years in the Israel Defense Forces as a combat fitness instructor, whereafter she began studying at the IDC Herzliya college while building her modeling and acting careers.", image: #imageLiteral(resourceName: "Gal_Gadot_2"))]),
//        User(avatar: #imageLiteral(resourceName: "Neil _deGrasse _Tyson"),
//             firstName: "Neil deGrasse",
//             lastName: "Tyson",
//             nickName: "the_scientist",
//             profession: "Astrophysicist, science communicator",
//             photo: [Photo(image: #imageLiteral(resourceName: "jellyfish")), Photo(image: #imageLiteral(resourceName: "smoothie")), Photo(image: #imageLiteral(resourceName: "strawberries")), Photo(image: #imageLiteral(resourceName: "girl-26")), Photo(image: #imageLiteral(resourceName: "kingfisher")), Photo(image: #imageLiteral(resourceName: "man")), Photo(image: #imageLiteral(resourceName: "sailboat")),Photo(image: #imageLiteral(resourceName: "sea-shell")), Photo(image: #imageLiteral(resourceName: "car2"))],
//             feed: [
//                Feed(article: "Neil deGrasse Tyson (US: /dəˈɡræs/ or UK: /dəˈɡrɑːs/; born October 5, 1958) is an American astrophysicist, author, and science communicator. Tyson studied at Harvard University, the University of Texas at Austin, and Columbia University. From 1991 to 1994, he was a postdoctoral research associate at Princeton University. In 1994, he joined the Hayden Planetarium as a staff scientist and the Princeton faculty as a visiting research scientist and lecturer. In 1996, he became director of the planetarium and oversaw its $210 million reconstruction project, which was completed in 2000. Since 1996, he has been the director of the Hayden Planetarium at the Rose Center for Earth and Space in New York City. The center is part of the American Museum of Natural History, where Tyson founded the Department of Astrophysics in 1997 and has been a research associate in the department since 2003.", image: #imageLiteral(resourceName: "Neil _deGrasse _Tyson")),
//                Feed(article: "Tyson has written and broadcast extensively about his views of science, spirituality, and the spirituality of science, including the essays \"The Perimeter of Ignorance\"[55] and \"Holy Wars\",[56] both appearing in Natural History magazine and the 2006 Beyond Belief workshop. In an interview with comedian Paul Mecurio, Tyson offered his definition of spirituality: \"For me, when I say spiritual, I’m referring to a feeling you would have that connects you to the universe in a way that it may defy simple vocabulary. We think about the universe as an intellectual playground, which it surely is, but the moment you learn something that touches an emotion rather than just something intellectual, I would call that a spiritual encounter with the universe.\"[57] Tyson has argued that many great historical scientists' belief in intelligent design limited their scientific inquiries, to the detriment of the advance of scientific knowledge.", image: #imageLiteral(resourceName: "Neil _deGrasse _Tyson")),
//                Feed(article: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", image: #imageLiteral(resourceName: "Neil _deGrasse _Tyson"))]),
//        User(avatar: #imageLiteral(resourceName: "Dwaine_Johnson"),
//             firstName: "Dwaine",
//             lastName: "Johnson",
//             nickName: "the_rock",
//             profession: "Actor, professional wrestler",
//             photo: [Photo(image: #imageLiteral(resourceName: "bmw")), Photo(image: #imageLiteral(resourceName: "beach")), Photo(image: #imageLiteral(resourceName: "dog-")), Photo(image: #imageLiteral(resourceName: "ocean")), Photo(image: #imageLiteral(resourceName: "zakynthos")), Photo(image: #imageLiteral(resourceName: "cat")), Photo(image: #imageLiteral(resourceName: "woman2")), Photo(image: #imageLiteral(resourceName: "drop")),Photo(image: #imageLiteral(resourceName: "women"))],
//             feed: [
//                Feed(article: "Dwayne Douglas Johnson (born May 2, 1972), also known by his ring name The Rock,[3] is an American actor, businessman, and former professional wrestler.[6][7] Widely regarded as one of the greatest and most influential professional wrestlers of all time,[8][9] Johnson wrestled for WWE for eight years prior to pursuing an acting career and during his wrestling career, he was integral to the development and success of the WWE during the Attitude Era, an industry boom period in the late 1990s and early 2000s. His films have grossed over $3.5 billion in North America and over $10.5 billion worldwide,[10] making him one of the world's highest-grossing and highest-paid actors.", image: #imageLiteral(resourceName: "Dwaine_Johnson")),
//                Feed(article: "Johnson made his WWF debut as Rocky Maivia, a combination of his father and grandfather's ring names, although his real name was acknowledged by the announcers.[65] He was initially reluctant to take this ring name but was persuaded by Vince McMahon and Jim Ross.[42][66] He was given the nickname \"The Blue Chipper\" and to play up his lineage, he was hyped as the WWF's first third-generation wrestler.[3] Maivia, a clean-cut face character, was pushed heavily from the start despite his wrestling inexperience. He debuted on Monday Night Raw as a member of Marc Mero's entourage on November 4, 1996.[67] His first match came at Survivor Series, on November 17, 1996 in an eight-man elimination tag match; he was the sole survivor and eliminated the final two members of the opposing team, Crush and Goldust.[68] On February 13, 1997, he won the Intercontinental Championship from Hunter Hearst Helmsley on Monday Night Raw.[69][70][71] Maivia then successfully defended the title against Helmsley at In Your House 13: Final Four.", image: #imageLiteral(resourceName: "Dwaine_Johnson")),
//                Feed(article: "The Rock was then entered into the \"Deadly Game\" tournament for the vacant WWF Championship. The finals occurred at Survivor Series on November 15, 1998, where the Rock defeated Vince McMahon's associate, Mankind, to win his first WWF Championship.[89][90] A \"double turn\" then occurred as the Rock turned heel again after allying with Vince and Shane McMahon as the crown jewel of their stable, The Corporation, after the McMahons betrayed Mankind.[89][91] On December 13, 1998, at the pay-per-view named after him, Rock Bottom: In Your House, the Rock had a rematch with Mankind for the WWF Championship. Mankind appeared to win the match when the Rock passed out to the Mandible Claw submission move, but Vince McMahon ruled that since the Rock did not tap out, he retained his title", image: #imageLiteral(resourceName: "Dwaine_Johnson"))]),
//        User(avatar: #imageLiteral(resourceName: "angelina"),
//             firstName: "Angelina",
//             lastName: "Jolie",
//             nickName: "the_witch_maleficent",
//             profession: "Actress, model,filmmake, humanitarian",
//             photo: [Photo(image: #imageLiteral(resourceName: "jellyfish")), Photo(image: #imageLiteral(resourceName: "smoothie")), Photo(image: #imageLiteral(resourceName: "strawberries")), Photo(image: #imageLiteral(resourceName: "girl-26")), Photo(image: #imageLiteral(resourceName: "kingfisher")), Photo(image: #imageLiteral(resourceName: "man")), Photo(image: #imageLiteral(resourceName: "sailboat")),Photo(image: #imageLiteral(resourceName: "sea-shell")), Photo(image: #imageLiteral(resourceName: "car2"))],
//             feed: [
//                Feed(article: "Angelina Jolie[3] DCMG (/dʒoʊˈliː/; born Angelina Jolie Voight;[4] June 4, 1975) is an American actress, filmmaker, and humanitarian. The recipient of numerous accolades, including an Academy Award and three Golden Globe Awards, she has been named Hollywood's highest-paid actress multiple times.", image: #imageLiteral(resourceName: "angelina_3")),
//                Feed(article: "Jolie has pushed for legislation to aid child immigrants and other vulnerable children in both the U.S. and developing nations, including the \"Unaccompanied Alien Child Protection Act of 2005.\"[122][144] She began lobbying humanitarian interests in the U.S. capital from 2003 onwards, explaining, \"As much as I would love to never have to visit Washington, that's the way to move the ball.\"[122] Since October 2008, she has co-chaired Kids in Need of Defense (KIND), a network of leading U.S. law firms that provide free legal aid to unaccompanied minors in immigration proceedings across the U.S.[145] Founded in a collaboration between Jolie and the Microsoft Corporation, by 2013, KIND had become the principal provider of pro bono lawyers for immigrant children.[146] Jolie had previously, from 2005 to 2007, funded the launch of a similar initiative, the U.S. Committee for Refugees and Immigrants' National Center for Refugee and Immigrant Children.", image: #imageLiteral(resourceName: "angelina_1")),
//                Feed(article: "Jolie was involved in a prominent scandal when she was accused of causing the divorce of actors Brad Pitt and Jennifer Aniston in October 2005. She said she fell in love with Pitt during the filming of Mr. & Mrs. Smith (2005), but dismissed allegations of an affair,[196] saying, \"To be intimate with a married man, when my own father cheated on my mother, is not something I could forgive. I could not look at myself in the morning if I did that. I wouldn't be attracted to a man who would cheat on his wife.\"[193] Neither Jolie nor Pitt would publicly comment on the nature of their relationship until January 2006, when she confirmed they were expecting their first child together.", image: #imageLiteral(resourceName: "angelina_2"))]),
//        User(avatar: #imageLiteral(resourceName: "Tom_Cruise"),
//             firstName: "Tom",
//             lastName: "Cruise",
//             nickName: "mission_imposible",
//             profession: "Actor, producer",
//             photo: [Photo(image: #imageLiteral(resourceName: "jellyfish")), Photo(image: #imageLiteral(resourceName: "smoothie")), Photo(image: #imageLiteral(resourceName: "strawberries")), Photo(image: #imageLiteral(resourceName: "girl-26")), Photo(image: #imageLiteral(resourceName: "kingfisher")), Photo(image: #imageLiteral(resourceName: "man")), Photo(image: #imageLiteral(resourceName: "sailboat")),Photo(image: #imageLiteral(resourceName: "sea-shell")), Photo(image: #imageLiteral(resourceName: "car2"))],
//             feed: [
//                Feed(article: "Thomas Cruise Mapother IV (born July 3, 1962) is an American actor and producer. One of the world's highest-paid actors,[1] he has received various accolades, including an Honorary Palme d'Or and three Golden Globe Awards, in addition to nominations for three Academy Awards. His films have grossed over $4 billion in North America and over $10.1 billion worldwide,[2] making him one of the highest-grossing box office stars of all time.", image: #imageLiteral(resourceName: "Tom_Cruise")),
//                Feed(article: "In March 2010, Cruise completed filming the action-comedy Knight and Day, in which he re-teamed with former costar Cameron Diaz; the film was released on June 23, 2010.[44] On February 9, 2010, Cruise confirmed that he would star in Mission: Impossible – Ghost Protocol, the fourth installment in the Mission: Impossible series. The film was released in December 2011[45] to high critical acclaim[46] and box office success.[47] Unadjusted for ticket price inflation, it was Cruise's biggest commercial success to that date.", image: #imageLiteral(resourceName: "Tom_Cruise")),
//                Feed(article: "In 2006, Premiere ranked Cruise as Hollywood's most powerful actor,[148] as Cruise came in at number 13 on the magazine's 2006 Power List, being the highest ranked actor.[149] The same year, Forbes magazine ranked him as the world's most powerful celebrity.[150] The founder of CinemaScore in 2016 cited Cruise and Leonardo DiCaprio as the \"two stars, it doesn't matter how bad the film is, they can pull [the box office] up.\"", image: #imageLiteral(resourceName: "Tom_Cruise"))]
//            )
//    ]
//}

struct UserStorage {
    static var tableModel = [
        UserStub(avatar: #imageLiteral(resourceName: "surfer"),
             firstName: "Gin",
             lastName: "Eugene",
             nickName: "gin_apple_sd",
             profession: "Apple software developer",
             photo: [Photo(image: #imageLiteral(resourceName: "bmw")), Photo(image: #imageLiteral(resourceName: "beach")), Photo(image: #imageLiteral(resourceName: "dog-")), Photo(image: #imageLiteral(resourceName: "ocean")), Photo(image: #imageLiteral(resourceName: "zakynthos")), Photo(image: #imageLiteral(resourceName: "cat")), Photo(image: #imageLiteral(resourceName: "woman2")), Photo(image: #imageLiteral(resourceName: "drop")),Photo(image: #imageLiteral(resourceName: "women")), Photo(image: #imageLiteral(resourceName: "jellyfish")), Photo(image: #imageLiteral(resourceName: "smoothie")), Photo(image: #imageLiteral(resourceName: "strawberries")), Photo(image: #imageLiteral(resourceName: "girl-26")), Photo(image: #imageLiteral(resourceName: "kingfisher")), Photo(image: #imageLiteral(resourceName: "man")), Photo(image: #imageLiteral(resourceName: "sailboat")),Photo(image: #imageLiteral(resourceName: "sea-shell")), Photo(image: #imageLiteral(resourceName: "car2"))],
             feed: [
                FeedStub(article: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", image: #imageLiteral(resourceName: "car2")),
                FeedStub(article: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", image: #imageLiteral(resourceName: "G80-BMW-M3-vs-Alfa-Romeo-Giulia-Quadrifoglio-4-of-4")),
                FeedStub(article: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", image: #imageLiteral(resourceName: "Margot_Robbie_1"))])
    ]
}
