---
title       : GTA House Sold Price
subtitle    : ..help you finding the correct price of your dream home in the Greater Toronto Area
author      : Owen JY 
job         : Parttime Comedian
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
#url:
#  lib:      ../libraries
#  assets:   ../assets
widgets     : []            # {mathjax, quiz, bootstrap}
ext_widgets : {rCharts: libraries/nvd3}
mode: selfcontained
knit        : slidify::knit2slides

--- 
## Overview
Navigating the red-hot Toront housing market can be very chanllenging. I have created this simple app to help home-hunters. The App aims to do:
 * Show price of rencently sold houses on Google Map
 * Show price trend
 * Clarifying "bidding-war" with sold numbers




--- 
## Map

#### Zoom-in to Toronto then refresh your browser by pressing F5
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>MapID52603b011962</title>
<meta http-equiv="content-type" content="text/html;charset=utf-8" />
<style type="text/css">
body {
  color: #444444;
  font-family: Arial,Helvetica,sans-serif;
  font-size: 75%;
  }
  a {
  color: #4D87C7;
  text-decoration: none;
}
</style>
</head>
<body>
 <!-- Map generated in R 3.1.0 by googleVis 0.5.2 package -->
<!-- Sun Jul 27 14:26:05 2014 -->


<!-- jsHeader -->
<script type="text/javascript">
 
// jsData 
function gvisDataMapID52603b011962 () {
var data = new google.visualization.DataTable();
var datajson =
[
 [
 "3 Omega St ,markham,ontario,canada",
"3 Omega St Asking:  409000 Sold:  470000 Margin:  15% DOM:  5 Date Sold:  18Jun2014" 
],
[
 "381 White's Hill Ave ,markham,ontario,canada",
"381 White's Hill Ave Asking:  428800 Sold:  415000 Margin:  -3% DOM:  17 Date Sold:  26Jun2014" 
],
[
 "395 White's Hill Ave ,markham,ontario,canada",
"395 White's Hill Ave Asking:  429900 Sold:  413000 Margin:  -4% DOM:  70 Date Sold:  16Jun2014" 
],
[
 "134 Dunbar Cres ,markham,ontario,canada",
"134 Dunbar Cres Asking:  449000 Sold:  480000 Margin:  7% DOM:  6 Date Sold:  4Jun2014" 
],
[
 "68 Sunway Sq ,markham,ontario,canada",
"68 Sunway Sq Asking:  449800 Sold:  495000 Margin:  10% DOM:  8 Date Sold:  15Jun2014" 
],
[
 "120 White's Hill Ave ,markham,ontario,canada",
"120 White's Hill Ave Asking:  449990 Sold:  470000 Margin:  4% DOM:  8 Date Sold:  31May2014" 
],
[
 "280 Gas Lamp Lane ,markham,ontario,canada",
"280 Gas Lamp Lane Asking:  457800 Sold:  460000 Margin:  0% DOM:  5 Date Sold:  5Jun2014" 
],
[
 "30 Autumnglen Rd ,markham,ontario,canada",
"30 Autumnglen Rd Asking:  459000 Sold:  452888 Margin:  -1% DOM:  6 Date Sold:  4Jun2014" 
],
[
 "62 Rose Way ,markham,ontario,canada",
"62 Rose Way Asking:  459000 Sold:  469000 Margin:  2% DOM:  0 Date Sold:  17Jun2014" 
],
[
 "466 Bur Oak Ave ,markham,ontario,canada",
"466 Bur Oak Ave Asking:  469000 Sold:  466000 Margin:  -1% DOM:  13 Date Sold:  4Jun2014" 
] 
];
data.addColumn('string','address');
data.addColumn('string','tip');
data.addRows(datajson);
return(data);
}
 
// jsDrawChart
function drawChartMapID52603b011962() {
var data = gvisDataMapID52603b011962();
var options = {};
options["showTip"] = true;
options["enableScrollWheel"] = true;
options["mapType"] = "normal";
options["width"] =    800;
options["height"] =    600;

    var chart = new google.visualization.Map(
    document.getElementById('MapID52603b011962')
    );
    chart.draw(data,options);
    

}
  
 
// jsDisplayChart
(function() {
var pkgs = window.__gvisPackages = window.__gvisPackages || [];
var callbacks = window.__gvisCallbacks = window.__gvisCallbacks || [];
var chartid = "map";
  
// Manually see if chartid is in pkgs (not all browsers support Array.indexOf)
var i, newPackage = true;
for (i = 0; newPackage && i < pkgs.length; i++) {
if (pkgs[i] === chartid)
newPackage = false;
}
if (newPackage)
  pkgs.push(chartid);
  
// Add the drawChart function to the global list of callbacks
callbacks.push(drawChartMapID52603b011962);
})();
function displayChartMapID52603b011962() {
  var pkgs = window.__gvisPackages = window.__gvisPackages || [];
  var callbacks = window.__gvisCallbacks = window.__gvisCallbacks || [];
  window.clearTimeout(window.__gvisLoad);
  // The timeout is set to 100 because otherwise the container div we are
  // targeting might not be part of the document yet
  window.__gvisLoad = setTimeout(function() {
  var pkgCount = pkgs.length;
  google.load("visualization", "1", { packages:pkgs, callback: function() {
  if (pkgCount != pkgs.length) {
  // Race condition where another setTimeout call snuck in after us; if
  // that call added a package, we must not shift its callback
  return;
}
while (callbacks.length > 0)
callbacks.shift()();
} });
}, 100);
}
 
// jsFooter
</script>
 
<!-- jsChart -->  
<script type="text/javascript" src="https://www.google.com/jsapi?callback=displayChartMapID52603b011962"></script>
 
<!-- divChart -->
  
<div id="MapID52603b011962"
  style="width: 800px; height: 600px;">
</div>
 <div><span>Data: data[1:10, ] &#8226; Chart ID: <a href="Chart_MapID52603b011962.html">MapID52603b011962</a> &#8226; <a href="https://github.com/mages/googleVis">googleVis-0.5.2</a></span><br /> 
<!-- htmlFooter -->
<span> 
  R version 3.1.0 (2014-04-10) 
  &#8226; <a href="https://developers.google.com/terms/">Google Terms of Use</a> &#8226; <a href="https://google-developers.appspot.com/chart/interactive/docs/gallery/map">Documentation and Data Policy</a>
</span></div>
</body>
</html>


---
## Price Trend
#### Showing trending price
![plot of chunk trend](assets/fig/trend.png) 


---
## Price War
#### Showing price spread in % v.s. sold price
![plot of chunk war](assets/fig/war.png) 

