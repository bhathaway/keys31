#include "rapidxml.hpp"
#include "parse_svg.h"
#include <fstream>

#include <cstring>
#include <list>

using namespace rapidxml;
using namespace std;
using namespace TouchPolygon;

map<string, Key> keys;


void initKeys()
{
    ifstream svg_file("interface.svg", ifstream::binary);
    
    svg_file.seekg(0, svg_file.end);
    int length = svg_file.tellg();
    svg_file.seekg(0, svg_file.beg);

    char * buffer = new char[length];
    svg_file.read(buffer, length);

    xml_document<> doc;   
    doc.parse<0>(buffer);

    xml_node<> * node = doc.first_node()->first_node();
    node = node->next_sibling(); // Should be the "g" node

    node = node->first_node(); // Should be the title node.

    for (node = node->next_sibling(); node; node = node->next_sibling()) {
        string key_name;
        list<Point> point_list;
        vector<Point> points;

        for (xml_attribute<> * attribute = node->first_attribute(); attribute;
        attribute = attribute->next_attribute()) {
            const char * name_start = attribute->name();
            const char * value_start = attribute->value();
            if (! strncmp(name_start, "id", 2)) {
                const char * underscore = value_start;
                for (;*underscore != '_' && underscore - value_start < 7;
                ++underscore) ;
                key_name = string(value_start, underscore-value_start);
            } else if (! strncmp(name_start, "points", 6)) {
                char * ptr = const_cast<char *>(value_start);
                for (unsigned i = 0; i < 6; ++i) {
                    const double x = strtod(ptr, &ptr);
                    if (*ptr == ',') {
                        ++ptr;
                    }
                    const double y = strtod(ptr, &ptr);
                    point_list.push_front(Point(x, y));
                }
            }
        }

        // After we have all the information, populate the structure.
        if (keys.find(key_name) == keys.end()) {
            keys[key_name] = Key();
        }

        for (list<Point>::const_iterator point = point_list.begin();
        point != point_list.end(); ++point) {
            points.push_back(*point);
        }
        keys[key_name].addPolygon(Polygon(points));
    }

    for (map<string, Key>::const_iterator it = keys.begin(); it != keys.end();
    ++it) {
        assert(it->second.polygonCount() == 3);
    }

    delete [] buffer;
}

