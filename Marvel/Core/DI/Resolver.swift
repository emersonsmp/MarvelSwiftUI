//
//  Resolver.swift
//  Marvel
//
//  Created by Emerson Sampaio on 12/02/24.
//

import Foundation
import Swinject
import CoreData

class Resolver {
    
    static let shared = Resolver()
    
    private var container = Container()
    
    @MainActor func injectModules() {
        injectUtils()
        injectDataSources()
        injectRepositories()
        injectUseCases()
        injectViewModels()
    }
    
    func resolve<T>(_ type: T.Type) -> T {
        container.resolve(T.self)!
    }
}

// MARK: - Injecting Utils -

extension Resolver {
    private func injectUtils() {
        container.register(NetworkManager.self) { _ in
            DefaultNetworkManager()
        }.inObjectScope(.container)
        container.register(RequestManager.self) { resolver in
            DefaultRequestManager(networkManager: resolver.resolve(NetworkManager.self)!)
        }.inObjectScope(.container)
        container.register(CoreDataStack.self) { _ in
            CoreDataStack()
        }.inObjectScope(.container)
    }
}

// MARK: - Injecting DataSources -

extension Resolver {
    private func injectDataSources() {
        container.register(CharactersDataSource.self) { resolver in
            DefaultCharactersDataSource(requestManager: resolver.resolve(RequestManager.self)!)
        }.inObjectScope(.container)
        container.register(ComicsDataSource.self) { resolver in
            DefaultComicsDataSource(requestManager: resolver.resolve(RequestManager.self)!)
        }.inObjectScope(.container)
        container.register(FavoritesDataSource.self) { resolver in
            DefaultFavoritesDataSource(dataStack: resolver.resolve(CoreDataStack.self)!)
        }.inObjectScope(.container)
    }
}

// MARK: - Injecting Repositories -

extension Resolver {
    
    private func injectRepositories() {
        container.register(CharactersRepository.self) { resolver in
            DefaultCharactersRepository(charactersDataSource: resolver.resolve(CharactersDataSource.self)!)
        }.inObjectScope(.container)
        container.register(ComicsRepository.self) { resolver in
            DefaultComicsRepository(comicsDataSource: resolver.resolve(ComicsDataSource.self)!)
        }.inObjectScope(.container)
        container.register(FavoritesRepository.self) { resolver in
            DefaultFavoritesRepository(dataSource: resolver.resolve(FavoritesDataSource.self)!)
        }.inObjectScope(.container)
    }
}

// MARK: - Injecting Use Cases -

extension Resolver {
    
    private func injectUseCases() {
        container.register(GetCharactersUC.self) { resolver in
            DefaultGetCharactersUC(repository: resolver.resolve(CharactersRepository.self)!)
        }.inObjectScope(.container)
        container.register(GetComicsUC.self) { resolver in
            DefaultGetComicsUC(repository: resolver.resolve(ComicsRepository.self)!)
        }.inObjectScope(.container)
        
        // MARK: - Favorites UC -
        
        container.register(CheckFavoriteUC.self) { resolver in
            DefaultCheckFavoriteUC(favoritesRepository: resolver.resolve(FavoritesRepository.self)!)
        }.inObjectScope(.container)
        container.register(ToggleFavoriteUC.self) { resolver in
            DefaultToggleFavoriteUC(favoritesRepository: resolver.resolve(FavoritesRepository.self)!)
        }.inObjectScope(.container)
    }
}

// MARK: - Injecting ViewModels -

extension Resolver {
    
    @MainActor
    private func injectViewModels() {
        container.register(HomeViewModel.self) { resolver in
            HomeViewModel(getCharactersUseCase: resolver.resolve(GetCharactersUC.self)!)
        }

        container.register(CharacterProfileViewModel.self) { resolver in
            CharacterProfileViewModel(
                getComicsUC: resolver.resolve(GetComicsUC.self)!,
                checkFavoriteUC: resolver.resolve(CheckFavoriteUC.self)!,
                toggleFavoriteUC: resolver.resolve(ToggleFavoriteUC.self)!
            )
        }
    }
}
