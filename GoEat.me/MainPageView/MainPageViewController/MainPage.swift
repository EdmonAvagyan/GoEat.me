//
//  MainPage.swift
//  GoEat.me
//
//  Created by Edmon Avagyan on 22.01.23.
//

import UIKit

//class ResultsVC: UIViewController {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .white
//    }
//}

class MainPage: UIViewController {
    
    @IBOutlet weak var myView: UIView!
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var search: UISearchBar!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var searchController: UISearchBar!
    
    var foodData: [Category] = []
    var filterData = [Category]()
    var products: [Product] = []
    var listFood = [String]()
    var isSearching = false
    
    var barbecue = ["Pork tenderloin barbeque", "Barbecue of pork steak", "Barbecue pork ribs", "Pork barbeque filet", "Grilled lamb", "Kebab with hot pepper", "Kebab with Angus"]
    var pizza = ["Pizza pepperoni", "Pizza assorted", "Pizza margherita", "Pizza regina"]
    var sandwich = ["Club sandwich", "Sandwich felafil", "Sandwich with chicken", "Sandwich with ham"]
    var lahmajo = ["Lahmajo", "Lahmajo with cheese"]
    var shaurma = ["Pork shawarma", "Chicken shawarma"]
    var salad = ["Salad peas", "Salad rainbow", "Salad with beets", "Salad ceaser", "Salad tabbouleh",]
    var juice = ["Natural orange juice", "Lemonade dyushes", "Berry lemonade", "Citrus lemonade"]
    var fresh = ["Banana-Nutella-ice-cream smoothie", "Pineapple-strawberry smoothie", "Banana-orange-apple smoothie", "Orange-grapefruit-lemon smoothie"]
    let conteins: CGFloat = 8
    var searching = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dizayn()
        collectionData()
        setupCategories()
        informationBarbecue()
        informationPizza()
        informationSandwich()
        informationLahmacun()
        informationShaurma()
        informationSalad()
        informationJuice()
        informationFresh()
        searchData()
    }
    
    func searchData() {
        searchController.delegate = self
        searchController.enablesReturnKeyAutomatically = false
        searchController.returnKeyType = UIReturnKeyType.done
        searchController.placeholder = "Search"
    }
    
    func dizayn() {
        myView.layer.cornerRadius = 30
        label1.textColor = .white
        label1.text = "0**-**-**-**"
        image2.tintColor = .white
    }
    
    func collectionData() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(MainPageCVC.nib, forCellWithReuseIdentifier: MainPageCVC.id)
    }
    
    func setupCategories() {
        foodData = [
             Category(id: UUID().uuidString, name: "Barbecue", image: UIImage(named: "Barbecue") ?? UIImage()),
             Category(id: UUID().uuidString, name: "Pizza", image: UIImage(named: "Pizza") ?? UIImage()),
             Category(id: UUID().uuidString, name: "Sandwich", image: UIImage(named: "Sandwich") ?? UIImage()),
             Category(id: UUID().uuidString, name: "Lahmacun", image: UIImage(named: "Lahmacun") ?? UIImage()),
             Category(id: UUID().uuidString, name: "Shaurma", image: UIImage(named: "Shaurma") ?? UIImage()),
             Category(id: UUID().uuidString, name: "Salad", image: UIImage(named: "Salad") ?? UIImage()),
             Category(id: UUID().uuidString, name: "Juice", image: UIImage(named: "Juice") ?? UIImage()),
             Category(id: UUID().uuidString, name: "Fresh", image: UIImage(named: "Fresh") ?? UIImage())
             
        ]
        filterData = foodData
        collectionView.reloadData()
    }
    
    func informationBarbecue() {
        let id = foodData[0].id
        products += [
            Product(id: UUID().uuidString, name: "Pork tenderloin barbeque", image: UIImage(named: "Pork tenderloin barbeque") ?? UIImage(), categoryId: id, price: "9$"),
            Product(id: UUID().uuidString, name: "Barbecue of pork steak", image: UIImage(named: "Barbecue of pork steak") ?? UIImage(), categoryId: id, price: "9$"),
            Product(id: UUID().uuidString, name: "Barbecue pork ribs", image: UIImage(named: "Barbecue pork ribs") ?? UIImage(), categoryId: id, price: "8.7$"),
            Product(id: UUID().uuidString, name: "Pork barbeque filet", image: UIImage(named: "Pork barbeque filet") ?? UIImage(), categoryId: id, price: "7.9$"),
            Product(id: UUID().uuidString, name: "Grilled lamb", image: UIImage(named: "Grilled lamb") ?? UIImage(), categoryId: id, price: "8.5$"),
            Product(id: UUID().uuidString, name: "Kebab with hot pepper", image: UIImage(named: "Kebab with hot pepper") ?? UIImage(), categoryId: id, price: "3.6$"),
            Product(id: UUID().uuidString, name: "Kebab with Angus", image: UIImage(named: "Kebab with Angus") ?? UIImage(), categoryId: id, price: "2.8$")
        ]
    }
    
    func informationPizza() {
        let id = foodData[1].id
        products += [
            Product(id: UUID().uuidString, name: "Pizza pepperoni", image: UIImage(named: "Pizza pepperoni") ?? UIImage(), categoryId: id, price: "6.4$"),
            Product(id: UUID().uuidString, name: "Pizza assorted", image: UIImage(named: "Pizza assorted") ?? UIImage(), categoryId: id, price: "6$"),
            Product(id: UUID().uuidString, name: "Pizza margherita", image: UIImage(named: "Pizza margherita") ?? UIImage(), categoryId: id, price: "6$"),
            Product(id: UUID().uuidString, name: "Pizza regina", image: UIImage(named: "Pizza regina") ?? UIImage(), categoryId: id, price: "7.7$")
        ]
    }
    
    func informationSandwich() {
        let id = foodData[2].id
        products += [
            Product(id: UUID().uuidString, name: "Club sandwich", image: UIImage(named: "Club sandwich") ?? UIImage(), categoryId: id, price: "1.8$"),
            Product(id: UUID().uuidString, name: "Sandwich felafil", image: UIImage(named: "Sandwich felafil") ?? UIImage(), categoryId: id, price: "1.9$"),
            Product(id: UUID().uuidString, name: "Sandwich with chicken", image: UIImage(named: "Sandwich with chicken") ?? UIImage(), categoryId: id, price: "3.4$"),
            Product(id: UUID().uuidString, name: "Sandwich with ham", image: UIImage(named: "Sandwich with ham") ?? UIImage(), categoryId: id, price: "2.8$")
        ]
    }
    
    func informationLahmacun() {
        let id = foodData[3].id
        products += [
            Product(id: UUID().uuidString, name: "Lahmajo", image: UIImage(named: "Lahmajo") ?? UIImage(), categoryId: id, price: "1.9$"),
            Product(id: UUID().uuidString, name: "Lahmajo with cheese", image: UIImage(named: "Lahmajo with cheese") ?? UIImage(), categoryId: id, price: "2.5$")
        ]
    }
    
    func informationShaurma() {
        let id = foodData[4].id
        products += [
            Product(id: UUID().uuidString, name: "Pork shawarma", image: UIImage(named: "Pork shawarma") ?? UIImage(), categoryId: id, price: "2.8$"),
            Product(id: UUID().uuidString, name: "Chicken shawarma", image: UIImage(named: "Chicken shawarma") ?? UIImage(), categoryId: id, price: "2.5$")
        ]
    }
    
    func informationSalad() {
        let id = foodData[5].id
        products += [
            Product(id: UUID().uuidString, name: "Salad peas", image: UIImage(named: "Salad peas") ?? UIImage(), categoryId: id, price: "2.8$"),
            Product(id: UUID().uuidString, name: "Salad rainbow", image: UIImage(named: "Salad rainbow") ?? UIImage(), categoryId: id, price: "2.8$"),
            Product(id: UUID().uuidString, name: "Salad with beets", image: UIImage(named: "Salad with beets") ?? UIImage(), categoryId: id, price: "1.2$"),
            Product(id: UUID().uuidString, name: "Salad ceaser", image: UIImage(named: "Salad ceaser") ?? UIImage(), categoryId: id, price: "2.3$"),
            Product(id: UUID().uuidString, name: "Salad tabbouleh", image: UIImage(named: "Salad tabbouleh") ?? UIImage(), categoryId: id, price: "1,7$")
        ]
    }
    
    func informationJuice() {
        let id = foodData[6].id
        products += [
            Product(id: UUID().uuidString, name: "Natural orange juice", image: UIImage(named: "Natural orange juice") ?? UIImage(), categoryId: id, price: "2$"),
            Product(id: UUID().uuidString, name: "Lemonade dyushes", image: UIImage(named: "Lemonade dyushes") ?? UIImage(), categoryId: id, price: "0.5$"),
            Product(id: UUID().uuidString, name: "Berry lemonade", image: UIImage(named: "Berry lemonade") ?? UIImage(), categoryId: id, price: "4.6$"),
            Product(id: UUID().uuidString, name: "Citrus lemonade", image: UIImage(named: "Citrus lemonade") ?? UIImage(), categoryId: id, price: "4.6$")
        ]
    }
    
    func informationFresh() {
        let id = foodData[7].id
        products += [
            Product(id: UUID().uuidString, name: "Banana-Nutella-ice-cream smoothie", image: UIImage(named: "Banana-Nutella-ice-cream smoothie") ?? UIImage(), categoryId: id, price: "3.8$"),
            Product(id: UUID().uuidString, name: "Pineapple-strawberry smoothie", image: UIImage(named: "Pineapple-strawberry smoothie") ?? UIImage(), categoryId: id, price: "3.8$"),
            Product(id: UUID().uuidString, name: "Banana-orange-apple smoothie", image: UIImage(named: "Banana-orange-apple smoothie") ?? UIImage(), categoryId: id, price: "2.6$"),
            Product(id: UUID().uuidString, name: "Orange-grapefruit-lemon smoothie", image: UIImage(named: "Orange-grapefruit-lemon smoothie") ?? UIImage(), categoryId: id, price: "2.8$")
        ]
    }

}

extension MainPage: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        filterData.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainPageCVC.id, for: indexPath)  as? MainPageCVC else {
            return UICollectionViewCell()
        }
        
        cell.setupData(item: filterData[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return self.sizeInItem(viewItem: collectionView)
    }
    
    func sizeInItem(viewItem: UICollectionView) -> CGSize {
        let widht = viewItem.layer.bounds.width
        let itemWidht = (widht - (conteins * 3)) / 2
        let itemHeight = itemWidht
        return CGSize(width: itemWidht, height: itemHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let category = foodData[indexPath.row]
        let item = products.filter { $0.categoryId == category.id }
        sentNextVC(data: item, title: category.name)
    }
    
    func sentNextVC(data: [Product], title: String) {
        let storiboard = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = storiboard.instantiateViewController(withIdentifier: "FoodTypeVC") as? FoodTypeVC else { return }
        vc.foodData = data
        vc.foodName = title
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension MainPage: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            filterData = foodData
            collectionView.reloadData()
            return
        }
        filterData = foodData.filter({ $0.name.lowercased().contains(searchText.lowercased()) })
        collectionView.reloadData()
    }

}
