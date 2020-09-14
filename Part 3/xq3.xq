let $doc := doc("db/books.xml")/biblio
let $a := $doc/author/book
let $b := distinct-values($a/title)
let $auth := $doc/author
let $auth_name := distinct-values($doc/author/name)
let $new-var := for $new_auth in $auth
return $new_auth
let $c := for $d in $b

where $new-var/book/title = $d
return
(<newbooks>
{<category>{distinct-values(for $f in $a where $f/title = $d return $f/(category))}</category>}
<book year = "{distinct-values($new-var/book[title = $d]/@year)}"> 
<title>{$d}</title>
<price>{distinct-values($new-var/book[title = $d]/price)} </price>
{for $author in $doc/author
where $author/book/title = $d
return $author/name}
</book>
</newbooks>)


let $j := distinct-values($c/category)
let $c2 := for $k in $j 
return 
(<list> 
{<category>{$k}</category>}
{for $new_a in $c
where $new_a/category = $k 
return <book>{$new_a/book/(title,price,name)}</book>}
</list>)

let $avg_price := 
(<avg>
{avg(for $m in $c2 
return $c2/book/price)}
</avg>)

let $avg_cat := for $n in $c2 
return 
(<dummy>
{($n/category,
<avg>
{avg(for $m in $n 
return 
$n/book/price)}
</avg>)}
</dummy>)

let $consolidated := for $k in $avg_cat 
return
if ($k/avg > $avg_price) 
then(for $j in $c2 
where $j/category = $k/category
return $j)

return 
<result>

{for $final in $consolidated
let $max := 
<price>
{max(for $m in $final return $final/book/price/text())}
</price>
return 

<categories>

<output>
{($final/category, for $k in $final/book
where $k/price=$max 
return 
$k/(title,price,name))}
</output>

</categories>}

</result>