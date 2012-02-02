<?php

/* google_sitemap.class.php

If you want to donate and help future development of this project
please contact: me:

	Svetoslav Marinov (before sending any money)
	email: svetoslavm@gmail.com
	subject: "Donation: Google Site Map PHP Class"
	and we will discuss the most appropriate transfer method.


1. Ownership and License.
The Software is owned by Svetoslav Marinov and is copyrighted and licensed.

Google Sitemap class is made available for both for COMMERCIAL or/and NON-COMMERCIAL sites for
FREE of charge.

You may alter, modify, add to and build upon the Software for your own personal use and
purposes provided that you do not redistribute or seek to profit from work derived from
or based on the Software.

You may not merge, sell or sublicense the Software or any derivatives or
works based on the Software. You may not distribute the Software or include the Software
on any distribution without written permission.

2. Term and Termination
Svetoslav Marinov retains the right to terminate this license at any time with or
without any prior notification.

3. Warranty Disclaimer and Limitation of Liability
Svetoslav Marinov licenses the Software to you on an "AS IS" basis,
without warranty of any kind. Svetoslav Marinov hereby expressly disclaims all
warranties or conditions, either express or implied, including, but not limited to,
the implied warranties or conditions of merchantability and fitness for a particular purpose.
You are solely responsible for determining the appropriateness of using this Software
and assume all risks associated with the use of this Software, including but not limited
to the risks of program errors, damage to or loss of data, programs or equipment,
and unavailability or interruption of operations. Some jurisdictions do not allow
for the exclusion or limitation of implied warranties, so the above limitations or
exclusions may not apply to you.

Svetoslav Marinov will not be liable for any direct damages or for any special,
incidental, or indirect damages or for any economic consequential damages
(including lost profits or savings), even if Svetoslav Marinov has been advised of
the possibility of such damages. Svetoslav Marinov will not be liable for the loss of,
or damage to, your records or data, or any damages claimed by you based on a third party claim.
Some jurisdictions do not allow for the exclusion or limitation of incidental or consequential damages,
so the above limitations or exclusions may not apply to you.

4. License Rights
You hereby grant to Svetoslav Marinov an irrevocable license under all intellectual property rights
(including copyright) to use, copy, distribute, sublicense, display,
perform and prepare derivative works based upon any feedback,
including materials, fixes, error corrections, enhancements,
suggestions and the like that you provide to Svetoslav Marinov.


*/

/** A class for generating simple google sitemaps
 *@author Svetoslav Marinov <svetoslav.marinov@gmail.com>
 *@copyright 2005
 *@version 0.1
 *@access public
 *@package google_sitemap
 *@link http://devquickref.com
 */
class google_sitemap
{
  var $header = "<\x3Fxml version=\"1.0\" encoding=\"UTF-8\"\x3F>\n\t<urlset xmlns=\"http://www.google.com/schemas/sitemap/0.84\">\n";
  var $charset = "UTF-8";
  var $footer = "\t</urlset>\n";
  var $items = array();

  /** Adds a new item to the channel contents.
   *@param google_sitemap item $new_item
   *@access public
   */
  function add_item($new_item){
    //Make sure $new_item is an 'google_sitemap item' object
    if(!is_a($new_item, "google_sitemap_item")){
      //Stop execution with an error message
      trigger_error("Can't add a non-google_sitemap_item object to the sitemap items array");
    }
    $this->items[] = $new_item;
  }

  /** Generates the sitemap XML data based on object properties.
   *@param string $file_name ( optional ) if file name is supplied the XML data is saved in it otherwise returned as a string.
   *@access public
   *@return [void|string]
   */
  function build( $file_name = null )
  {
    //$map = $this->header . "\n";

    foreach($this->items as $item)
    {
		$item->loc = htmlentities($item->loc, ENT_QUOTES);
      $map .= "\t\t<url>\n\t\t\t<loc>$item->loc</loc>\n";

	  // lastmod
      if ( !empty( $item->lastmod ) )
      	$map .= "\t\t\t<lastmod>$item->lastmod</lastmod>\n";

	  // changefreq
      if ( !empty( $item->changefreq ) )
      	$map .= "\t\t\t<changefreq>$item->changefreq</changefreq>\n";

	  // priority
      if ( !empty( $item->priority ) )
      	$map .= "\t\t\t<priority>$item->priority</priority>\n";

      $map .= "\t\t</url>\n\n";
    }

    //$map .= $this->footer . "\n";

    if(!is_null($file_name)){
      $fh = fopen($file_name, 'a');
      fwrite($fh, $map);
      fclose($fh);
    }else{
      return $map;
    }
  }

}

/** A class for storing google_sitemap items and will be added to google_sitemap objects.
 *@author Svetoslav Marinov <svetoslav.marinov@gmail.com>
 *@copyright 2005
 *@access public
 *@package google_sitemap_item
 *@link http://devquickref.com
 *@version 0.1
*/
class google_sitemap_item
{
  /** Assigns constructor parameters to their corresponding object properties.
   *@access public
   *@param string $loc location
   *@param string $lastmod date (optional) format in YYYY-MM-DD or in "ISO 8601" format
   *@param string $changefreq (optional)( always,hourly,daily,weekly,monthly,yearly,never )
   *@param string $priority (optional) current link's priority ( 0.0-1.0 )
   */
  function google_sitemap_item( $loc, $lastmod = '', $changefreq = '', $priority = '' )
  {
    $this->loc = $loc;
    $this->lastmod = $lastmod;
    $this->changefreq = $changefreq;
    $this->priority = $priority;
  }
}

?>