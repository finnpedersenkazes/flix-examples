/// An algebraic data type for shapes.
enum Shape {
    case Circle(Float),          // circle radius
    case Square(Float),          // side length
    case Rectangle(Float, Float) // height and width
    case Triangle(Float, Float)  // height and width
}

def pi(): Float = 
    3.141592653589793238

def one(): Int = 
    1

/// Computes the area of the given shape using 
/// pattern matching and basic arithmetic.
def area(s: Shape): Float = match s {
    case Circle(r)       => pi() * (r * r)
    case Square(w)       => area(Rectangle(w, w))
    case Rectangle(h, w) => h * w
    case Triangle(h, w)  => area(Rectangle(h, w)) / 2.0
}

// Computes the area of a circle with radius 4.
def main(_args: Array[String]): Int & Impure = 
    let circleArea = area(Circle(4.0));
    println("Circle Area = ${circleArea}");
    one()
