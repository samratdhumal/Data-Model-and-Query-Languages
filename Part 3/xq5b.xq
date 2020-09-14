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
{$book/(title,rating)}
</book>}
</booklist>)


for $e in $c
let $f := <book>
{$e/category} 
{
  let $g := <rating>
  {
    max(for $h in ("db/books.xml") 
    return 
    $e/book/rating/text())
  }
  </rating>
  return
  if ($e/book/rating = $g)
  then (for $e in $e/book where $e/rating = $g 
  return ($e/title, $e/rating)) 
}
</book>


return for $i in $f
return 
(<title>
{distinct-values($i/title)}
</title>,
<rating>
{distinct-values($i/rating)}
</rating>,
$i/category)