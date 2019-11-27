*! Stata-Syntax for outdat.ado 1.2 
* Change-log
* ----------
* Version 0.2: Second draft
version 7.0
capture  program drop arudata
program define arudata
syntax anything [, PASS(integer 5)]
quietly {
preserve
import delimited using https://udata-aru.github.io/img/pass.csv, delimiter(";") clear
gen aux=(pass==`pass')
total aux
mat A=r(table)
global aux=A[1,1]
restore
}
	if $aux != 0 {
quietly {
	clear *
	import delimited using http://aru2.ddns.net:8080/datumARU/eh/`anything'.csv, delimiter(";")
	do http://aru2.ddns.net:8080/datumARU/eh/`anything'.do
	label data `anything'
	note: Repositorio de Fundación Aru
}
} 
else {
display in red "Contraseña incorrecta o ausente, introduzca la contraseña con la opción pass()"
	}
end
exit
Alvaro Chirino
University of San Andres
faculty of mathematics and natural sciences
