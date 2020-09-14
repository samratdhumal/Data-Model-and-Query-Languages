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
{for $author in $doc/author
where $author/book/title = $d
return $author/name}
<rating>{distinct-values($new-var/book[title = $d]/rating)} </rating> 
<price>{distinct-values($new-var/book[title = $d]/price)} </price>
</book>
</newbooks>)

let $g := distinct-values(for $t in $c return ($t/category))
let $h := for $i at $cnt in $g 
return 
(<newbooks>
<list id="{$cnt}"> 
{for $f in $c where $f/category = $i 
return 
<book>
{<category>{$i}</category>}
{$f/book/(title,price,name,rating)}
</book>}
</list>
</newbooks>)


let $j := distinct-values(for $t in $c return ($t/category))
let $k := for $new_f in $j 
return 
(<booklist>
{for $new_a in $c 
where $new_a/category = $new_f 
return 
<book>
{$new_a/book/@year}
{$new_a/book/(title)}
{<category>{$new_f}</category>}
{$new_a/book/(price,name,rating)}
</book>}
</booklist>)

let $m := for $name at $cnt in $auth_name 
order by $name 
return 
(<names>
<name>{$name}</name>
<count>{$cnt}</count>
</names>)
let $nm_pair := for $n1 in $m , $n2 in $m
where $n1/count < $n2/count
return <author>{$n1/name}{$n2/name}</author>
                    
let $ps := for $new_f at $cnt1 in $k/book, $p in $nm_pair
where $new_f/name[1]/data() = $p/name[1]/data() 
and $new_f/name[2]/data() = $p/name[2]/data()
return <output>
<pair_name>
{$p/name/data()}
</pair_name>
<namelist>
{$p/name}
</namelist>
<book year="{$new_f/@year}">
{$new_f/(category,title,price,rating)}
</book>
</output>

for $auth_pair in distinct-values($ps/pair_name) 
where count(index-of($ps/pair_name, $auth_pair)) > 1
return 
<coauthor>
{
(for $p in $ps 
where $p/pair_name/data() = $auth_pair 
return 
<output>
{$p/namelist/name}
{$p/book}
</output>)
}
</coauthor>