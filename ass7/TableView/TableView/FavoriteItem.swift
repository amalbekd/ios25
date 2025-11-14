//
//  FavoriteItem.swift
//  TableView
//
//  Created by Dimash Amalbek on 15.11.2025.
//

import UIKit

// MARK: - Модель данных для избранных элементов
struct FavoriteItem {
    let title: String
    let subtitle: String
    let review: String
    let imageName: String
    
    init(title: String, subtitle: String, review: String, imageName: String) {
        self.title = title
        self.subtitle = subtitle
        self.review = review
        self.imageName = imageName
    }
}

// MARK: - Категории разделов
enum FavoriteCategory: Int, CaseIterable {
    case movies = 0
    case music = 1
    case books = 2
    case courses = 3
    
    var title: String {
        switch self {
        case .movies: return "🎬 Favorite Movies"
        case .music: return "🎵 Favorite Music"
        case .books: return "📚 Favorite Books"
        case .courses: return "🎓 University Courses"
        }
    }
}

// MARK: - Данные для таблицы
struct FavoritesData {
    static let movies: [FavoriteItem] = [
        FavoriteItem(
            title: "Побег из Шоушенка",
            subtitle: "Фрэнк Дарабонт • 1994",
            review: "Бухгалтер Энди Дюфрейн обвинён в убийстве собственной жены и её любовника. Оказавшись в тюрьме под названием Шоушенк, он сталкивается с жестокостью и беззаконием, царящими по обе стороны решётки. Каждый, кто попадает в эти стены, становится их рабом до конца жизни. Но Энди, обладающий живым умом и доброй душой, находит подход как к заключённым, так и к охранникам, добиваясь их особого к себе расположения.",
            imageName: "film1"
        ),
        FavoriteItem(
            title: "Интерстеллар",
            subtitle: "Кристофер Нолан • 2010",
            review: "Когда засуха, пыльные бури и вымирание растений приводят человечество к продовольственному кризису, коллектив исследователей и учёных отправляется сквозь червоточину (которая предположительно соединяет области пространства-времени через большое расстояние) в путешествие, чтобы превзойти прежние ограничения для космических путешествий человека и найти планету с подходящими для человечества условиями.",
            imageName: "film2"
        ),
        FavoriteItem(
            title: "Список Шиндлера",
            subtitle: "Стивен Спилберг • 1993",
            review: "Фильм рассказывает реальную историю загадочного Оскара Шиндлера, члена нацистской партии, преуспевающего фабриканта, спасшего во время Второй мировой войны почти 1200 евреев.",
            imageName: "film3"
        ),
        FavoriteItem(
            title: "Зеленая книга",
            subtitle: "Питер Фаррелли • 2018",
            review: "1960-е годы. После закрытия нью-йоркского ночного клуба на ремонт вышибала Тони по прозвищу Болтун ищет подработку на пару месяцев. Как раз в это время Дон Ширли — утонченный светский лев, богатый и талантливый чернокожий музыкант, исполняющий классическую музыку — собирается в турне по южным штатам, где ещё сильны расистские убеждения и царит сегрегация. Он нанимает Тони в качестве водителя, телохранителя и человека, способного решать текущие проблемы. У этих двоих так мало общего, и эта поездка навсегда изменит жизнь обоих.",
            imageName: "film4"
        ),
        FavoriteItem(
            title: "1+1",
            subtitle: "Оливье Накаш, Эрик Толедано • 2011",
            review: "Пострадав в результате несчастного случая, богатый аристократ Филипп нанимает в помощники человека, который менее всего подходит для этой работы, – молодого жителя предместья Дрисса, только что освободившегося из тюрьмы. Несмотря на то, что Филипп прикован к инвалидному креслу, Дриссу удается привнести в размеренную жизнь аристократа дух приключений.",
            imageName: "film5"
        )
    ]
    
