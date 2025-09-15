/*:
## App Exercise - Swimming Workouts

 >These exercises reinforce Swift concepts in the context of a fitness tracking app.

 Previous app exercises have introduced the idea that your fitness tracking app may allow users to track swimming workouts. Create a `SwimmingWorkout` struct below with properties for `distance`, `time`, and `stroke`. `distance` and `time` should be of type `Double` and will represent distance in meters and time in seconds, and `stroke` should be of type `String`.
 */
struct swimmingWorkout{
    var distance: Double
    var time: Double
    var stroke: Stroke
    
    enum Stroke{
        case freestyle, butterfly, backstroke, breaststroke
    }
    
    static var freestyleWorkout: [swimmingWorkout] = []
    static var butterflyWorkout: [swimmingWorkout] = []
    static var backstrokeWorkout: [swimmingWorkout] = []
    static var breaststrokeWorkout: [swimmingWorkout] = []

    func save(){
        switch stroke{
            
        case .freestyle: swimmingWorkout.freestyleWorkout.append(self)
        case .butterfly: swimmingWorkout.butterflyWorkout.append(self)
        case .backstroke: swimmingWorkout.backstrokeWorkout.append(self)
        case .breaststroke: swimmingWorkout.breaststrokeWorkout.append(self)

        }
    }
}

//:  Allowing `stroke` to be of type `String` isn't very type-safe. Inside the `SwimmingWorkout` struct, create an enum called `Stroke` that has cases for `freestyle`, `butterfly`, `backstroke`, and `breaststroke`. Change the type of `stroke` from `String` to `Stroke`. Create two instances of `SwimmingWorkout` objects.

var swim1 = swimmingWorkout(distance: 120, time: 20, stroke: .backstroke)

var swim2 = swimmingWorkout(distance: 10, time: 10, stroke: .breaststroke)
//:  Now imagine you want to log swimming workouts separately based on the swimming stroke. You might use arrays as static variables on `SwimmingWorkout` for this. Add four static variables, `freestyleWorkouts`, `butterflyWorkouts`, `backstrokeWorkouts`, and `breaststrokeWorkouts`, to `SwimmingWorkout` above. Each should be of type `[SwimmingWorkout]` and should default to empty arrays.

//:  Now imagine you want to log swimming workouts separately based on the swimming stroke. You might use arrays as static variables on `SwimmingWorkout` for this. Add four static variables, `freestyleWorkouts`, `butterflyWorkouts`, `backstrokeWorkouts`, and `breaststrokeWorkouts`, to `SwimmingWorkout` above. Each should be of type `[SwimmingWorkout]` and should default to empty arrays.
 

//:  Now add an instance method to `SwimmingWorkout` called `save` that takes no parameters and has no return value. This method will add its instance to the static array on `SwimmingWorkout` that corresponds to its swimming stroke. Inside `save` write a switch statement that switches on the instance's `stroke` property, and appends `self` to the proper array. Call save on the two instances of `SwimmingWorkout` that you created above, and then print the array(s) to which they should have been added to see if your `save()` method works properly.
//let workout1 = swimmingWorkout(distance: 500, time: 300, stroke: .freestyle)
//let workout2 = swimmingWorkout(distance: 200, time: 120, stroke: .butterfly)

swim1.save()
swim2.save()

print("backstroke: \(swimmingWorkout.backstrokeWorkout)")
print("breaststroke: \(swimmingWorkout.breaststrokeWorkout)")


/*:
 _Copyright © 2023 Apple Inc._

 _Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:_

 _The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software._

 _THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE._
 
[Previous](@previous)  |  page 2 of 2
 */
