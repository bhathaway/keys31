#include "TouchPolygon.h"


namespace TouchPolygon {

const Vector operator-(const Point & b, const Point & a)
{
    return Vector(b.x()-a.x(), b.y()-a.y());
}

const Point operator+(const Point & b, const Vector & v)
{
    return Point(b.x() + v.x(), b.y() + v.y());
}

}
