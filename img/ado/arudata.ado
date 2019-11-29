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
		qui {
		preserve
		sysuse indexaru, clear
		gen aux=id=="`anything'"
		keep if aux==1
		local NN=_N
		restore
		}
		if `NN'==1{
		quietly {
			clear *
			import delimited using http://aru2.ddns.net:8080/datumARU/data/`anything'.csv, delimiter(";")
			do http://aru2.ddns.net:8080/datumARU/do/`anything'.do
			label data `anything'
			note: Repositorio de Fundación Aru
			display in red "Base de datos cargada con exito..."
			display in red "Investigación de Calidad, Políticas Basadas en evidencia, Fundación Aru"
			}
		}
		else {
		display in red "Identificador de la base de datos incorrecto, revise con <<sysuse indexaru>> las bases disponibles"
		}
	 }
else {
display in red "Contraseña incorrecta o ausente, introduzca la contraseña con la opción pass()"
	}
end
exit
Alvaro Chirino
University of San Andres
Faculty of Mathematics and Natural Sciences
