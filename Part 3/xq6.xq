let $doc := doc("db/books.xml")/biblio
let $a := $doc/author
let $b := distinct-values($doc/author/book/title)
let $c := (for $d in $a, $e in $b  
where $d/book/title = $e     
group by $e                 
return 
<book year = "{distinct-values($d/book[title = $e]/@year)}">  
<title> {$e} </title>
<category>{distinct-values($d/book[title = $e]/category)} </category> 
<rating>{distinct-values($d/book[title = $e]/rating)} </rating> 
<price>{distinct-values($d/book[title = $e]/price)} </price>  
{for $f in $d/name return
<author>{$f}</author>}  
</book>)

return <biblio>{$c}</biblio>