/*:
## Exercise - Constant or Variable?
 
 Imagine you're creating a simple photo sharing app. You want to keep track of the following metrics for each post:
- Number of likes: the number of likes that a photo has received
- Number of comments: the number of comments other users have left on the photo
- Year created: The year the post was created
- Month created: The month the post was created represented by a number between 1 and 12
- Day created: The day of the month the post was created
 
 For each of the metrics above, declare either a constant or a variable and assign it a value corresponding to a hypothetical post. Be sure to use proper naming conventions.
 */

var likes: Int = 50
print("likes can be changed over time")

var comments: Int = 5
print("comments can be changed over time")

let yearCreated: Int = 2020
print("year created cannot be changed over time")

let monthCreated: Int = 10
print("monthCreated canot be changed over time")

let dayCreated: Int = 10
print("dayCreated cannot be changed over time")

/*:
[Previous](@previous)  |  page 5 of 10  |  [Next: App Exercise - Fitness Tracker: Constant or Variable?](@next)
 */
