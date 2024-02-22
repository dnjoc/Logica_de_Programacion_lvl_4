SubProceso ingresas_tamanio(n Por Referencia)
	Repetir
		Mostrar "Para registrar la información de las ventas,"
		Mostrar "por favor, ingrese la cantidad de equipos a registrar: "
		Leer n
	Hasta Que n>0
FinSubProceso

Funcion promedio=calcular_prom(acumulador,contador)
	promedio=acumulador/contador
FinFuncion

SubProceso buscar_en_arreglo(n, nombre_electrodomesticos, articulo Por Referencia)
		Mostrar "Cual es el nombre del electrodomestico que busca?"
		Leer articulo
		Mostrar mostrar_busqueda(n, nombre_electrodomesticos, articulo)
FinSubProceso

Funcion busqueda=mostrar_busqueda(n, nombre_electrodomesticos, dato)
	Definir encontrado Como Logico
	Definir i Como Entero
	encontrado=Falso
	i=1
	Repetir
		//Mostrar "Ingrese nombre"
		//Leer articulo
		//para i=1 hasta n
			si nombre_electrodomesticos[i]=dato Entonces 
				encontrado=Verdadero
				Limpiar Pantalla
				Mostrar "El electrodoméstico " dato " está registrado"
			SiNo
				i=i+1
			FinSi
		//FinPara
	Hasta Que encontrado=Verdadero o i>n
FinFuncion

SubProceso procesar_promedio(n, precio_elec)
	Definir i Como Entero
	Definir acum, prom_precios Como Real
	acum=0
	para i=1 hasta n
		acum=acum+precio_elec[i]
	FinPara
	
	prom_precios=calcular_prom(acum,n)
	Mostrar " "
	Mostrar "El promedio de los precios de los articulos es: " prom_precios
	Mostrar " "
	
FinSubProceso

SubProceso mostrar_menu(opc Por Referencia)
	Mostrar " "
	Mostrar "Menu para ingresar datos de las ventas"
	Mostrar " "
	Mostrar "1) Ingresar nombre, precio y cantidad vendida"
	Mostrar "2) Mostrar el promedio de precios de los articulos"
	Mostrar "3) Buscar por nombre un electrodomestico"
	Mostrar "4) Mostrar listado con nombre y monto de venta ingresado por articulo"
	Mostrar "5) Mostrar monto total ingresado por la empresa"
	Mostrar "6) Salir"
	Mostrar "Seleccione una opción"
	leer opc
FinSubProceso

SubProceso ingresar_datos(n, nombre_electrodomesticos Por Referencia, precio_elec Por Referencia, cantidad_vendida Por Referencia)
	Definir i Como Entero
	Esperar 1 Segundos
	Limpiar Pantalla
	Para i=1 Hasta n
		Mostrar "Cual es el nombre del electrodomestico " i "?"
		Leer nombre_electrodomesticos[i]
		Mostrar "Cual es el precio del articulo " i "?"
		precio_elec[i]=leer_calculorango(100,1000,"el precio")
		cantidad_vendida[i]=leer_calculorango(0,20,"la cantidad")
	FinPara
FinSubProceso

Funcion num_calculo=leer_calculorango(min, max, dato)
	Repetir
		Mostrar "Ingrese " dato
		leer num_calculo
		si no (num_calculo>=min y num_calculo<=max) Entonces
			Mostrar dato " no es valido, debe ser entre " min " y " max
		FinSi
	Hasta Que num_calculo>=min y num_calculo<=max
	
FinFuncion

SubProceso mostrar_listado_totales(n, cantidad_vendida, precio_elec, nombre_electrodomesticos, monto_venta Por Referencia, acum_ventas Por Referencia)
	Definir i, j Como Entero
	acum_ventas=0
	para i=1 hasta n
		monto_venta[i]=cantidad_vendida[i]*precio_elec[i]
		acum_ventas=acum_ventas+monto_venta[i]
	FinPara
	Para j=1 hasta n
		Mostrar " "
		Mostrar "El nombre del electrodomestico " j " es: " nombre_electrodomesticos[j]
		Mostrar "El monto de la venta es: " monto_venta[j]
	FinPara
	
FinSubProceso

SubProceso ver_monto_total(acum_ventas)
	Mostrar " "
	Mostrar "El monto total ingresado por la empresa es: " acum_ventas
FinSubProceso

Algoritmo Venta_Electrodomesticos
	Definir n Como Entero
	Definir articulo Como Caracter
	Definir acum_ventas Como Real
	
	ingresas_tamanio(n)
	Dimension nombre_electrodomesticos[n]
	Dimension precio_elec[n]	
	Dimension cantidad_vendida[n]
	Dimension monto_venta[n]
	Esperar 2 Segundos
	Limpiar Pantalla
	Repetir
		mostrar_menu(opc)		
		Segun opc
			1: ingresar_datos(n, nombre_electrodomesticos, precio_elec, cantidad_vendida)
			2: procesar_promedio(n, precio_elec)
			3: buscar_en_arreglo(n, nombre_electrodomesticos, articulo)
			4: mostrar_listado_totales(n, cantidad_vendida, precio_elec, nombre_electrodomesticos, monto_venta, acum_ventas)
			5: ver_monto_total(acum_ventas)
			6: Limpiar Pantalla
				Esperar 1 Segundos
				mostrar "Hasta Luego"
				Mostrar " "
			De Otro Modo:
				Limpiar Pantalla
				Mostrar "Seleccione una opcion valida"
		FinSegun
	Hasta Que opc=6
	
FinAlgoritmo
