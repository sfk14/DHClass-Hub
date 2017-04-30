## XQuery Exercise 3 Solution 

### XQuery to Generate List of Locations   
  
````
xquery version "3.0";
declare variable $ThisFileContent:=
string-join(

let $coll := collection('/db/Schism')/*
let $locations := $coll/descendant::location
let $distLocs := distinct-values($locations)
for $i in $distLocs
return $i, " &#10;");
 
let $filename := "SchismLocations.txt"
let $doc-db-uri := xmldb:store("/db/rParker/", $filename, $ThisFileContent, "text/plain")
return $doc-db-uri 
````  
  
Creates a text file in the rParker collection folder titled SchismLocations, which contains a list of all the locations in the Schism collection. Notice the unusual setup of the string-join function opening before the FLWOR statements. This allows us to create a file that contains a list of the locations separated by a line return.  
  
### XQuery to Generate KML File with Locations and Descriptions  
  
````
xquery version "3.0";
<kml>
    {
let $coll := collection('/db/Schism')/*
let $locations := $coll/descendant::location
let $distLocs := distinct-values($locations)
for $i in $distLocs
return
        <Placemark>
            <name>{$i}</name>
            <description>
                {$locations[text() = $i]/ancestor::p[string-length()= max(string-length())]/string()}                
             </description>
        </Placemark>
    }
    </kml>
 ````  
   
Creates a KML file with a Placemark for each of the distinct locations. The bit of code in the `<description>` element grabs the longest paragraph element in the collection that contains the distinct location. Below we have included some additional queries you could test instead of the longest contextual paragraph.  
   
`{count($locations[text()=$i])}` - gets a count of the number of times any single location appears in the collection 
`{$locations[text()=$i]/string-join(base-uri(.),",")}`  - gets the file name(s) and  file path(s) where each distinct location appears  