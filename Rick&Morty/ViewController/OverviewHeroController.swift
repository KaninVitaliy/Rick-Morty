//
//  OverviewHero.swift
//  Rick&Morty_Second
//
//  Created by Виталий Канин on 28.09.2024.
//

import UIKit

class OverviewHeroController: UIViewController {
    
    var hero: Result
    var heroAvatar: [String]
    var heroInfo: [String]
    var sections: [[String]]
    var heroOrigin: [String]
    var countEpisode: [String]
    
    private lazy var collectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .none
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.bounces = false
        collectionView.dataSource = self
        
        return collectionView
    }()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "Scene")
        
        setupViews()
        setupConstraints()
    }
    


    internal init(hero: Result) {
        
        self.hero = hero
        self.heroAvatar = [self.hero.image ?? "", self.hero.name ?? "", self.hero.status?.rawValue ?? ""]
        self.heroInfo = [self.hero.species?.rawValue ?? "", self.hero.type ?? "", self.hero.gender?.rawValue ?? ""]
        self.heroOrigin = [self.hero.origin?.name ?? ""]
        self.countEpisode = [String(self.hero.episode?.count ?? 0)]
        // Нужно взять id локации у героя
        self.sections = [self.heroAvatar, self.heroInfo, self.heroOrigin, self.countEpisode]
        
        super.init(nibName: nil, bundle: nil)
        
    }
    
    private func setupViews() {
        
        view.addSubview(collectionView)
        collectionView.register(AvatarCollectionViewCell.self)
        collectionView.register(InfoCollectionViewCell.self)
        collectionView.register(OriginCollectionViewCell.self)
        collectionView.register(EpisodCollectionViewCell.self)
        collectionView.collectionViewLayout = createLayout()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

//MARK: - Create Layout

extension OverviewHeroController {
    
    private func createLayout() -> UICollectionViewCompositionalLayout {
        
        UICollectionViewCompositionalLayout { [weak self] sectionIndex, _ in
            switch sectionIndex {
            case 0:
                return self?.createAvatarSection()
            case 1:
                return self?.createInfoSection()
            case 2:
                return self?.createOriginSection()
            case 3:
                return self?.createEpisodeSection()
            default:
                return nil
            }
        }
        
    }
    
    private func createLayoutSection(group: NSCollectionLayoutGroup,
                                    behavior: UICollectionLayoutSectionOrthogonalScrollingBehavior,
                                    interGroupSpacing: CGFloat,
                                    supplementaryItems: [NSCollectionLayoutBoundarySupplementaryItem],
                                    contentInsets: Bool ) -> NSCollectionLayoutSection {
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = behavior
        section.interGroupSpacing = interGroupSpacing
        section.boundarySupplementaryItems = supplementaryItems
        section.supplementariesFollowContentInsets = contentInsets
        return section
    }
    
    private func createAvatarSection() -> NSCollectionLayoutSection {
        
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1),
                                                            heightDimension: .fractionalHeight(1)))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(0.9),
                                                                         heightDimension: .fractionalHeight(0.2)),
                                                       subitems: [item])
        
        let section = createLayoutSection(group: group,
                                          behavior: .groupPaging,
                                          interGroupSpacing: 5,
                                          supplementaryItems: [],
                                          contentInsets: false)
        section.contentInsets = .init(top: 0, leading: 10, bottom: 0, trailing: 0)
        return section
    }
    
    private func createInfoSection() -> NSCollectionLayoutSection {
        
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1),
                                                            heightDimension: .fractionalHeight(1)))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(0.9),
                                                                         heightDimension: .fractionalHeight(0.2)),
                                                       subitems: [item])
        
        let section = createLayoutSection(group: group,
                                          behavior: .groupPaging,
                                          interGroupSpacing: 5,
                                          supplementaryItems: [],
                                          contentInsets: false)
        section.contentInsets = .init(top: 120, leading: 20, bottom: 0, trailing: 24)
        return section
    }
    
    private func createOriginSection() -> NSCollectionLayoutSection {
        
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1),
                                                            heightDimension: .fractionalHeight(1)))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(0.9),
                                                                         heightDimension: .fractionalHeight(0.12)),
                                                       subitems: [item])
        
        let section = createLayoutSection(group: group,
                                          behavior: .groupPaging,
                                          interGroupSpacing: 5,
                                          supplementaryItems: [],
                                          contentInsets: false)
        section.contentInsets = .init(top: 64, leading: 20, bottom: 0, trailing: 24)
        return section
        
    }
    
    private func createEpisodeSection() -> NSCollectionLayoutSection {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.85))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(95))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])

        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 64, leading: 20, bottom: 30, trailing: 20)
        return section
        
    }
}

extension UICollectionView {
    func register<T: UICollectionViewCell>(_ type: T.Type) {
        register(T.self, forCellWithReuseIdentifier: T.identifier)
    }
}

extension UICollectionViewCell {
    static var identifier: String {
        String(describing: self)
    }
}


//MARK: - UICollectionViewDataSource

extension OverviewHeroController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0: return 1
        case 1: return 1
        case 2: return 1
        case 3: return self.hero.episode?.count ?? 0
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch Int(indexPath[0]) {
        case 0:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(AvatarCollectionViewCell.self)",
                                                                for: indexPath) as? AvatarCollectionViewCell
            else {
                return UICollectionViewCell()
            }
            cell.configureCell(imageName: self.heroAvatar[0], nameHero: self.heroAvatar[1], statusHero: self.heroAvatar[2])
            return cell
            
        case 1:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(InfoCollectionViewCell.self)",
                                                                for: indexPath) as? InfoCollectionViewCell
            else {
                return UICollectionViewCell()
            }
            cell.configureCell(species: self.hero.species?.rawValue ?? "", type: self.hero.type ?? "", gender: self.hero.gender?.rawValue ?? "")
            cell.backgroundColor = UIColor(named: "FrameColor")
            cell.layer.cornerRadius = 16
            return cell
            
        case 2:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(OriginCollectionViewCell.self)",
                                                                for: indexPath) as? OriginCollectionViewCell
            else {
                return UICollectionViewCell()
            }
            cell.configureCell(typePlanet: self.hero.origin?.name ?? "")
            cell.backgroundColor = UIColor(named: "FrameColor")
            cell.layer.cornerRadius = 16
            return cell
            
        case 3:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(EpisodCollectionViewCell.self)",
                                                                for: indexPath) as? EpisodCollectionViewCell
            else {
                return UICollectionViewCell()
            }
            cell.backgroundColor = UIColor(named: "FrameColor")
            cell.layer.cornerRadius = 16

            let urlEpisode = self.hero.episode?[indexPath.row] ?? ""
            
            let api = NetworkManager()
            
            api.getNameEpisode(urlEpisode: urlEpisode) { episodeName in
                DispatchQueue.main.async {
                    cell.episodeName.text = episodeName.name
                    cell.episodeItem.text = api.seasonSeries(name: episodeName.episode ?? "")
                    cell.dateEpisode.text = episodeName.air_date
                }
            } 
            
            return cell
        default:
            return UICollectionViewCell()
        }
    }
}
    
//MARK: - Set Constraints
    
extension OverviewHeroController {
        
    private func setupConstraints() {
            
            NSLayoutConstraint.activate([
                collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
            ])
            
        }
    }

