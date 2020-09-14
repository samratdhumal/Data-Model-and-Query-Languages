## PART3 - "Book Management(XQuery)”

### 1.1 Find the names of all Jeff’s co-authors and list them together with the titles of books that were coauthored.
Sample output format:</br>
<book></br>
<title>Big data analytics</title></br>
<name>Jeff</name></br>
<name>the other author</name></br>
</book></br>
……</br>
### 1.2 Return all the author pairs who have co-authored two or more books together, list their co-authored books’ information.
Sample output format:</br>
<coauthor></br>
<output></br>
<name>author1</name></br>
<name>author2</name></br>
<book year="the book year"></br>
<title>the book title</title></br>
<category>the book category</category></br>
<rating>the book rating</rating></br>
<price>the book price</price></br>
</book></br>
</output></br>
<output></br>
<name>author1</name></br>
<name>author2</name></br>
<book year="the book year"></br>
<title>the book title</title></br>
<category>the book category</category></br>
<rating>the book rating</rating></br>
<price>the book price</price></br>
</book></br>
</output></br>
......</br>
</coauthor></br>
……</br>
### 1.3 Find the average book price of each category and global. If a category has higher than global average book price, list one most expensive book and its authors, for each of those categories.
Sample output format:</br>
<result></br>
<categories></br>
<output></br>
<category>DB</category></br>
<title>Database systems</title></br>
<price>1000</price></br>
<name>author1</name></br>
<name>author2</name></br>
<name>……</name></br>
</output></br>
</categories></br>
......</br>
</result></br>
### 1.4 Return all the book price and rating with book name and sort the price and rating from high to low separately.
Sample output format 1.4a:</br>
<title>Applied Mathematics</title></br>
<price>100</price></br>
<title>Introduction to R programming<title/></br>
<price>200</price></br>
<title>Introduction to Python<title/></br>
<price>300</price></br>
<title>Big data analytics<title/></br>
<price>400</price></br>
…</br></br>
Sample output format 1.4b:</br>
<title>Applied Functional Analysis</title></br>
<rating>2</rating></br>
<title>Applied Mathematics</title></br>
<rating>2.1</rating></br>
<title>AWS: Security Best Practices on AWS</title></br>
<rating>2.7</rating></br>
<title>Introduction to R programming</title></br>
<rating>3.2</rating></br>
<title>Big data analytics</title></br>
<rating>3.5</rating></br>
…
  
### 1.5 The text book requirement in this class is based on ‘category’: one ‘DB’, one ‘PL’, one ‘Science’, one ‘Others’. Return your plan for the book purchasing. The plan should follow some second rules (cheapest (1), best rating (1), assume you have $1800 how to get the best rating books (2))
Sample output format 1.5a:</br>
<title>Big data analytics</title></br>
<price>400</price></br>
<category>DB</category></br>
<title>Applied Functional Analysis</title></br>
<price>400</price></br>
<category>Others</category></br>
<title>Introduction to R programming</title></br>
<price>200</price></br>
<category>PL</category></br>
<title>Applied Mathematics</title></br>
<price>100</price></br>
<category>Science</category></br></br>
Sample output format 1.5b:</br>
<title>Database systems</title></br>
<rating>5</rating></br>
<category>DB</category></br>
<title>Pattern Recognition</title></br>
<rating>5</rating></br>
<category>Others</category></br>
<title>Introduction to Python</title></br>
<rating>4.7</rating></br>
<category>PL</category></br>
<title>Statistical Inference</title></br>
<rating>5</rating></br>
<category>Science</category></br>

### 1.6 Define a DTD for an equivalent DTD data format B which stores the same information as A, but in which the authors are listed under their books. Write an XQuery query whose input is an XML document valid with respect to the DTD A and whose output is another XML document valid with respect to B.
