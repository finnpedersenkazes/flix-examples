/// Type alias for Float and Int
type alias Decimal = Float
type alias Integer = Int

/// An algebraic data type for shapes.
enum Shape {
    case Circle(Decimal),          // circle radius
    case Square(Decimal),          // side length
    case Rectangle(Decimal, Decimal) // height and width
    case Triangle(Decimal, Decimal)  // height and width
}

def pi(): Decimal = 
    3.141592653589793238

def one(): Integer = 
    1

/// Computes the area of the given shape using 
/// pattern matching and basic arithmetic.
def area(s: Shape): Decimal = match s {
    case Circle(r)       => pi() * (r * r)
    case Square(w)       => area(Rectangle(w, w))
    case Rectangle(h, w) => h * w
    case Triangle(h, w)  => area(Rectangle(h, w)) / 2.0
}

// Computes the area of a circle with radius 4.
def main(_args: Array[String]): Integer & Impure = 
    let circleArea = area(Circle(4.0));
    println("Circle Area = ${circleArea}");
    one()
