#if !defined __BAH_TOUCHPOLYGON_H__
#define __BAH_TOUCHPOLYGON_H__

#include <vector>
#include <cassert>

namespace TouchPolygon {

class Point
{
public:
    Point() : _x(0), _y(0) { }
    Point(double x, double y) : _x(x), _y(y) { }
    Point(const Point & rhs) : _x(rhs._x), _y(rhs._y) { }

    void operator=(const Point & rhs)
    {
        _x = rhs._x;
        _y = rhs._y;
    }

    double x() const { return _x; }
    double y() const { return _y; }

private:
    double _x, _y;
};


class Vector
{
public:
    Vector() : _x(0), _y(0) { }
    Vector(double x, double y) : _x(x), _y(y) { }
    Vector(const Vector & rhs) : _x(rhs._x), _y(rhs._y) { }
    void operator=(const Vector & rhs)
    {
        _x = rhs._x;
        _y = rhs._y;
    }

    double x() const { return _x; }
    double y() const { return _y; }

    double dot(const Vector & b) const
    {
        return x()*b.x() + y()*b.y();
    }

private:
    double _x, _y;
};

const Vector operator-(const Point & b, const Point & a);
const Point operator+(const Point & b, const Vector & v);

class RightHalfSpace
{
public:
    RightHalfSpace() : _p(0, 0), _v(0, 0) { }
    RightHalfSpace(const Point & p, const Vector & v) : _p(p), _v(v.y(), -v.x()) { }
    RightHalfSpace(const RightHalfSpace & rhs) : _p(rhs._p), _v(rhs._v) { }
    void operator=(const RightHalfSpace & rhs)
    {
        _p = rhs._p;
        _v = rhs._v;
    }

    bool contains(const Point & p) const
    {
        const Vector q(p - _p);

        return _v.dot(q) > 0.0;
    }

private:
    Point _p;
    Vector _v;
};


class Polygon
{
public:
    Polygon(std::vector<Point> & points)
    {
        assert(points.size() >= 3);
        _half_spaces.reserve(points.size());
        for (std::vector<Point>::const_iterator p1 = points.begin(); p1 != points.end(); ++p1) {
            std::vector<Point>::const_iterator p2 = p1 + 1;
            if (p2 == points.end()) {
                p2 = points.begin();
            }

            _half_spaces.push_back(RightHalfSpace(*p2, *p2 - *p1));
            if (_half_spaces.size() > 1) {
                assert(_half_spaces[_half_spaces.size() - 2].contains(*p2));
            }
        }

        assert(_half_spaces[_half_spaces.size() - 1].contains(*(points.begin() + 1)));
    }

    bool contains(const Point & p) const
    {
        for (std::vector<RightHalfSpace>::const_iterator space = _half_spaces.begin();
        space != _half_spaces.end(); ++space) {
            if (! space->contains(p)) {
                return false;
            }
        }

        return true;
    }

private:
    std::vector<RightHalfSpace> _half_spaces;
};

}

#endif
