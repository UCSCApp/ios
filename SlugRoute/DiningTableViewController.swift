//
//  DiningTableViewController.swift
//  SlugRoute
//
//  Created by Karol josef Bustamante on 9/10/15.
//  Copyright (c) 2015 UCSC iOS. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

class DiningTableViewController: UIViewController{
    var dining : [Dining] = []
    var collegeName : String = ""
    var items : AnyObject = ""

    @IBAction func college8Oakes(sender: UIButton) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        
        for dine in self.dining{
            if(dine.name == "CollegeEight"){
                self.items = dine.items
                self.collegeName = dine.name
            }
        }

    }

    @IBAction func college910(sender: UIButton) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)

        
        for dine in self.dining{
            if(dine.name == "CollegeNine&Ten"){
                self.items = dine.items
                self.collegeName = dine.name
            }
        }

    }

    @IBAction func cowellstevenson(sender: UIButton) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)

        
        for dine in self.dining{
            if(dine.name == "Cowell"){
                self.items = dine.items
                self.collegeName = dine.name
            }
        }
        
    }
    
    @IBAction func porterkresge(sender: UIButton) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        
        for dine in self.dining{
            if(dine.name == "Porter"){
                self.items = dine.items
                self.collegeName = dine.name
            }
        }

    }
    @IBAction func merrill(sender: UIButton) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        
        for dine in self.dining{
            if(dine.name == "Crown&Merill"){
                self.items = dine.items
                self.collegeName = dine.name
            }
        }
        

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        super.viewDidLoad()
        self.title  = "Dining"
        
        getDining()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getDining()
    {
        /*
        Alamofire.request(.GET, "http://ec2-52-8-25-141.us-west-1.compute.amazonaws.com/dining/get/v1")
            .responseJSON { (req, res, json, error) in
                if(error != nil)
                {
                    NSLog("Error: \(error)")
                    println(req)
                    println(res)
                }
                else
                {
                    var json = JSON(json!)
                    self.parseDining(json)
                }
        }
        */
        var json : String = "[{\"name\":\"Cowell\",\"items\":{\"breakfast\":[{\"name\":\"BelgianWaffles\",\"attribs\":[\"eggs\",\"milk\",\"soy\",\"veggie\"]},{\"name\":\"CageFreeScrambledEggs\",\"attribs\":[\"eggs\",\"gluten\",\"veggie\"]},{\"name\":\"EggbeatersScramble\",\"attribs\":[\"eggs\",\"gluten\",\"veggie\"]},{\"name\":\"HardcookedCageFreeEggs\",\"attribs\":[\"eggs\",\"gluten\",\"veggie\"]},{\"name\":\"NaturalBridgesTofuScramble\",\"attribs\":[\"soy\",\"vegan\",\"gluten\"]},{\"name\":\"BananaandCoconutPancakes\",\"attribs\":[\"eggs\",\"milk\",\"veggie\"]},{\"name\":\"OatmealGluten-Free\",\"attribs\":[\"vegan\",\"gluten\"]},{\"name\":\"SlicedPortugueseLinguica\",\"attribs\":[]},{\"name\":\"SpamandEggScramble\",\"attribs\":[]},{\"name\":\"ChocolateLoafBread\",\"attribs\":[\"eggs\",\"milk\",\"soy\"]},{\"name\":\"MorningGloryBlueberryMuffin\",\"attribs\":[\"eggs\",\"milk\",\"soy\"]},{\"name\":\"PeachHoneyBranMuffin\",\"attribs\":[]},{\"name\":\"VeganGranola\",\"attribs\":[\"vegan\",\"nuts\",\"soy\"]},{\"name\":\"CageFreeEggsOmeletteBar\",\"attribs\":[]}],\"lunch\":[{\"name\":\"PolynesianChickenSoup\",\"attribs\":[\"soy\",\"gluten\"]},{\"name\":\"Sweet&SourMushroomSoup\",\"attribs\":[\"soy\",\"vegan\",\"gluten\"]},{\"name\":\"BigIslandChickenSandwich\",\"attribs\":[\"soy\"]},{\"name\":\"MauiMahiMahi\",\"attribs\":[\"fish\",\"nuts\",\"soy\"]},{\"name\":\"CowellSpecialtyBreads\",\"attribs\":[\"milk\",\"nuts\",\"soy\"]},{\"name\":\"ChocolateChipCookie\",\"attribs\":[]},{\"name\":\"KaluaMayzanSlider\",\"attribs\":[\"soy\",\"veggie\",\"eggs\",\"milk\"]},{\"name\":\"KaluaPorkSlider\",\"attribs\":[\"pork\",\"soy\",\"eggs\"]},{\"name\":\"BrownieM&M\",\"attribs\":[\"eggs\",\"milk\",\"soy\"]},{\"name\":\"GranolaNutCookies\",\"attribs\":[\"milk\",\"eggs\",\"soy\"]},{\"name\":\"HawaiianBakedBeans\",\"attribs\":[]},{\"name\":\"HawaiianBar\",\"attribs\":[]},{\"name\":\"HawaiianColeslaw\",\"attribs\":[]},{\"name\":\"HawaiianMacaroniSalad\",\"attribs\":[\"milk\",\"eggs\",\"veggie\"]},{\"name\":\"RoastedSweetPotatoes\",\"attribs\":[]},{\"name\":\"SpamFriedRice\",\"attribs\":[\"soy\",\"eggs\",\"gluten\",\"pork\"]}],\"dinner\":[{\"name\":\"IslandBeefSteak\",\"attribs\":[\"beef\",\"soy\"]},{\"name\":\"SpicyHawaiianMangoandShrimpStirfry\",\"attribs\":[\"fish\",\"soy\"]},{\"name\":\"SpicyHawaiianMangoandTofuStirfry\",\"attribs\":[\"soy\",\"vegan\"]},{\"name\":\"BBQChickenPizza\",\"attribs\":[\"milk\",\"soy\"]},{\"name\":\"CheesePizza\",\"attribs\":[\"milk\",\"veggie\"]},{\"name\":\"BrownieM&M\",\"attribs\":[\"eggs\",\"milk\",\"soy\"]},{\"name\":\"FrenchRolls\",\"attribs\":[\"vegan\",\"soy\"]},{\"name\":\"PumpkinPie\",\"attribs\":[\"milk\",\"eggs\",\"soy\"]},{\"name\":\"HawaiianBakedBeans\",\"attribs\":[]},{\"name\":\"HawaiianBar\",\"attribs\":[]},{\"name\":\"HawaiianColeslaw\",\"attribs\":[]},{\"name\":\"HawaiianMacaroniSalad\",\"attribs\":[\"milk\",\"eggs\",\"veggie\"]},{\"name\":\"RoastedSweetPotatoes\",\"attribs\":[]},{\"name\":\"SpamFriedRice\",\"attribs\":[\"soy\",\"eggs\",\"gluten\",\"pork\"]}]}},{\"name\":\"Crown&Merill\",\"items\":{\"breakfast\":[{\"name\":\"BelgianWaffles\",\"attribs\":[\"eggs\",\"milk\",\"soy\",\"veggie\"]},{\"name\":\"CageFreeScrambledEggs\",\"attribs\":[\"eggs\",\"gluten\",\"veggie\"]},{\"name\":\"CrispyBacon\",\"attribs\":[\"gluten\",\"pork\"]},{\"name\":\"EggbeatersScramble\",\"attribs\":[\"eggs\",\"gluten\",\"veggie\"]},{\"name\":\"HardcookedCageFreeEggs\",\"attribs\":[\"eggs\",\"gluten\",\"veggie\"]},{\"name\":\"NaturalBridgesTofuScramble\",\"attribs\":[\"soy\",\"vegan\",\"gluten\"]},{\"name\":\"FrenchToast\",\"attribs\":[\"milk\",\"eggs\"]},{\"name\":\"ChocolateLoafBread\",\"attribs\":[\"eggs\",\"milk\",\"soy\"]},{\"name\":\"MorningGloryBlueberryMuffin\",\"attribs\":[\"eggs\",\"milk\",\"soy\"]},{\"name\":\"PeachHoneyBranMuffin\",\"attribs\":[]},{\"name\":\"CageFreeEggsOmeletteBar\",\"attribs\":[]}],\"lunch\":[{\"name\":\"FireRoastedCornSoup\",\"attribs\":[\"milk\",\"veggie\"]},{\"name\":\"TexasBeefChili\",\"attribs\":[\"beef\",\"gluten\"]},{\"name\":\"CaliforniaBLTWrap\",\"attribs\":[]},{\"name\":\"HotTurkeySandwich\",\"attribs\":[]},{\"name\":\"VegetableLoMein\",\"attribs\":[\"soy\",\"vegan\",\"gluten\"]},{\"name\":\"ChocolateChipCookie\",\"attribs\":[]},{\"name\":\"BrownieM&M\",\"attribs\":[\"eggs\",\"milk\",\"soy\"]},{\"name\":\"FrenchRolls\",\"attribs\":[\"vegan\",\"soy\"]},{\"name\":\"GranolaNutCookies\",\"attribs\":[\"milk\",\"eggs\",\"soy\"]},{\"name\":\"BARWings\",\"attribs\":[]},{\"name\":\"BBQWings\",\"attribs\":[]},{\"name\":\"Condiments\",\"attribs\":[]},{\"name\":\"HawaiianColeslaw\",\"attribs\":[]},{\"name\":\"Hot\'NSpicyWings\",\"attribs\":[]},{\"name\":\"TeriyakiGlazeWings\",\"attribs\":[\"soy\"]},{\"name\":\"VeganBakedBeans\",\"attribs\":[\"vegan\",\"gluten\"]},{\"name\":\"VeganWings\",\"attribs\":[\"vegan\",\"soy\"]}],\"dinner\":[{\"name\":\"CaliforniaPasta\",\"attribs\":[\"vegan\"]},{\"name\":\"ItalianHerbRoastedPorkChop\",\"attribs\":[]},{\"name\":\"RoastedToscanoPotatoes\",\"attribs\":[\"vegan\",\"gluten\"]},{\"name\":\"BrownieM&M\",\"attribs\":[\"eggs\",\"milk\",\"soy\"]},{\"name\":\"FrenchRolls\",\"attribs\":[\"vegan\",\"soy\"]},{\"name\":\"PumpkinPie\",\"attribs\":[\"milk\",\"eggs\",\"soy\"]},{\"name\":\"BARWings\",\"attribs\":[]},{\"name\":\"BBQWings\",\"attribs\":[]},{\"name\":\"Condiments\",\"attribs\":[]},{\"name\":\"HawaiianColeslaw\",\"attribs\":[]},{\"name\":\"Hot\'NSpicyWings\",\"attribs\":[]},{\"name\":\"TeriyakiGlazeWings\",\"attribs\":[\"soy\"]},{\"name\":\"VeganBakedBeans\",\"attribs\":[\"vegan\",\"gluten\"]},{\"name\":\"VeganWings\",\"attribs\":[\"vegan\",\"soy\"]}]}},{\"name\":\"Porter\",\"items\":{\"breakfast\":[{\"name\":\"ChocolateLoafBread\",\"attribs\":[\"eggs\",\"milk\",\"soy\"]},{\"name\":\"MorningGloryBlueberryMuffin\",\"attribs\":[\"eggs\",\"milk\",\"soy\"]},{\"name\":\"PeachHoneyBranMuffin\",\"attribs\":[]},{\"name\":\"VeganGranola\",\"attribs\":[\"vegan\",\"nuts\",\"soy\"]},{\"name\":\"ApplePancakes\",\"attribs\":[\"milk\",\"eggs\"]},{\"name\":\"CageFreeEggsOmeletteBar\",\"attribs\":[]},{\"name\":\"OatmealGluten-Free\",\"attribs\":[\"vegan\",\"gluten\"]},{\"name\":\"BelgianWaffles\",\"attribs\":[\"eggs\",\"milk\",\"soy\",\"veggie\"]},{\"name\":\"CageFreeScrambledEggs\",\"attribs\":[\"eggs\",\"gluten\",\"veggie\"]},{\"name\":\"FlourTortilla\",\"attribs\":[\"vegan\"]},{\"name\":\"HardcookedCageFreeEggs\",\"attribs\":[\"eggs\",\"gluten\",\"veggie\"]},{\"name\":\"HashBrownPatty\",\"attribs\":[\"vegan\",\"soy\"]},{\"name\":\"NaturalBridgesTofuScramble\",\"attribs\":[\"soy\",\"vegan\",\"gluten\"]},{\"name\":\"SausageLinks\",\"attribs\":[\"pork\",\"gluten\"]}],\"lunch\":[{\"name\":\"ChocolateChipCookie\",\"attribs\":[]},{\"name\":\"BrownieM&M\",\"attribs\":[\"eggs\",\"milk\",\"soy\"]},{\"name\":\"GranolaNutCookies\",\"attribs\":[\"milk\",\"eggs\",\"soy\"]},{\"name\":\"ChickenTortillaSoup\",\"attribs\":[\"milk\",\"soy\"]},{\"name\":\"CreamofCarrot&DillSoup\",\"attribs\":[\"milk\",\"soy\",\"veggie\"]},{\"name\":\"PortobelloPhillySandwich\",\"attribs\":[\"veggie\",\"milk\"]},{\"name\":\"BaconCheeseburgerMeatloaf\",\"attribs\":[\"beef\",\"pork\",\"eggs\",\"soy\"]},{\"name\":\"CashewPaellaValencia\",\"attribs\":[\"vegan\",\"nuts\",\"soy\"]},{\"name\":\"SeafoodCashewPaellaValencia\",\"attribs\":[\"fish\",\"nuts\",\"soy\"]},{\"name\":\"SteakCutFries\",\"attribs\":[\"vegan\",\"soy\"]},{\"name\":\"BarPasta\",\"attribs\":[]},{\"name\":\"CheeseRavioli\",\"attribs\":[\"veggie\"]},{\"name\":\"CreamyAlfredoSauce\",\"attribs\":[\"milk\",\"veggie\"]},{\"name\":\"MarinaraSauce\",\"attribs\":[\"soy\",\"vegan\"]},{\"name\":\"Meatballs\",\"attribs\":[]},{\"name\":\"CheesePizza\",\"attribs\":[\"milk\",\"veggie\"]},{\"name\":\"VegetablePizza\",\"attribs\":[\"milk\",\"veggie\"]}],\"dinner\":[{\"name\":\"FrenchRolls\",\"attribs\":[\"vegan\",\"soy\"]},{\"name\":\"PumpkinPie\",\"attribs\":[\"milk\",\"eggs\",\"soy\"]},{\"name\":\"CornedBeefBrisket\",\"attribs\":[\"beef\",\"gluten\"]},{\"name\":\"OrangeGlazedPork\",\"attribs\":[\"pork\",\"soy\"]},{\"name\":\"OrangeGlazedSeitan\",\"attribs\":[\"soy\",\"vegan\"]},{\"name\":\"RedParsliedPotatoes\",\"attribs\":[\"soy\",\"vegan\"]},{\"name\":\"SteamedCabbage\",\"attribs\":[\"vegan\",\"gluten\"]},{\"name\":\"StickyRice\",\"attribs\":[\"vegan\",\"gluten\"]},{\"name\":\"BarPasta\",\"attribs\":[]},{\"name\":\"CheeseRavioli\",\"attribs\":[\"veggie\"]},{\"name\":\"CreamyAlfredoSauce\",\"attribs\":[\"milk\",\"veggie\"]},{\"name\":\"MarinaraSauce\",\"attribs\":[\"soy\",\"vegan\"]},{\"name\":\"Meatballs\",\"attribs\":[]},{\"name\":\"CheesePizza\",\"attribs\":[\"milk\",\"veggie\"]},{\"name\":\"VegetablePizza\",\"attribs\":[\"milk\",\"veggie\"]}]}},{\"name\":\"CollegeEight\",\"items\":{\"breakfast\":[{\"name\":\"BelgianWaffles\",\"attribs\":[\"eggs\",\"milk\",\"soy\",\"veggie\"]},{\"name\":\"CageFreeScrambledEggs\",\"attribs\":[\"eggs\",\"gluten\",\"veggie\"]},{\"name\":\"EggbeatersScramble\",\"attribs\":[\"eggs\",\"gluten\",\"veggie\"]},{\"name\":\"HardcookedCageFreeEggs\",\"attribs\":[\"eggs\",\"gluten\",\"veggie\"]},{\"name\":\"HealthyMondays\",\"attribs\":[]},{\"name\":\"NaturalBridgesTofuScramble\",\"attribs\":[\"soy\",\"vegan\",\"gluten\"]},{\"name\":\"OatmealToppingsBar\",\"attribs\":[\"vegan\",\"nuts\"]},{\"name\":\"RoastedPotatoes\",\"attribs\":[\"vegan\"]},{\"name\":\"SoyrizoandPotatoes\",\"attribs\":[\"vegan\",\"soy\"]},{\"name\":\"PumpkinPancakes\",\"attribs\":[\"eggs\",\"milk\",\"veggie\"]},{\"name\":\"OatmealGluten-Free\",\"attribs\":[\"vegan\",\"gluten\"]},{\"name\":\"ChocolateLoafBread\",\"attribs\":[\"eggs\",\"milk\",\"soy\"]},{\"name\":\"MorningGloryBlueberryMuffin\",\"attribs\":[\"eggs\",\"milk\",\"soy\"]},{\"name\":\"PeachHoneyBranMuffin\",\"attribs\":[]},{\"name\":\"VeganGranola\",\"attribs\":[\"vegan\",\"nuts\",\"soy\"]},{\"name\":\"CageFreeEggsOmeletteBar\",\"attribs\":[]}],\"lunch\":[{\"name\":\"IndianVegetableSoup\",\"attribs\":[\"vegan\",\"nuts\"]},{\"name\":\"TomatoBasilBisque\",\"attribs\":[\"milk\",\"veggie\"]},{\"name\":\"ChipotleSeitanandHummusWrap\",\"attribs\":[\"vegan\"]},{\"name\":\"OrganicBrownBasmatiRice\",\"attribs\":[\"vegan\",\"gluten\"]},{\"name\":\"SpicyGarbanzoandVegetableStirFry\",\"attribs\":[\"vegan\",\"gluten\"]},{\"name\":\"VeggieStromboli\",\"attribs\":[\"milk\",\"veggie\"]},{\"name\":\"GrilledGoatCheeseandPeppedew\",\"attribs\":[\"milk\",\"veggie\",\"soy\"]},{\"name\":\"BrownieM&M\",\"attribs\":[\"eggs\",\"milk\",\"soy\"]},{\"name\":\"ChocolateChipCookie\",\"attribs\":[]},{\"name\":\"FrenchRolls\",\"attribs\":[\"vegan\",\"soy\"]},{\"name\":\"GranolaNutCookies\",\"attribs\":[\"milk\",\"eggs\",\"soy\"]},{\"name\":\"BakedPotatoBarCondiments\",\"attribs\":[]},{\"name\":\"BakedPotato\",\"attribs\":[\"vegan\"]},{\"name\":\"BakedSweetPotato\",\"attribs\":[\"vegan\",\"gluten\"]}],\"dinner\":[{\"name\":\"HealthyMondays\",\"attribs\":[]},{\"name\":\"IndianVegetableSoup\",\"attribs\":[\"vegan\",\"nuts\"]},{\"name\":\"TomatoBasilBisque\",\"attribs\":[\"milk\",\"veggie\"]},{\"name\":\"AsianSpicedMayzanMeatloaf\",\"attribs\":[\"vegan\",\"soy\"]},{\"name\":\"GreekPennewithSpinach&Feta\",\"attribs\":[\"milk\",\"soy\",\"veggie\"]},{\"name\":\"QuinoaFried\\\"Rice\\\"\",\"attribs\":[\"veggie\",\"eggs\"]},{\"name\":\"VeganVeggiePizza\",\"attribs\":[\"soy\",\"vegan\"]},{\"name\":\"BrownieM&M\",\"attribs\":[\"eggs\",\"milk\",\"soy\"]},{\"name\":\"FrenchRolls\",\"attribs\":[\"vegan\",\"soy\"]},{\"name\":\"PumpkinPie\",\"attribs\":[\"milk\",\"eggs\",\"soy\"]},{\"name\":\"BakedPotatoBarCondiments\",\"attribs\":[]},{\"name\":\"BakedPotato\",\"attribs\":[\"vegan\"]},{\"name\":\"BakedSweetPotato\",\"attribs\":[\"vegan\",\"gluten\"]}]}},{\"name\":\"CollegeNine&Ten\",\"items\":{\"breakfast\":[{\"name\":\"ChickenAppleSausage\",\"attribs\":[\"gluten\"]},{\"name\":\"BelgianWaffles\",\"attribs\":[\"eggs\",\"milk\",\"soy\",\"veggie\"]},{\"name\":\"CageFreeScrambledEggs\",\"attribs\":[\"eggs\",\"gluten\",\"veggie\"]},{\"name\":\"HardcookedCageFreeEggs\",\"attribs\":[\"eggs\",\"gluten\",\"veggie\"]},{\"name\":\"NaturalBridgesTofuScramble\",\"attribs\":[\"soy\",\"vegan\",\"gluten\"]},{\"name\":\"PumpkinPancakes\",\"attribs\":[\"eggs\",\"milk\",\"veggie\"]},{\"name\":\"HashBrownPatty\",\"attribs\":[\"vegan\",\"soy\"]},{\"name\":\"OatmealGluten-Free\",\"attribs\":[\"vegan\",\"gluten\"]},{\"name\":\"ChocolateLoafBread\",\"attribs\":[\"eggs\",\"milk\",\"soy\"]},{\"name\":\"MorningGloryBlueberryMuffin\",\"attribs\":[\"eggs\",\"milk\",\"soy\"]},{\"name\":\"PeachHoneyBranMuffin\",\"attribs\":[]},{\"name\":\"VeganGranola\",\"attribs\":[\"vegan\",\"nuts\",\"soy\"]},{\"name\":\"CageFreeEggsOmeletteBar\",\"attribs\":[]}],\"lunch\":[{\"name\":\"HarvestVegetableSoupwithBasil\",\"attribs\":[\"soy\",\"vegan\"]},{\"name\":\"PortugueseSausage/BeanSoup\",\"attribs\":[\"pork\",\"milk\"]},{\"name\":\"ChickenNuggets\",\"attribs\":[\"soy\"]},{\"name\":\"HoisinGingerMeatloaf\",\"attribs\":[\"soy\",\"pork\",\"eggs\"]},{\"name\":\"PanzanellaBreadSalad\",\"attribs\":[\"milk\",\"eggs\"]},{\"name\":\"ThaiCoconutMayzanStirfry\",\"attribs\":[]},{\"name\":\"PizzaVeggieCombo\",\"attribs\":[]},{\"name\":\"AsianSesameMashedPotatoes\",\"attribs\":[\"milk\",\"veggie\"]},{\"name\":\"BrownieM&M\",\"attribs\":[\"eggs\",\"milk\",\"soy\"]},{\"name\":\"FrenchRolls\",\"attribs\":[\"vegan\",\"soy\"]},{\"name\":\"GranolaNutCookies\",\"attribs\":[\"milk\",\"eggs\",\"soy\"]},{\"name\":\"BARWings\",\"attribs\":[]},{\"name\":\"BBQWings\",\"attribs\":[]},{\"name\":\"Condiments\",\"attribs\":[]},{\"name\":\"HawaiianColeslaw\",\"attribs\":[]},{\"name\":\"Hot\'NSpicyWings\",\"attribs\":[]},{\"name\":\"TeriyakiGlazeWings\",\"attribs\":[\"soy\"]},{\"name\":\"VeganBakedBeans\",\"attribs\":[\"vegan\",\"gluten\"]},{\"name\":\"VeganWings\",\"attribs\":[\"vegan\",\"soy\"]}],\"dinner\":[{\"name\":\"OvenRoastedTurkey\",\"attribs\":[\"gluten\"]},{\"name\":\"ShrimpandScallopDiabloonLinguine\",\"attribs\":[\"fish\"]},{\"name\":\"TofuDiabloonLinguine\",\"attribs\":[\"soy\",\"vegan\"]},{\"name\":\"Sweet&SpicyCouscous\",\"attribs\":[]},{\"name\":\"PizzaVeggieCombo\",\"attribs\":[]},{\"name\":\"TraditionalSageStuffing\",\"attribs\":[\"milk\",\"soy\",\"veggie\"]},{\"name\":\"BrownieM&M\",\"attribs\":[\"eggs\",\"milk\",\"soy\"]},{\"name\":\"PumpkinPie\",\"attribs\":[\"milk\",\"eggs\",\"soy\"]}]}}]"
        
        // convert String to NSData
        var data: NSData = json.dataUsingEncoding(NSUTF8StringEncoding)!
        var error: NSError?
        
        // convert NSData to 'AnyObject'
        let anyObj: AnyObject? = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions(0),
            error: &error)
        
        // convert 'AnyObject' to Array<Business>
        var jsonObj = JSON(anyObj!)
        self.parseDining(jsonObj)
    }
    
    
    func parseDining(data : JSON)
    {
        for(key : String, json : JSON) in data
        {
            dining.append(Dining(data: json))
        }
        
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
            
        var yourNextViewController = (segue.destinationViewController as! MealsTableViewController)
        yourNextViewController.items = self.items
        yourNextViewController.collegeName = self.collegeName
        
    }

    
}
