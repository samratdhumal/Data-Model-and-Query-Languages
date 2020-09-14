let $doc:= doc('db/books.xml')/biblio/author[name='Jeff']
for $title in $doc/book/title
for $other in doc('db/books.xml')/biblio/author
where $title = $other/book/title
and $other/name != 'Jeff'
return 
<book>
{$title}
{$doc/name}
{$other/name}
</book>