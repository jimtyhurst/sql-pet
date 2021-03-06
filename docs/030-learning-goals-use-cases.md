# Chapter Learning Goals and Use Cases {#chapter_learning-goals}

> This chapter sets the context for the book by:
> 
> * Describing our assumptions about the reader of this book: the challenges you face, your R skills, your learning goals, and context.
> * Describing what the book offers in terms of:
>   * Problems that are addressed 
>   * Learning objectives
>   * Sequence of topics, ranging from connecting to the database to exploring an issue in response to questions from an executive
>   * R packages used
> * Describing the sample database used in the book



## The Book's Challenge: goals, context and expectations

* Working with the data that's behind the enterprise firewall is challenging in a unique way.  Most of us R users are accustomed to a vast learning community that shares resources, discusses methods in public, and that can help each other trouble-shoot a problem. The very necessary enterprise firewall makes all of that difficult, if not impossible.  And yet enterprise database environment is very important  because in so many cases that's where the data (and possibly your paycheck) are coming from.
* Differences between production and data warehouse environments.  We are simulating a production environment.  There are many similarities.  Data models are different.  Performance is a bigger deal in the OLTP.
* Data in a organizational environment around the database.  Learning to keep your DBAs happy:
  + You are your own DBA in this simulation, so you can wreak havoc and learn from it, but you can learn to be DBA-friendly here.
  + In the end it's the subject-matter experts (people using the data every day) that really understand your data, but you have to work with your DBAs first.
  + You can't believe all the data you pull out of the database.

### The Challenge: Investigating a question using an organization's database

Using an enterprise database to create meaningful management insights requires a combination of very different skills:

* Need both familiarity with the data and a focus question
  + An iterative process where 
    + the data resource can shape your understanding of the question
    + the question you need to answer will frame how you see the data resource
  + You need to go back and forth between the two, asking 
    + do I understand the question?
    + do I understand the data?

* A "good enough" understanding of the data resource (in the DBMS)
  + Nobody knows everything about an entire organization's data resources. We do, however, need to know what more we need to know and estimate what we don't know yet.
  + Use all available documentation and understand its limits
  + Use your own tools and skills to examine the data resource
  + What is *missing* from the database: (columns, records, cells)
  + Why is the data missing?
  
* A "good enough" understanding of the question you seek to answer
  + How general or specific is your question?
  + How aligned is it with the purpose for which the database was designed and is being operated?
  + How different are your assumptions and concerns from those of the people who enter and use the data on a day to day basis?

* Some cycles in this iteration between question refinement and reformulation on the one hand  and data retrieval and investigation on the other feel like a waste time.  That's inevitable. 

* Bringing R tools and skills to bear on these
  + R is a powerful tool for data access, manipulation, modeling and presentation
  + Different R packages and techniques are available for each of the elements involved in exploring, analyzing and reporting on enterprise behavior using the enterprise database.

### Strategies

  + Local, idiosyncratic optimization (entry and use of data). For example, different individuals might code a variable differently.
  + Drifting use / bastardization of a column
  + Turf wars and acquisitions
  + Partial recollection / history: find the people who know where the skeletons are


### Problems that we address in the book

* This book emphasizes database exploration and the R techniques that are needed.
* We are emphasizing a tidyverse approach.  & graphics to really makes sense of what we find.
* We can't call on real people in the adventureworks company, obviously, but we invent some characters to illustrate the investigation process as we have experienced it in various organizational settings.

### Signposts

> **Practice Tips**
> 
> _Here's how we do it.  
>    + Conventions like always using the `labs()` function in ggplot  
>    + Specifying the package the first time a function is used_  
> 

### Book structure

The book explores R techniques and and investigation strategies using progressively more complex queries, that lead to this scenario: There is a new Executive VP of Sales at Adventure Works. She wants an overview of sales and the sales organization's performance at _Adventure Works_.  Once her questions are satisfied, a monthly report is developed that can run automatically and appear in her mailbox.

