import UIKit

final class SecondViewController: UIViewController {
    
    private var result: [Result] = []
    
    
    private lazy var collectionView: UICollectionView = {
        // Объявление макета
        let layout = createFlowLayout()
        
        // Объвяление коллекции
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = UIColor(named: "Scene")
        collectionView.showsVerticalScrollIndicator = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(HeroCollectionViewCell.self, forCellWithReuseIdentifier: "\(HeroCollectionViewCell.self)")
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        commonInit()
        fetchData()
    }
}

private extension SecondViewController {
    func commonInit() {
        setupLayout()
        setupConstraints()
    }
    
    func setupLayout() {
        view.addSubview(collectionView)
        view.backgroundColor = UIColor(named: "Scene")
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    
    // Получаем данные по API с основного потока
    private func fetchData() {
        NetworkManager.shared.getHero{ [weak self] result in
            DispatchQueue.main.async{
                guard let self else {return}
                self.result = result.results ?? []
                self.collectionView.reloadData()
            }
        }
    }
    
    private func createFlowLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = .init(width: 156, height: 202)
        layout.minimumLineSpacing = 16
        layout.minimumInteritemSpacing = 16
        layout.scrollDirection = .vertical
        layout.sectionInset = .init(top: 0, left: 20, bottom: 30, right: 27)
        return layout
    }
    
    // Реализуем переход на третий экран
    private func showOwerviewController(item: Result) {
        let vc = OverviewHeroController(hero: item)
        vc.navigationItem.largeTitleDisplayMode = .never
        
        let backButton = UIBarButtonItem()
        backButton.title = ""
        backButton.tintColor = .white
        navigationItem.backBarButtonItem = backButton
        navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: - UICollectionViewDaraSource

extension SecondViewController: UICollectionViewDataSource {
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        result.count
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: String(describing:HeroCollectionViewCell.self),
            for: indexPath
        ) as? HeroCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let item = result[indexPath.item]
        cell.update(stringUrl: item.image, title: item.name)
        return cell
    }
}

extension SecondViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = result[indexPath.item]
        showOwerviewController(item: item)
    }
    
}
