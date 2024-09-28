
import UIKit

final class SecondViewController: UIViewController {
    
    // MARK: - Properties

    private var result: [Result] = []

    // MARK: - UI Components

    private lazy var collectionView: UICollectionView = {
        let layout = createFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = UIColor(named: "Scene")
        collectionView.showsVerticalScrollIndicator = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(HeroCollectionViewCell.self, forCellWithReuseIdentifier: "\(HeroCollectionViewCell.self)")
        return collectionView
    }()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        commonInit()
        fetchData()
    }
}

// MARK: - Common init

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
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    
    // Получаем данные по API с основного потока
    private func fetchData() {
        NetworkManager.shared.getHero { [weak self] result in
            DispatchQueue.main.async {
                guard let self else { return }
                self.result = result.results ?? []
                self.collectionView.reloadData()
            }
        }
    }
    
    // Свойство коллекции, здесь можно исправить отображение ячеек
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
    private func showOverviewController() {
        let vc = OverviewHeroController()
        present(vc, animated: true)
    }
}

// MARK: - UICollectionViewDataSource

extension SecondViewController: UICollectionViewDataSource {
    // Сколько значений будет
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        result.count
    }
    
    // Метод чтобы работать со значениями
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        
        // Ячейка
        guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: String(describing: HeroCollectionViewCell.self),
                for: indexPath
            ) as? HeroCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let item = result[indexPath.item]
        cell.update(stringUrl: item.image, title: item.name)
        return cell
    }
}

// MARK: - UICollectionViewDelegate

extension SecondViewController: UICollectionViewDelegate {
    
    func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath
    ) {
        showOverviewController()
    }
}
