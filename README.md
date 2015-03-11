# HBASE-U-Tad
Las prácticas que hicimos en el curso

We did some training for understanding the basic use of HBASE

We create a table called "m3" with 6 Column families to store our data.
open -> open share price in the stock market
close -> close share price in the stock market
high -> highes price during the day
volume -> to store the total market volume during the day

All of them are limited to 300 versions, let's say it is t consider a whole year

create 'm3', 
{NAME => 'open', VERSIONS => 300, COMPRESSION => 'gz'}, 
{NAME => 'close', VERSIONS => 300, COMPRESSION => 'gz'}, 
{NAME => 'high', VERSIONS => 300, COMPRESSION => 'gz'}, 
{NAME => 'low', VERSIONS => 300, COMPRESSION => 'gz'}, 
{NAME => 'volume', VERSIONS => 300, COMPRESSION => 'gz'}, 
{NAME => 'adj', VERSIONS => 300, COMPRESSION => 'gz'}
