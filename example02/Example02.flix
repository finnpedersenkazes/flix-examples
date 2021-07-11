/// An algebraic data type for shapes.
enum Shape {
    case Circle(Int),        // circle radius
    case Square(Int),        // side length
    case Rectangle(Int, Int) // height and width
    case Triangle(Int, Int)  // height and width
}

/// Computes the area of the given shape using 
/// pattern matching and basic arithmetic.
def area(s: Shape): Int = match s {
    case Circle(r)       => 3 * (r * r)
    case Square(w)       => area(Rectangle(w, w))
    case Rectangle(h, w) => h * w
    case Triangle(h, w)  => area(Rectangle(h, w)) / 2
}

// Computes the area of a 2 by 4 triangle.
def main(_args: Array[String]): Int & Impure = 
    let triangleArea = area(Triangle(2, 4));
    println("Triangle Area = ${triangleArea}");
    triangleArea
