#!/usr/bin/perl

# fichero original
# 	NASDAQ_daily_prices_subset.csv
#
# formato
# 	exchange,stock_symbol,date,stock_price_open,stock_price_high,stock_price_low,stock_price_close,stock_volume,stock_price_adj_close
#	0,1,2,3,4,5,6,7,8 -> En total son 9 variables las que manejamos
#       NASDAQ,DELL,1997-08-26,83.87,84.75,82.50,82.81,48736000,10.35

while (<STDIN>) {
	chomp();
	@a=split(",");
	$b=$a[2];
	$c=`date '+%s' -d '$b'`*1000;  
#milisegundos, cogido de linux
# '+%s' es una marca de formato, seconds since 1970-01-01 00:00:00 UTC
# -d se refiere a que en vez de "ahora" coge el string $b
#  

	if ($ARGV[0] eq "RK=emp") {
		printf "%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\n",$a[1],$a[3],$a[4],$a[5],$a[6],$a[7],$a[8],$c;
# DCTH	3.08	3.22	3.00	3.10	77400	3.10	1118646000000
#  Siempre pensar por qué un modelo y no otro... requisitos de performance, de tipo de queries, de tipo de estadísticas..
# aunque siempre es posible encontrar varias metricas que sean aceptables
# RK empresa, CF la metrica, Q o bien price o bien totals y la version el timestamp
# 
	} elsif ($ARGV[0] eq "RK=empUpd") {
		printf "%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\n",$a[1],$a[3],$a[4],$a[5],$a[6],$a[7],$a[8],$c+60000;
# DXYN	6.38	6.44	6.19	6.25	211100	6.25	911980860000
	} elsif ($ARGV[0] eq "RK=empresa/TS") {
		printf "%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\n",$a[1]."/".$a[2],$a[3],$a[4],$a[5],$a[6],$a[7],$a[8],$c;
# DORM/1997-02-07	7.88	7.88	7.63	7.75	7400	3.87	855302400000
	} elsif ($ARGV[0] eq "RK=empresa/TS-2") {
		printf "%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\n",$a[1]."/".$a[2],$a[3],$a[4],$a[5],$a[6],$a[7],$a[8],$c;
	} elsif ($ARGV[0] eq "RK=metrica/TS") {
		$d=9223372036854775807-$c;
		printf "%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\n","open  /".$d,$a[1],$a[3],$c;
		printf "%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\n","high  /".$d,$a[1],$a[4],$c;
		printf "%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\n","low   /".$d,$a[1],$a[5],$c;
		printf "%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\n","close /".$d,$a[1],$a[6],$c;
		printf "%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\n","volume/".$d,$a[1],$a[7],$c;
		printf "%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\n","adj   /".$d,$a[1],$a[8],$c;
# close /9223371164275975807	DELL	82.81	872578800000
	} elsif ($ARGV[0] eq "RK=empresa/metrica/TS") {
		printf "%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\n",$a[1]."/open  /".$a[2],$a[3],$c;
		printf "%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\n",$a[1]."/high  /".$a[2],$a[4],$c;
		printf "%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\n",$a[1]."/low   /".$a[2],$a[5],$c;
		printf "%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\n",$a[1]."/close /".$a[2],$a[6],$c;
		printf "%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\n",$a[1]."/volume/".$a[2],$a[7],$c;
		printf "%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\n",$a[1]."/adj   /".$a[2],$a[8],$c;
# DELL/low   /1997-08-26	82.50	872578800000...

	} else {
		die("Opción no reconocida");
	}
}
