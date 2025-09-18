import UIKit

// step 1
var firstName = "Dimash"
var lastName = "Amalbek"
var age = 20
var birthYear = 2005
var isStudent = true
var height = 1.77
var currentYear = 2025
var country = "Kazakhstan"
age = currentYear - birthYear


// step 2
var hobby = "play football"
var numberOfHobbies = 4
var favoriteNumber = 5
var isHobbyCreative = false

// bonus

var futureGoals = "I want to buy my first car"
var carEmoji = "🏎️"

// step 3

var studentStatus: String = isStudent ? "I am currently a student." : "I am not a student."
var hobbyDescription: String = isHobbyCreative ? "I enjoy \(hobby), which is a creative hobby." : "I enjoy \(hobby), which is not a creative hobby."

var myLifeStory: String = """
  My name is \(firstName) \(lastName).
I am \(age) years old, born in \(birthYear), and I live in \(country).
\(studentStatus)
My height is \(height) meters.
\(hobbyDescription)
In total, I have \(numberOfHobbies) hobbies, and my favorite number is \(favoriteNumber).
\(futureGoals) \(carEmoji)
"""

// step 4

print(myLifeStory)
