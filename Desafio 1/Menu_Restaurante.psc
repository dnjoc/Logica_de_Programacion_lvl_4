SubProceso solicitar_datos(cant, precio_platos_menu Por Referencia, nombre_platos_menu Por Referencia, acum_precio Por Referencia)
	Definir i Como Entero
	acum_precio=0
	para i=1 Hasta cant
		Mostrar "Como se llama el plato " i " del menu?"
		Leer nombre_platos_menu[i]
		Mostrar "Cual es el valor del plato " i
		Leer precio_platos_menu[i]
		acum_precio=acum_precio+precio_platos_menu[i]
	FinPara
FinSubProceso

SubProceso ingresar_cantidad_arreglo(cant Por Referencia) 
	Repetir
		Mostrar "Ingrese la cantidad de platos del menu: "
		Leer cant
		Mostrar " "
	Hasta Que cant>0

FinSubProceso

SubProceso mostrar_plato_seleccionado(nombre_platos_menu, precio_platos_menu, cant, num Por Referencia)
	Definir correct Como Logico
	correct=falso
	repetir
		mostrar "Seleccione un numero entre 1 y " cant " para mostrar el nombre y precio del plato del menu"
		leer num
		
		Si	num>0 y num<=cant Entonces
			Mostrar "El nombre del plato numero " num " es " nombre_platos_menu[num]
			Mostrar "El precio del plato numero " num " es " precio_platos_menu[num]
			correct=Verdadero
		SiNo
			Mostrar "Ingrese un numero correcto entre 1 y " cant
		FinSi
	Hasta Que correct=Verdadero

	

FinSubProceso

SubProceso mostrar_mayor_y_menor(cant, nombre_platos_menu, precio_platos_menu, mayor_precio Por Referencia, menor_precio Por Referencia)
	Definir i, num_mayor, num_menor Como Entero
	mayor_precio=0
	menor_precio=1000
	Para i=1 Hasta cant
		si precio_platos_menu[i]>mayor_precio Entonces
			mayor_precio=precio_platos_menu[i]
			num_mayor=i
		FinSi
		si precio_platos_menu[i]<menor_precio Entonces
			menor_precio=precio_platos_menu[i]
			num_menor=i
		FinSi
	FinPara
	Mostrar "El plato con mayor precio es: " nombre_platos_menu[num_mayor]
	Mostrar "Y el precio es: " mayor_precio
	Mostrar " "
	Mostrar "El plato con menor precio es: " nombre_platos_menu[num_menor]
	Mostrar "Y el precio es: " menor_precio
	Mostrar " "
FinSubProceso

SubProceso mostrar_menu(opc Por Referencia)
	Mostrar " "
	Mostrar "Menu para ingresar datos de platos, para almuerzo, en venta en el restaurante"
	Mostrar " "
	Mostrar "1) Ingresar nombre de platos y sus precios"
	Mostrar "2) Mostrar precio menor y mayor de los platos"
	Mostrar "3) Mostrar el menu de platos completo"
	Mostrar "4) Mostrar promedio de precios de los platos y platos con precio mayor al promedio"
	Mostrar "5) Buscar nombre y precio de platos del menu"
	Mostrar "6) Salir"
	Mostrar "Seleccione una opción"
	leer opc
	
FinSubProceso

SubProceso lista_menu_completo(cant, nombre_platos_menu, precio_platos_menu)
	Definir i Como Entero
	Mostrar "Platos del Menu"
	Mostrar " "
	Para i=1 Hasta cant Hacer
		Mostrar "El plato numero " i " es " nombre_platos_menu[i] " y el precio del plato es " precio_platos_menu[i]
		Mostrar " "
	FinPara
FinSubProceso

SubProceso prom_platos(nombre_platos_menu, precio_platos_menu, acum_precio, cant)
	Definir promedio_precios Como Real
	promedio_precios=calcular_prom(acum_precio,cant)
	Mostrar "El promedio de Precios de los platos del menu es: " promedio_precios
	Mostrar " "
	Mostrar "Los platos con precio mayor al promedio son: " 
	Para i=1 Hasta cant
		si	precio_platos_menu[i]>promedio_precios Entonces
			Mostrar " "
			Mostrar "El plato numero: " i " nombre: " nombre_platos_menu[i] " precio: " precio_platos_menu[i]
			Mostrar " "
		FinSi
	FinPara
FinSubProceso

funcion promedio=calcular_prom(acumulador,contador)
	promedio=acumulador/contador
FinFuncion


Algoritmo Menu_Restaurante
	Definir cant, num, opc Como Entero
	Definir acum_precio, mayor_precio, menor_precio Como Real
	ingresar_cantidad_arreglo(cant) 
	Dimension precio_platos_menu[cant]
	Dimension nombre_platos_menu[cant]
	Repetir
		mostrar_menu(opc)		
		Segun opc
			1: solicitar_datos(cant, precio_platos_menu, nombre_platos_menu, acum_precio)
			2: mostrar_mayor_y_menor(cant, nombre_platos_menu, precio_platos_menu, mayor_precio, menor_precio)
			3: lista_menu_completo(cant, nombre_platos_menu, precio_platos_menu)
			4: prom_platos(nombre_platos_menu, precio_platos_menu, acum_precio, cant)
			5: mostrar_plato_seleccionado(nombre_platos_menu, precio_platos_menu, cant, num)
			6: Limpiar Pantalla
				Esperar 2 Segundos
				mostrar "Hasta Luego"
				Mostrar " "
			De Otro Modo:
				Mostrar "Seleccione una opcion valida"
		FinSegun
	Hasta Que opc=6
	
FinAlgoritmo
