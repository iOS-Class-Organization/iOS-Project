//
//  ActivitySelectionViewController.swift
//  Time Killer
//
//  Created by John Smith V on 4/20/21.
//

import UIKit
import AlamofireImage

class ActivitySelectionViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
    

    var category: String!
    
    // Dictionary that contains the activity category, and the different categories underneath
    var activityDict: [String: [String]] = ["Fitness": ["Baseball", "Basketball", "Cricket", "Running", "American Football", "Soccer", "Weight Training", "HIIT", "Yoga" ],
                                            "Movies": ["Star Wars: The Phantom Menace", "Star Wars: Attack of the Clones", "Star Wars: Revenge of the Sith", "Star Wars: Rogue One", "Solo: A Star Wars Story", "Star Wars: A New Hope", "Star Wars: The Empire Strikes Back", "Star Wars: Return of the Jedi", "Star Wars: The Force Awakens", "Star Wars: The Last Jedi", "Star Wars: The Rise of Skywalker"]]
    // This dictionary has the activities and then a link to a picture as its value
    var activityPics: [String: String] = ["Baseball":"https://static01.nyt.com/images/2020/08/24/sports/24mlb-kepner-1/merlin_176084667_69b1099b-0b7e-41ce-bfdf-e407899f10dc-articleLarge.jpg?quality=75&auto=webp&disable=upscale",
                                          "Basketball":"https://img.bleacherreport.net/img/images/photos/002/161/955/Jordan_dunk_original_original_original_crop_exact_crop_north.jpeg?1361040133&w=3072&h=2048",
                                          "Cricket":"https://thumbor.forbes.com/thumbor/711x473/https://specials-images.forbesimg.com/imageserve/1156260993/960x0.jpg?fit=scale",
                                          "Running":"https://www.sciencemag.org/sites/default/files/styles/article_main_large/public/1036780592-1280x720.jpg?itok=k4u7CDBb",
                                          "American Football":"https://bloximages.chicago2.vip.townnews.com/siouxcityjournal.com/content/tncms/assets/v3/editorial/4/2c/42c79a12-66e9-50bf-8a1c-a8180bc19a52/5dbce4cab8d04.image.jpg?resize=500%2C592",
                                          "Soccer":"https://cdn.britannica.com/34/212134-050-A7289400/Lionel-Messi-2018.jpg",
                                          "Weight Training":"https://www.runtastic.com/blog/wp-content/uploads/2016/10/23.10._Running-And-Weight-Training-3.jpg",
                                          "HIIT":"https://images.contentstack.io/v3/assets/blt45c082eaf9747747/blta585249cb277b1c3/5fdcfa83a703d10ab87e827b/HIIT.jpg?width=1200&height=630&fit=crop",
                                          "Yoga":"https://images.everydayhealth.com/images/healthy-living/fitness/all-about-yoga-mega-722x406.jpg",
                                          "Star Wars: The Phantom Menace":"https://starwarsblog.starwars.com/wp-content/uploads/2019/05/quigon-obiwan-maul-duel-tall.jpg",
                                          "Star Wars: Attack of the Clones":"https://static.hollywoodreporter.com/sites/default/files/2014/11/star_wars_attack_of_the_clones.jpg",
                                          "Star Wars: Revenge of the Sith":"https://www.gannett-cdn.com/-mm-/ec053d705e135e22f778aeb401b098af169088ab/c=0-0-912-515/local/-/media/2015/12/11/USATODAY/USATODAY/635854422762387306-XXX-d-star-fight-01.jpg?width=660&height=373&fit=crop&format=pjpg&auto=webp",
                                          "Star Wars: Rogue One":"https://i.ytimg.com/vi/wxL8bVJhXCM/sddefault.jpg",
                                          "Solo: A Star Wars Story":"https://media.wired.com/photos/5b0474eb0864e3415cb90dbd/2:1/w_2400,h_1200,c_limit/Solo_MovieReview.jpg",
                                          "Star Wars: A New Hope":"https://res.cloudinary.com/jerrick/image/upload/fl_progressive,q_auto,w_1024/rjwlkqxzkoimpk6vh8tj.jpg",
                                          "Star Wars: The Empire Strikes Back":"https://media.wired.com/photos/5955bc95ad90646d424bb521/191:100/w_1280,c_limit/Empire-Strikes-Back.png",
                                          "Star Wars: Return of the Jedi":"https://i.pinimg.com/originals/ab/b7/16/abb71655cb003ca0032110fc1631facf.jpg",
                                          "Star Wars: The Force Awakens":"https://res.cloudinary.com/mhrth/image/upload/c_fill,f_auto,h_535,q_auto,w_600/star-wars-force-awakens_x7wqoc.jpg",
                                          "Star Wars: The Last Jedi":"https://i.gadgets360cdn.com/large/star-wars-last-jedi-review_1513250905980.jpg",
                                          "Star Wars: The Rise of Skywalker":"https://i.guim.co.uk/img/media/42c5e5a17f0972ae0062568be857c15a97e93b09/571_251_2402_1442/master/2402.jpg?width=1200&quality=85&auto=format&fit=max&s=c94ddabf217b982f7dd80d7857754827"]
    
    var activityArray: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        activityArray = activityDict[category]!
        self.tableView.reloadData()
        print(activityArray)
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return activityArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ActivitySelectionTableViewCell") as! ActivitySelectionTableViewCell
        
        
        let activity = activityArray[indexPath.row];
        print(activity)
        
        cell.activityName.text = activity
        
        let posterURL = URL(string: activityPics[activity]!)
        print(posterURL)
        cell.activityImageView.af.setImage(withURL: posterURL!)
        
        return cell
    }
    

}
