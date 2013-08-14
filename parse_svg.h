#if !defined __BAH_PARSE_SVG_H__
#define __BAH_PARSE_SVG_H__

#include "TouchPolygon.h"
#include <vector>
#include <string>
#include <map>

class Key {
public:
    Key() : _keys() { }
    Key(const std::vector<TouchPolygon::Polygon> & v) : _keys(v) { }

    void addPolygon(const TouchPolygon::Polygon & poly)
    {
        _keys.push_back(poly);
    }

    bool contains(const TouchPolygon::Point & p) const
    {
        for (std::vector<TouchPolygon::Polygon>::const_iterator poly =
        _keys.begin(); poly != _keys.end(); ++poly) {
            if (poly->contains(p)) {
                return true;
            }
        }

        return false;
    }

    size_t polygonCount() const { return _keys.size(); }

private:
    std::vector<TouchPolygon::Polygon> _keys;
};

extern std::map<std::string, Key> keys;
void initKeys(void); // Sets up the above map.

#endif
