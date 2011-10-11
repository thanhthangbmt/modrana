"""multi source geocoding"""
from point import Point
import re

class GeoPyPoint(Point):
  """
  * the GeoPy geocoding results return composite place names contaning
  the address components delimited by ','
  * this point Point subclass just splits the part before the first ','
  and returns it when the getName method is called
  * also, it outpust a description text where all ',' are replaced by newlines
  """
  def __init__(self, lat, lon, placeText):
    Point.__init__(self, lat, lon, message=placeText)
    self.name=placeText.split(',')[0]
    self.description=re.sub(',','\n',placeText) # replace separators with newlines

  def getName(self):
    return self.name

  def getDescription(self):
    return self.description

def _places2points(places):
  """convert place tupples to modRana points"""
  points = []
  for place in places:
    text, (lat,lon) = place
    points.append(GeoPyPoint(lat,lon, text))
  return points

def geocode(address):
  from geopy import geocoders
  g = geocoders.Google()
  try:
    places = list(g.geocode(address, exactly_one=False))
    return _places2points(places)
  except Exception, e:
    print("geocoding exception:\n", e)
    return []

#def wikipediaSearch(query):
#  from geopy import geocoders
##  wiki = geocoders.MediaWiki("http://wikipedia.org/wiki/%s")
##  wiki = geocoders.MediaWiki("http://en.wikipedia.org/wiki/%s")
##  wiki = geocoders.MediaWiki("http://en.wikipedia.org/wiki/Special:Search/%s")
#  wiki = geocoders.MediaWiki("http://wiki.case.edu/%s")
#  places = list(wiki.geocode(query))
#  return _places2points(places)
##  try:
##    places = list(wiki.geocode(query))
##    return _places2points(places)
##  except Exception, e:
##    print("wiki search exception:\n", e)
##    return []

