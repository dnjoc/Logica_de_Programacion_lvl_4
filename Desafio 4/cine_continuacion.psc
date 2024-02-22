Funcion valor_valido = Func_Validar_Entero(Mensaje)
	Definir cad_caracteres, carac_i Como Caracter
	Definir caracterEsNumero Como Logico
	Definir i, Long_cadena Como Entero
	
	Repetir
		Mostrar Mensaje Sin Saltar
		Leer cad_caracteres
		Long_cadena = Longitud(cad_caracteres)
		i=1
		Repetir
			carac_i = Subcadena(cad_caracteres,i,i)
			caracterEsNumero = Funcion_Validar_Caracter_Numerico(carac_i)
			si caracterEsNumero Entonces
				i=i+1
			FinSi
		Mientras Que (i<=Long_cadena y caracterEsNumero)
		si no caracterEsNumero Entonces
			Mostrar "Valor no Valido... Intente de nuevo"
			Mostrar ""
		FinSi
	Hasta Que caracterEsNumero
	valor_valido = ConvertirANumero(cad_caracteres)
FinFuncion

Funcion es_numero= Funcion_Validar_Caracter_Numerico(caract)
	Definir caracteres_numericos, carac_num Como Caracter
	Definir Long_carac_nums, i Como Entero

	caracteres_numericos = "0123456789"
	Long_carac_nums = Longitud(caracteres_numericos)
	i=1
	Repetir
		carac_num = Subcadena(caracteres_numericos,i,i)
		es_numero = (caract = carac_num)
		i=i+1
	Hasta Que (es_numero o i> Long_carac_nums)
FinFuncion

SubProceso leer_nombre(n, nombre_pelic Por Referencia)
	Definir nom_pel Como Caracter
	Mostrar "Ingrese el nombre de la pelicula"
	para i=1 hasta n Hacer
		nom_pel=leer_texto("Nombre", n)
		nombre_pelic[i]=nom_pel
	FinPara
FinSubProceso

SubProceso buscar_en_arreglo(n, nombre_pelic, entradas_vendidas, monto_total_venta )
	Definir buscado Como Caracter
	Definir encontro Como Entero
	Definir si_buscado Como Logico
	Definir i Como Entero
	si_buscado=Falso
	
		Repetir
			Mostrar "Ingrese la pelicula a buscar"
			Leer buscado
			si buscado<>""
				Entonces
				encontro=buscar_arreglo(n, nombre_pelic, buscado)
				si	encontro <= n y encontro > 0 Entonces
					si_buscado=Verdadero
					Mostrar "Nombre de pelicula encontrado"
					Mostrar "La cantidad de entradas vendidas fue: " entradas_vendidas[encontro]
					Mostrar "El precio total de ventas de la pelicula fue: " monto_total_venta[encontro] "$"
				SiNo
					Mostrar "Pelicula no encontrada"
				FinSi
			SiNo
				mostrar "El campo buscado no puede estar vacio"
			FinSi
		Hasta Que si_buscado=Verdadero

FinSubProceso

Funcion si_existe=buscar_arreglo(n, arreglo, dato)
	Definir si_existe Como Entero
	buscarenar=Falso
	i=1
	Repetir
		si (arreglo[i]=dato) Entonces
			buscarenar=Verdadero
			si_existe=i
		SiNo
			i=i+1
		FinSi
	Hasta Que buscarenar=Verdadero o i>n
FinFuncion

SubProceso ingresar_capacidad_sala(n, capacidad_salas Por Referencia)
	Mostrar "Ingresar el numero de capacidad de la sala donde se proyecta la pelicula"
	Para i=1 Hasta n Hacer
		cap=Func_Validar_Entero("Numero de capacidad de la sala")
		capacidad_salas[i]= cap
	FinPara
FinSubProceso

