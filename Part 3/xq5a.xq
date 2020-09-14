let $a := doc("db/books.xml")/biblio/author/book
let $b := distinct-values($a/category)
let $c := for $d in $b
return 
(<booklist>
{<category>
{$d}
</category>}
{for $book in $a 
where $book/category=$d 
return 
<book>
{$book/(title,price)}
</book>}
</booklist>)


for $e in $c
let $f := <book>
{$e/category} 
{
  let $g := <price>
  {
    min(for $h in ("db/books.xml") 
    return 
    $e/book/price/text())
  }
  </price>
  return
  if ($e/book/price = $g)
  then (for $e in $e/book where $e/price = $g 
  return ($e/title, $e/price)) 
}
</book>


return for $i in $f
return 
(<title>
{distinct-values($i/title)}
</title>,
<price>
{distinct-values($i/price)}
</price>,
$i/category)