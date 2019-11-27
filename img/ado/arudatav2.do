*! Stata-Syntax for outdat.ado 1.2 
* Change-log
* ----------
* Version 0.1: First draft
version 7.0
capture  program drop arudata1
program define arudata1
syntax anything [, PASS(integer 5)]
preserve
quietly {
import delimited using http://aru2.ddns.net:8080/datumARU/eh/`anything'.csv, delimiter(";")
}
restore
	if `pass'==1234 {
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
