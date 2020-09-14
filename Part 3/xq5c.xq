let $doc := doc("db/books.xml")/biblio
let $a := $doc/author/book
let $b := distinct-values($a/title)
let $auth := $doc/author
let $c := for $d in $b,  $new_auth in $auth
where $new_auth/book/title = $d
return
(<newbooks>
{<category>{distinct-values(for $f in $a where $f/title = $d return $f/(category))}</category>}
<book year = "{distinct-values($new_auth/book[title = $d]/@year)}"> 
<title>{$d}</title>
{for $author in $doc/author
where $author/book/title = $d
return $author/name}
<rating>{distinct-values($new_auth/book[title = $d]/rating)} </rating> 
<price>{distinct-values($new_auth/book[title = $d]/price)} </price>
</book>
</newbooks>)

let $g := distinct-values(for $t in $c return ($t/category))
let $h := for $i at $cnt in $g 
return 
(<newbooks>
<list id="{$cnt}"> 
{for $f4 in $c where $f4/category = $i 
return 
<book>
{<category>{$i}</category>}
{$f4/book/(title,price,name,rating)}
</book>}
</list>
</newbooks>)

let $j := for $i1 in $h[1]/list/book
for $i2 in $h[2]/list/book
for $i3 in $h[3]/list/book
for $i4 in $h[4]/list/book
return 
<pairlist>
<pairs>{$i1}{$i2}{$i3}{$i4}</pairs>
</pairlist>
       
let $j_final := for $k in $j/pairs
let $f2_final := sum($k/book/price/data())
let $f3_final :=sum($k/book/rating/data())
return 
<result>
<finalprice>{$f2_final}</finalprice>
<finalrating>{$f3_final}</finalrating>
{$k}
</result>
        
let $outputcell := for $m in $j_final where $m/finalprice <= 1800
order by $m/ratingtotal descending
return $m
return $outputcell[1]/pairs/book/(title,rating,price,category)