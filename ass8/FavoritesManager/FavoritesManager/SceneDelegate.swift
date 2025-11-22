//
//  SceneDelegate.swift
//  FavoritesManager
//
//  Created by Dimash Amalbek on 21.11.2025.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        // Create window
        let window = UIWindow(windowScene: windowScene)
        
        // Create tab bar controller
        let tabBarController = UITabBarController()
        
        // Configure tab bar appearance
        tabBarController.tabBar.tintColor = .systemBlue
        tabBarController.tabBar.backgroundColor = .systemBackground
        
        // Create view controllers for each tab
        let moviesVC = createNavigationController(
            rootViewController: MoviesViewController(),
            title: "Movies",
            image: UIImage(systemName: "film")!,
            selectedImage: UIImage(systemName: "film.fill")!
        )
        
        let musicVC = createNavigationController(
            rootViewController: MusicViewController(),
            title: "Music",
            image: UIImage(systemName: "music.note")!,
            selectedImage: UIImage(systemName: "music.note")!
        )
        
        let booksVC = createNavigationController(
            rootViewController: BooksViewController(),
            title: "Books",
            image: UIImage(systemName: "book")!,
            selectedImage: UIImage(systemName: "book.fill")!
        )
        
        let coursesVC = createNavigationController(
            rootViewController: CoursesViewController(),
            title: "Courses",
            image: UIImage(systemName: "graduationcap")!,
            selectedImage: UIImage(systemName: "graduationcap.fill")!
        )
        
        // Set view controllers
        tabBarController.viewControllers = [moviesVC, musicVC, booksVC, coursesVC]
        
        // Set window root view controller
        window.rootViewController = tabBarController
        self.window = window
        window.makeKeyAndVisible()
    }
    
    private func createNavigationController(
        rootViewController: UIViewController,
        title: String,
        image: UIImage,
        selectedImage: UIImage
    ) -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: rootViewController)
        
        // Configure tab bar item
        navigationController.tabBarItem.title = title
        navigationController.tabBarItem.image = image
        navigationController.tabBarItem.selectedImage = selectedImage
        
        // Configure navigation bar
        navigationController.navigationBar.prefersLargeTitles = true
        navigationController.navigationBar.tintColor = .systemBlue
        
        return navigationController
    }

    func sceneDidDisconnect(_ scene: UIScene) { }
    func sceneDidBecomeActive(_ scene: UIScene) { }
    func sceneWillResignActive(_ scene: UIScene) { }
    func sceneWillEnterForeground(_ scene: UIScene) { }
    func sceneDidEnterBackground(_ scene: UIScene) { }
}
