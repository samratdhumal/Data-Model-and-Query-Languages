let $doc := doc('db/books.xml')/biblio/author/book
for $b in $doc
group by $title := $b/title, $rating := xs:decimal($b/rating)
order by $rating descending
return 
(<title>
{$title}
</title>, 
<rating>
{$rating}
</rating>)
