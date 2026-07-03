//
//  UIImageViewExtension.swift
//  Assessment-3
//
//  Created by ANJALI SHARMA R on 03/07/26.
//

import UIKit
import Foundation

extension UIImageView {
    
    func loadImage(from url: String) {
        
        image = UIImage(systemName: "photo.artframe")
        
        guard let url = getRandomMoviePosterURL() else {
            print("Invalid URL:", url)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                print("Image Error:", error)
                return
            }
            
            guard let data = data, let image = UIImage(data: data)
            else {
                return
            }
            
            DispatchQueue.main.async {
                if response?.url == url {
                    self.image = UIImage(data: data)
                } else {
                    self.image = image
                }
            }
        }.resume()
    }

    private func getRandomMoviePosterURL() -> URL? {
            let movieImageStrings: [String] = [
                "https://image.tmdb.org/t/p/w500/1NqwE6LP9IEdOZ57NCT51ftHtWT.jpg", // The Super Mario Bros. Movie
                "https://image.tmdb.org/t/p/w500/t6HIqrRAclMCA60NsSmeqe9RmNV.jpg", // Avatar: The Way of Water
                "https://image.tmdb.org/t/p/w500/xBl5AGw7HXZcv1nNXPlzGgO4Cfo.jpg", // The Black Demon
                "https://image.tmdb.org/t/p/w500/9z4jRr43JdtU66P0iy8h18OyLql.jpg", // The Little Mermaid
                "https://image.tmdb.org/t/p/w500/pFlaoHTZeyNkG83vxsAJiGzfSsa.jpg", // Fast X
                "https://image.tmdb.org/t/p/w500/jRXYjXNq0Cs2TcJjLkki24MLp7u.jpg",
            "https://upload.wikimedia.org/wikipedia/commons/0/05/Metropolisposter.jpg", // Metropolis (1927)
                "https://upload.wikimedia.org/wikipedia/commons/c/c0/CasablancaPoster-cropped.jpg", // Casablanca (1942)
                "https://upload.wikimedia.org/wikipedia/commons/7/7b/Citizen_Kane_poster%2C_1941.jpg", // Citizen Kane (1941)
                "https://upload.wikimedia.org/wikipedia/commons/a/ae/Night_of_the_Living_Dead_poster.jpg", // Night of the Living Dead (1968)
                "https://upload.wikimedia.org/wikipedia/commons/a/a3/The_Gold_Rush_poster.jpg", // The Gold Rush (1925)
                "https://upload.wikimedia.org/wikipedia/commons/6/6d/Nosferatu_1922_cinematographic_poster.jpg", // Nosferatu (1922)
                "https://upload.wikimedia.org/wikipedia/commons/2/23/The_Cabinet_of_Dr._Caligari_%281920%29_poster.jpg", // Cabinet of Dr. Caligari (1920)
                "https://upload.wikimedia.org/wikipedia/commons/8/85/Phantom_of_the_opera_1925_poster.jpg", // Phantom of the Opera (1925)
                "https://upload.wikimedia.org/wikipedia/commons/d/de/Charade_1963_poster.jpg", // Charade (1963)
                "https://upload.wikimedia.org/wikipedia/commons/0/0e/His_Girl_Friday_poster.jpg", // His Girl Friday (1940)
                "https://upload.wikimedia.org/wikipedia/commons/7/75/Gulliver%27s_Travels_%281939%29_poster.jpg", // Gulliver's Travels (1939)
                "https://upload.wikimedia.org/wikipedia/commons/d/db/Plan_9_From_Outer_Space_poster.jpg", // Plan 9 From Outer Space (1957)
                "https://upload.wikimedia.org/wikipedia/commons/4/46/The_General_poster.jpg", // The General (1926)
                "https://upload.wikimedia.org/wikipedia/commons/4/4c/The_39_Steps_poster.jpg", // The 39 Steps (1935)
                "https://upload.wikimedia.org/wikipedia/commons/e/e0/M_Fritz_Lang_poster.jpg", // M (1931)
                "https://images.unsplash.com/photo-1536440136628-849c177e76a1?w=500&q=80", // Cinema Placeholder 1
                "https://images.unsplash.com/photo-1489599849927-2ee91cede3ba?w=500&q=80", // Cinema Placeholder 2
                "https://images.unsplash.com/photo-1517604931442-7e0c8ed2963c?w=500&q=80", // Cinema Placeholder 3
                "https://images.unsplash.com/photo-1440404653325-ab127d49abc1?w=500&q=80", // Cinema Placeholder 4
                "https://images.unsplash.com/photo-1542204172-e7052809a86e?w=500&q=80", // Cinema Placeholder 5
                "https://images.unsplash.com/photo-1478720568477-152d9b164e26?w=500&q=80", // Cinema Placeholder 6
                "https://images.unsplash.com/photo-1513151233558-d860c5398176?w=500&q=80", // Cinema Placeholder 7
                "https://images.unsplash.com/photo-1496345875659-11f7dd282d1d?w=500&q=80", // Cinema Placeholder 8
                "https://images.unsplash.com/photo-1574267431647-c82c20311863?w=500&q=80", // Cinema Placeholder 9
                "https://images.unsplash.com/photo-1524712245354-2c4e5e7121c0?w=500&q=80", // Cinema Placeholder 10
                "https://images.unsplash.com/photo-1492691527719-9d1e07e534b4?w=500&q=80", // Cinema Placeholder 11
                "https://images.unsplash.com/photo-1594909122845-11baa439b7bf?w=500&q=80", // Cinema Placeholder 12
                "https://images.unsplash.com/photo-1585647347483-22b66260dfff?w=500&q=80", // Cinema Placeholder 13
                "https://images.unsplash.com/photo-1616530940355-351fabd9524b?w=500&q=80", // Cinema Placeholder 14
                "https://images.unsplash.com/photo-1626814026160-2237a95fc5a0?w=500&q=80"  // Cinema Placeholder 15
        ]
            // Selects a random string and converts it to a URL object
            guard let randomString = movieImageStrings.randomElement() else { return nil }
            return URL(string: randomString)
        }
    
}