* Early chapters demonstrate now to connect to a database and find your way around it, with a pause to discuss how to secure your credentials.
* Both Rstudio and R script methods are shown for the same database overview.
* The `salesordedrheader` table in the `sales` schema is used to demonstrate packages and functions that show what a single table contains.
* Then the same table is used but the investigation adopts a business perspective, demonstrating R techniques that are motivated by questions like "How sales for the _Adventure Works_ company?" 
* Starting with base tables, then use views (that contain knowledge about the application)
* More involved queries join three tables in three different schemas: `salesperson`, `employee`, and `person`. The relevant question might be "Who is my top salesperson?  Are the 3 top salespersons older or younger?"
* Finally, we build a series of queries that explore the sales workflow: sales territories, sales people, top customers by product, product mixture that gives top 80% of sales.  What are they producing in detail?  Seasonal? Type of product, region, etc.?
* The book ends by demonstrating how R code can be used for standard reports from the database that are emailed to a list of recipients.

## Making your way through the book

After working through the code in this book, you can expect to be able to:

* R, SQL and PostgreSQL
  * Run queries against PostgreSQL in an environment that simulates what is found in a enterprise setting.
  * Understand techniques and some of the trade-offs between:
      * queries aimed at exploration or informal investigation using [dplyr](https://cran.r-project.org/package=dplyr)    [@Wickham2018]; and 
      * queries that should be written in SQL, because performance is important due to the size of the database or the frequency  with which a query is to be run.
  * Understand the equivalence between `dplyr` and SQL queries, and how R translates one into the other.
  * Gain familiarity with techniques that help you explore a database and verify its documentation.
  * Gain familiarity with the standard metadata that a SQL database contains to describe its own contents.
  * Understand some advanced SQL techniques.
  * Gain some understanding of techniques for assessing query structure and performance.
* Docker related
  * Set up a PostgreSQL database in a Docker environment. 
  * Gain familiarity with the various ways of interacting with the Docker and PostgreSQL environments
  * Understand enough about Docker to swap databases, e.g. [Sports DB](http://www.sportsdb.org/sd/samples) for the [DVD rental database](http://www.postgresqltutorial.com/postgresql-sample-database/) used in this tutorial. Or swap the database management system (DBMS), e.g. [MySQL](https://www.mysql.com/) for [PostgreSQL](https://www.postgresql.org/).


### R Packages

These R packages are discussed or used in exercises:

* [DBI](https://cran.r-project.org/package=DBI)
* [dbplyr](https://cran.r-project.org/package=dbplyr)
* [devtools](https://cran.r-project.org/package=devtools)
* [downloader](https://cran.r-project.org/package=downloader)
* [glue](https://cran.r-project.org/package=glue)
* [gt](https://cran.r-project.org/package=gt)
* [here](https://cran.r-project.org/package=here)
* [knitr](https://cran.r-project.org/package=knitr)
* [RPostgres](https://cran.r-project.org/package=RPostgres)
* [skimr](https://cran.r-project.org/package=skimr)
* [sqlpetr](https://github.com/smithjd/sqlpetr) (installs with: `remotes::install_github("smithjd/sqlpetr", force = TRUE, quiet = TRUE, build = TRUE, build_opts = "")`)
* [tidyverse](https://cran.r-project.org/package=tidyverse)

In addition, these are used to render the book:
* [bookdown](https://cran.r-project.org/package=bookdown)
* [DiagrammeR](https://cran.r-project.org/package=DiagrammeR)

## Adventure Works

In this book we have adopted the Microsoft Adventure Works online transaction processing database for our examples.  It is 

https://docs.microsoft.com/en-us/previous-versions/sql/sql-server-2008/ms124438(v=sql.100) 

See Sections 3 and 4

Journal of Information Systems Education, Vol. 26(3) Summer 2015. “_Teaching Tip Active Learning via a Sample Database: The Case of Microsoft’s Adventure Works_” by Michel Mitri

http://jise.org/Volume26/n3/JISEv26n3p177.pdf

See the [AdventureWorks Data Dictionary](https://docs.microsoft.com/en-us/previous-versions/sql/sql-server-2008/ms124438%28v%3dsql.100%29) and a sample table ([employee](https://docs.microsoft.com/en-us/previous-versions/sql/sql-server-2008/ms124432(v=sql.100))).

Here is a (link to an ERD diagram)[https://i.stack.imgur.com/LMu4W.gif]