SubProceso mostrar_lista_cine(n, nombre_pelic, capacidad_salas, entradas_vendidas, monto_total_venta Por Referencia)
	Definir acum_monto_entradas Como Real
	Definir i, j Como Entero
	acum_monto_entradas=0
	Para j=1 hasta n Hacer
		monto_total_venta[j]=calcular_monto(entradas_vendidas[j], 3.5)
		acum_monto_entradas=acum_monto_entradas+monto_total_venta[j]
	FinPara
	Para i=1 Hasta n Hacer
		Mostrar " "
		Mostrar "Pelicula en la posicion " i " es: " nombre_pelic[i]
		Mostrar "Capacidad de la sala es: "  capacidad_salas[i] " asientos"
		Mostrar "Cantidad entradas vendidas es: " entradas_vendidas[i]
		Mostrar "La cantidad total de la venta de la pelicula es: " monto_total_venta[i] "$"
	FinPara
	Mostrar " "
	Mostrar "El monto total de entradas vendidas en el cine fue: " acum_monto_entradas "$"
FinSubProceso

Funcion numer=num_rango(min, max, dato)
	Repetir
		Mostrar "Ingrese el " dato
		Leer numer
		si no (numer>=min y numer<=max) Entonces
			Mostrar "El " dato " debe estar en el rango de " min "-" max
		FinSi
		
	Hasta Que numer>=min y numer<=max
FinFuncion

SubProceso solicitar_cantidad_entradas(n, nombre_pelic, capacidad_salas, entradas_vendidas Por Referencia)
	Mostrar "Ingresar la cantidad de entradas vendidas"
	para i=1 hasta n Hacer
		sala=num_rango(2, capacidad_salas[i], "Numero de Entradas vendidas")
		entradas_vendidas[i]=sala
	FinPara
	
	
FinSubProceso

Funcion multip=calcular_monto(contador, monto)
	multip=contador*monto
FinFuncion

Funcion text=leer_texto(dato, n)
	Definir text Como Caracter
	Definir long Como Entero
	long=Longitud(text)
	Repetir
		Mostrar "Ingrese el " dato "de la Pelicula"
		Leer text
		si no Longitud(text)>=n Entonces
			Mostrar "El " dato " debe tener por lo menos " n " caracteres"
		FinSi
		si validar_caracter(text) Entonces
			Mostrar "No debe tener caracteres especiales"
		FinSi
	Hasta Que Longitud(text)>=n y  validar_caracter(text)=Falso
FinFuncion

Funcion encontrado=validar_caracter(caracter_)
	carac="*/-_:;,.!#$%&/()=+?¡¿"
	lon_cart= Longitud(caracter_)
	longit_busqueda= Longitud(carac)
	encontrado=falso
	i=1
	
	Repetir
		carter=Subcadena(carac,i,i)
		j=1
		Repetir
			buscarc=Subcadena(caracter_,j,j)
			si carter=buscarc Entonces
				valorD=valorD+1
			FinSi
			j=j+1
		Hasta Que j>lon_cart o encontrado 
		
		i=i+1
	Hasta Que i> longit_busqueda
	si valorD> 0 Entonces
		encontrado=Verdadero
	FinSi
FinFuncion

SubProceso mostrar_menu(opc Por Referencia)
	Mostrar " "
	Mostrar "Menu para ingresar datos del cine"
	Mostrar " "
	Mostrar "1) Ingresar nombre de la pelicula"
	Mostrar "2) Ingresar la capacidad de la sala"
	Mostrar "3) Ingresar la cantidad de entradas vendidas"
	Mostrar "4) Mostrar listado de peliculas, salas del cine y otra informacion"
	Mostrar "5) Buscar pelicula registrada"
	Mostrar "6) Salir"
	Mostrar "Seleccione una opción"
	leer opc
FinSubProceso

Algoritmo cine_continuacion
	Definir n Como Entero
	n=5
	
	Dimension nombre_pelic[n]
	Dimension capacidad_salas[n]
	Dimension entradas_vendidas[n]
	Dimension monto_total_venta[n]
	
	Repetir
		mostrar_menu(opc)		
		Segun opc
			1: leer_nombre(n, nombre_pelic)
			2: ingresar_capacidad_sala(n, capacidad_salas)
			3: solicitar_cantidad_entradas(n, nombre_pelic, capacidad_salas, entradas_vendidas)
			4: mostrar_lista_cine(n, nombre_pelic, capacidad_salas, entradas_vendidas, monto_total_venta)
			5: buscar_en_arreglo(n, nombre_pelic, entradas_vendidas, monto_total_venta)
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
