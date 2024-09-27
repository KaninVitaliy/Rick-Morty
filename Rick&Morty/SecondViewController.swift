import UIKit

class SecondViewController: UIViewController {

    // Создадим коллекцию
    var collectionView: UICollectionView!
    private var nameHero: [(String,String)] = []
    
    override func viewDidLoad() {
        // Подключаем настройки коллекции
        setupCollectionView()
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "Scene")
        charactersView()
        
        // Получаем данные по API с основного потока
        NetworkManager.shared.getHero { [weak self] values in
            DispatchQueue.main.async {
                guard let self else { return }
                self.nameHero = values
                self.collectionView.reloadData()
            }
        }
    }
    

    // Настройка коллекций, переопределяем коллекцию созданную выше
    private func setupCollectionView() {
        // Инициализируем ее , устанавливаем нулевой размер , позже настроим верно
        collectionView = UICollectionView(frame: .zero , collectionViewLayout: setupFlowLayout())
        collectionView.backgroundColor = UIColor(named: "Scene")
        // Подключаем ее в главный проект
        view.addSubview(collectionView)
        // Устанавливаем настройку нажатия
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        // Устанавливаем границы коллекции
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
        collectionView.dataSource = self
        
        // Регистрация ячейки
        collectionView.register(HeroCell.self, forCellWithReuseIdentifier: "\(HeroCell.self)")
        
        // Указываем Возможность нажатия и делаем переход на OverviewHeroController
        collectionView.isUserInteractionEnabled = true
        // Нам нужно чтобы при нажатии на эту картинку мы переходили на другой экран (OverwiewHeroController)
        // Добавляем эту возможность
        // Создаем константу и определяем метод для жеста
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        collectionView.addGestureRecognizer(tap)
    }
    
    // Свойство коллекции, здесь можно исправить отображение ячеек
    private func setupFlowLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        
        layout.itemSize = .init(width: 156, height: 202)
        layout.minimumLineSpacing = 16
        layout.minimumInteritemSpacing = 16
        layout.scrollDirection = .vertical
        layout.sectionInset = .init(top: 0, left: 20, bottom: 30, right: 27)
        
        return layout
    }
    
    private func charactersView() {
        let characters = UIImageView()
        characters.image = UIImage(named: "Characters")
        characters.translatesAutoresizingMaskIntoConstraints = false
        characters.contentMode = .scaleToFill
        
        view.addSubview(characters)
        
        NSLayoutConstraint.activate([
            characters.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5),
            characters.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -730),
            characters.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24),
            characters.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -202),
        ])
    }
    
    // Реализуем переход на третий экран
    @objc
    private func handleTap() {
        let OHC = OverviewHeroController()
        // Указываем как именно он будут появляться , здесь на полный экран
        OHC.modalPresentationStyle = .fullScreen
        // Указываем анимацию для него
        present(OHC, animated: true)
    }
}

extension SecondViewController: UICollectionViewDataSource {
    // Сколько значений будет
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        nameHero.count
    }
    
    // Метод чтобы работать со значениями
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // Ячейка
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(HeroCell.self)", for: indexPath) as? HeroCell else {
            return UICollectionViewCell()
        }
        setImageFromStringrURL(stringUrl: nameHero[indexPath.row].1)
        cell.backgroundColor =  UIColor(named: "FrameColor")
        cell.layer.cornerRadius = 16
        
        // Функция для картнок
        func setImageFromStringrURL(stringUrl: String) {
            if let url = URL(string: stringUrl) {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
              
             // Error handling...
              guard let imageData = data else { return }

              DispatchQueue.main.async {
                  cell.imageView.image = UIImage(data: imageData)
              }
            }.resume()
          }
        }
        
        // Делаем текст в ячейке , указываем имена из коллекции
        let label = UILabel(frame: CGRect(x: 0, y: cell.contentView.frame.height - 40, width: cell.contentView.frame.width, height: 30))
        
        // Добавление текста
        label.text = self.nameHero[indexPath.item].0
        label.textAlignment = .center
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 17)
        
        // Добавляем имена коллекции в ячейку
        cell.contentView.addSubview(label)
        
        return cell
    }
}
