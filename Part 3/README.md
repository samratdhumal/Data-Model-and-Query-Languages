## PART3 - "Book Management(XQuery)”

### 1.1 Find the names of all Jeff’s co-authors and list them together with the titles of books that were coauthored.
Sample output format:
<book>
<title>Big data analytics</title>
<name>Jeff</name>
<name>the other author</name>
</book>
……
### 1.2 Return all the author pairs who have co-authored two or more books together, list their co-authored
books’ information.
Sample output format:
<coauthor>
<output>
<name>author1</name>
<name>author2</name>
<book year="the book year">
<title>the book title</title>
<category>the book category</category>
<rating>the book rating</rating>
<price>the book price</price>
</book>
</output>
<output>
<name>author1</name>
<name>author2</name>
<book year="the book year">
<title>the book title</title>
<category>the book category</category>
<rating>the book rating</rating>
<price>the book price</price>
</book>
</output>
......
</coauthor>
……
### 1.3 Find the average book price of each category and global. If a category has higher than global average
book price, list one most expensive book and its authors, for each of those categories.
Sample output format:
<result>
<categories>
<output>
<category>DB</category>
<title>Database systems</title>
<price>1000</price>
<name>author1</name>
<name>author2</name>
<name>……</name>
</output>
</categories>
......
</result>
### 1.4 Return all the book price and rating with book name and sort the price and rating from high to low
separately.
Sample output format 1.4a:
<title>Applied Mathematics</title>
<price>100</price>
<title>Introduction to R programming<title/>
<price>200</price>
<title>Introduction to Python<title/>
<price>300</price>
<title>Big data analytics<title/>
<price>400</price>
…
Sample output format 1.4b:
<title>Applied Functional Analysis</title>
<rating>2</rating>
<title>Applied Mathematics</title>
<rating>2.1</rating>
<title>AWS: Security Best Practices on AWS</title>
<rating>2.7</rating>
<title>Introduction to R programming</title>
<rating>3.2</rating>
<title>Big data analytics</title>
<rating>3.5</rating>
…
  
### 1.5 The text book requirement in this class is based on ‘category’: one ‘DB’, one ‘PL’, one ‘Science’, one
‘Others’. Return your plan for the book purchasing. The plan should follow some second rules (cheapest (1),
best rating (1), assume you have $1800 how to get the best rating books (2))
Sample output format 1.5a:
<title>Big data analytics</title>
<price>400</price>
<category>DB</category>
<title>Applied Functional Analysis</title>
<price>400</price>
<category>Others</category>
<title>Introduction to R programming</title>
<price>200</price>
<category>PL</category>
<title>Applied Mathematics</title>
<price>100</price>
<category>Science</category>
Sample output format 1.5b:
<title>Database systems</title>
<rating>5</rating>
<category>DB</category>
<title>Pattern Recognition</title>
<rating>5</rating>
<category>Others</category>
<title>Introduction to Python</title>
<rating>4.7</rating>
<category>PL</category>
<title>Statistical Inference</title>
<rating>5</rating>
<category>Science</category>

### 1.6 Define a DTD for an equivalent DTD data format B which stores the same information as A, but in
which the authors are listed under their books. Write an XQuery query whose input is an XML document valid
with respect to the DTD A and whose output is another XML document valid with respect to B.
