import urllib.request
import lxml.html
from lxml import etree

contents = urllib.request.urlopen("http://thetaoteching.com/taoteching1.html").read()
lxml_mysite = lxml.html.fromstring(contents)

display = lxml_mysite.get_element_by_id("display")
# print(display)
print(etree.tostring(display, pretty_print=True))

# description = lxml_mysite.xpath("//meta[@name='description']")[0] # meta tag description

# text = description.get('content') # content attribute of the tag
# print(text)

# print(contents)
