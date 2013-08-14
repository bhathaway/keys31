#include "TouchPolygon.h"
#include <iostream>

using namespace TouchPolygon;
using namespace std;

void printContains(const Polygon & poly, const Point & p)
{
    if (poly.contains(p)) {
        cout << "Polygon contains " << "(" << p.x() << ", " << p.y() << ")" << endl;
    } else {
        cout << "Polygon excludes " << "(" << p.x() << ", " << p.y() << ")" << endl;
    }
}

int main()
{
    // <polygon id="c0_0" class="Natural" points="28.843750,138.347558 53.250000,152.438513 53.250000,247.232211 28.843750,261.323166 4.437500,247.232211 4.437500,152.438513" />
    Point p1(28.843750,138.347558);
    Point p2(53.250000,152.438513);
    Point p3(53.250000,247.232211);
    Point p4(28.843750,261.323166);
    Point p5(4.437500,247.232211);
    Point p6(4.437500,152.438513);

    vector<Point> v;
    v.reserve(6);

    // Put in reverse order since screen axes are reverse of standard.
    v.push_back(p6);
    v.push_back(p5);
    v.push_back(p4);
    v.push_back(p3);
    v.push_back(p2);
    v.push_back(p1);

    Polygon hex_key(v);

    printContains(hex_key, p1);
    printContains(hex_key, p2);
    printContains(hex_key, p3);
    printContains(hex_key, p4);
    printContains(hex_key, p5);
    printContains(hex_key, p6);

    // Let's make '+' around the vertices
    Vector v_up(0.0, -1.0);
    Vector v_right(1.0, 0.0);
    Vector v_down(0.0, 1.0);
    Vector v_left(-1.0, 0.0);

    cout << "Testing the '+' configuration about the vertices..\n";
    cout << "p1\n";
    printContains(hex_key, p1+v_up);
    printContains(hex_key, p1+v_right);
    printContains(hex_key, p1+v_down);
    printContains(hex_key, p1+v_left);

    cout << "p2\n";
    printContains(hex_key, p2+v_up);
    printContains(hex_key, p2+v_right);
    printContains(hex_key, p2+v_down);
    printContains(hex_key, p2+v_left);

    cout << "p3\n";
    printContains(hex_key, p3+v_up);
    printContains(hex_key, p3+v_right);
    printContains(hex_key, p3+v_down);
    printContains(hex_key, p3+v_left);

    cout << "p4\n";
    printContains(hex_key, p4+v_up);
    printContains(hex_key, p4+v_right);
    printContains(hex_key, p4+v_down);
    printContains(hex_key, p4+v_left);

    cout << "p5\n";
    printContains(hex_key, p5+v_up);
    printContains(hex_key, p5+v_right);
    printContains(hex_key, p5+v_down);
    printContains(hex_key, p5+v_left);

    cout << "p6\n";
    printContains(hex_key, p6+v_up);
    printContains(hex_key, p6+v_right);
    printContains(hex_key, p6+v_down);
    printContains(hex_key, p6+v_left);
}
