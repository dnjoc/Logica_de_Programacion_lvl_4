SubProceso solicitar_numero_sala(sala Por Referencia)
	Mostrar "Para ingresar la informacion del cine"
	Mostrar "Por favor, ingrese los datos solicitados a continuacion"
	//Mostrar "Ingrese el numero de la sala"
   //Leer numer
	sala=num_rango(1, 8, "numero de la sala")
	//Mostrar "El numero de sala " sala " esta disponible"
FinSubProceso

Funcion numer=num_rango(min, max, dato)
	//Esperar 3 Segundos
	//Limpiar Pantalla
	Repetir
		Mostrar "Ingrese el " dato
		Leer numer
		si no (numer>=min y numer<=max) Entonces
			Mostrar "El " dato " debe estar en el rango de " min "-" max
		FinSi
	Hasta Que numer>=min y numer<=max
FinFuncion

Funcion caract_er=verificar_cont(un_caracter)
	caract_buscado="ABC"
	long_caract=Longitud(caract_buscado)
	caract_er=Falso
	i=1
	Repetir
		sub_caract=Subcadena(caract_buscado,i,i)
		caract_er=Mayusculas(un_caracter)=sub_caract
		i=i+1
	Hasta Que caract_er=Verdadero o i>long_caract 
FinFuncion

Funcion num_car=verificar_num2(un_caracter)
	caract_buscado="0123456789"
	long_caract=Longitud(caract_buscado)
	num_car=Falso
	i=1
	Repetir
		sub_caract=Subcadena(caract_buscado,i,i)
		num_car=un_caracter=sub_caract
		i=i+1
	Hasta Que num_car=Verdadero o i>long_caract 
FinFuncion

Funcion text=leer_text(dato, cant)
	Definir text Como Caracter
	Repetir
		Mostrar "Ingrese " dato
		Leer text
		si no Longitud(text)=cant Entonces
			Mostrar dato " debe tener " cant " caracteres"
		FinSi
		si no verificar_cont(Subcadena(text,1,1)) Entonces
			Mostrar "El codigo de la pelicula debe comenzar con una letra A, B o C"
		FinSi
		si no Subcadena(text,2,2)="-" Entonces
			Mostrar "El codigo de la pelicula debe tener un (- guion) entre la primera letra y el numero final"
		FinSi
		si no verificar_num2(Subcadena(text,3,3)) Entonces
			Mostrar "El codigo de la pelicula debe terminar en un numero entre 0-9"
		FinSi
		//si no (Subcadena(text,3,3)>=0 y Subcadena(text,3,3)<=9) Entonces
			
		//FinSi
	Hasta Que (Longitud(text)=cant y verificar_cont(Subcadena(text,1,1)) y Subcadena(text,2,2)="-" y verificar_num2(Subcadena(text,3,3)))
	
FinFuncion

SubProceso solicitar_asientos(num_asientos Por Referencia, cant_ventas Por Referencia)
	Mostrar "Ingrese la cantidad de asientos disponibles en la sala"
	num_asientos=num_rango(60, 150, "numero de asientos")
	Mostrar "Ingrese la cantidad de asientos vendidos"
	cant_ventas=num_rango(0, num_asientos, "numero de ventas")
FinSubProceso

SubProceso mostrar_totales(cod, sala, num_asientos, cant_ventas)
	Definir venta, porcent Como Real
	venta=calcular_monto(cant_ventas,3.5) 
	porcent=calcular_prom(cant_ventas,num_asientos)
	Mostrar "El monto en $ generado por la pelicula " Mayusculas(cod) " de la sala #" sala " fue: " venta "$"
	Mostrar " "
	Mostrar "El porcentaje de ocupacion de la sala fue: " porcent "%"
	Mostrar " "
FinSubProceso

Funcion multip=calcular_monto(contador, monto)
	multip=contador*monto
FinFuncion

Funcion promedio=calcular_prom(acumulador,contador)
	promedio=acumulador/contador*100
FinFuncion

SubProceso solicitar_cod_pelicula(cod Por Referencia)
	Mostrar "Ingrese el codigo de la pelicula"
	cod=leer_text("codigo", 3)
FinSubProceso

Algoritmo Cine
	Definir cod Como Caracter
	Definir sala, num_asientos, cant_ventas Como Entero
	solicitar_numero_sala(sala)
	solicitar_cod_pelicula(cod)
	Esperar 3 Segundos
	Limpiar Pantalla
	solicitar_asientos(num_asientos, cant_ventas)
	mostrar_totales(cod, sala, num_asientos, cant_ventas)
FinAlgoritmo