    static let music: [FavoriteItem] = [
        FavoriteItem(
            title: "Dark Side of the Moon",
            subtitle: "Pink Floyd • 1973",
            review: "A concept album that changed music forever. The seamless transitions between tracks create a cohesive journey. 'Time' and 'Money' are absolutely iconic.",
            imageName: "music.note"
        ),
        FavoriteItem(
            title: "Thriller",
            subtitle: "Michael Jackson • 1982",
            review: "The best-selling album of all time for good reason. Every track is a hit. MJ's vocal range and production quality set new standards for pop music.",
            imageName: "music.note.list"
        ),
        FavoriteItem(
            title: "Bohemian Rhapsody",
            subtitle: "Queen • 1975",
            review: "A six-minute opera rock masterpiece that breaks all rules. Freddie Mercury's vocals are otherworldly. This song proves that popular music can be experimental and complex.",
            imageName: "music.note"
        ),
        FavoriteItem(
            title: "Abbey Road",
            subtitle: "The Beatles • 1969",
            review: "The Beatles' swan song is perfection. The medley on side two flows beautifully. 'Come Together' and 'Here Comes the Sun' are timeless classics.",
            imageName: "music.note.list"
        ),
        FavoriteItem(
            title: "Random Access Memories",
            subtitle: "Daft Punk • 2013",
            review: "A stunning return to form with live instrumentation. 'Get Lucky' dominated the summer, but the entire album is a tribute to disco and funk with modern production.",
            imageName: "music.note"
        )
    ]
    
    static let books: [FavoriteItem] = [
        FavoriteItem(
            title: "1984",
            subtitle: "George Orwell • 1949",
            review: "A chilling dystopia that feels increasingly relevant. Orwell's warnings about surveillance, propaganda, and totalitarianism are prophetic. Big Brother is always watching.",
            imageName: "book"
        ),
        FavoriteItem(
            title: "To Kill a Mockingbird",
            subtitle: "Harper Lee • 1960",
            review: "A powerful exploration of racism and morality through Scout's innocent eyes. Atticus Finch is the embodiment of integrity. The courtroom scenes are unforgettable.",
            imageName: "book.fill"
        ),
        FavoriteItem(
            title: "The Lord of the Rings",
            subtitle: "J.R.R. Tolkien • 1954",
            review: "The foundation of modern fantasy. Tolkien's world-building is unparalleled. The journey of Frodo and Sam teaches us about friendship, courage, and sacrifice.",
            imageName: "book"
        ),
        FavoriteItem(
            title: "Pride and Prejudice",
            subtitle: "Jane Austen • 1813",
            review: "Elizabeth Bennet is one of literature's greatest heroines. Austen's wit and social commentary remain sharp centuries later. The romance with Mr. Darcy is perfectly paced.",
            imageName: "book.fill"
        ),
        FavoriteItem(
            title: "The Catcher in the Rye",
            subtitle: "J.D. Salinger • 1951",
            review: "Holden Caulfield's voice is authentic and raw. This novel captures teenage angst and alienation perfectly. It's controversial, honest, and deeply moving.",
            imageName: "book"
        )
    ]
    
    static let courses: [FavoriteItem] = [
        FavoriteItem(
            title: "Data Structures & Algorithms",
            subtitle: "Computer Science • CS201",
            review: "This course transformed how I think about problem-solving. Learning about time complexity, sorting algorithms, and graph theory opened new mental pathways. Challenging but incredibly rewarding.",
            imageName: "terminal"
        ),
        FavoriteItem(
            title: "Mobile Application Development",
            subtitle: "Software Engineering • SE305",
            review: "Learning iOS and Android development was game-changing. Building real apps and seeing them run on devices is magical. The professor's industry experience made lessons practical and engaging.",
            imageName: "iphone"
        ),
        FavoriteItem(
            title: "Database Systems",
            subtitle: "Information Systems • IS310",
            review: "Understanding how databases work behind the scenes is essential. SQL became second nature, and learning about normalization, indexing, and transactions made me appreciate data management.",
            imageName: "cylinder.split.1x2"
        ),
        FavoriteItem(
            title: "Introduction to Machine Learning",
            subtitle: "Artificial Intelligence • AI401",
            review: "The most exciting field in tech right now. Training neural networks and seeing them learn is fascinating. The practical projects with real datasets made abstract concepts tangible.",
            imageName: "brain"
        ),
        FavoriteItem(
            title: "Web Technologies",
            subtitle: "Internet Programming • IT220",
            review: "From HTML basics to React frameworks, this course covered the full stack. Building responsive websites and learning about APIs, authentication, and deployment was incredibly practical.",
            imageName: "globe"
        )
    ]
    
    // Метод для получения данных по категории
    static func items(for category: FavoriteCategory) -> [FavoriteItem] {
        switch category {
        case .movies: return movies
        case .music: return music
        case .books: return books
        case .courses: return courses
        }
    }
}
