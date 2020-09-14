let $doc := doc('db/books.xml')/biblio/author/book
for $b in $doc
group by $title := $b/title,  $price := xs:integer($b/price)
order by $price
return 
(<title>
{$title}
</title>, 
<price>
{$price}
</price>)