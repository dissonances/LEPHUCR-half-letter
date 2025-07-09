# [Guía para la corrección de documentos con LaTeX y todonotes – Telegraph](https://telegra.ph/Gu%C3%ADa-para-la-correcci%C3%B3n-de-documentos-con-LaTeX-y-todonotes-10-21)
Aradnix  

*Esta es una breve guía para poder resolver notas de correcciones y tareas pendientes hechas en un flujo de trabajo con LaTeX mediante el paquete* [todonotes](https://ctan.org/pkg/todonotes) *que es la base para llevar el registro de cambios en el documento.*

### Generalidades ###

La entrada para LaTeX es un archivo de texto plano. Puede crearse con cualquier editor de texto. Contiene el texto del documento, así como las marcas u órdenes que dirán a LaTeX cómo componer el texto.

#### Marcas ####

Como todo lenguaje de marcado LaTeX cuenta con un sistema de marcas (etiquetas o comandos) que funciona a grandes rasgos de la siguiente manera:

```
\marca[opción1,opción2,opción3...opciónm]{argumento1}{argumento2}{argumento3}...{argumenton}

```

Hay que destacar que toda marca en LaTeX comienza con una antibarra (también llamada contrabarra) \\, seguido por el nombre de la marca (generalmente en inglés), entre corchetes las opciones (de haberlas), separadas por comas y **sin** espacio entre ellas, y luego entre llaves el argumento al que se le aplica la marca.

Es importante enfatizar que para evitar errores de compilación en LaTeX, cuando insertamos marcas **no debe haber espacio en blanco desde la antibarra hasta la última llave de cierre del último argumento**.

También es cierto que no todas las marcas tienen opciones y hay veces cuando tampoco cuentan con argumentos explícitos en que, si no se cierran con una antibarra al final o con un par de llaves vacías, el espacio en blanco que las separa de la siguiente palabra puede desaparecer en el documento. Por ejemplo, marcas como \\ldots{} (para añadir puntos suspensivos) o \\LaTeX{} (para insertar el logo de LaTeX) son muestra de ello.

#### Entornos ####

Generalmente LaTeX lo que hace es tomar el texto que encuentra a su paso y formarlo como texto corrido. Cuando queremos un comportamiento distinto, debemos recurrir a los ambientes o entornos. La sintaxis básica en todos estos casos es la siguiente

```
\begin{entorno}[opciones]{argumentos}
 .
 .
 .   
\end{entorno}

```

donde podemos tener argumentos y opciones del entorno que se agregan inmediatamente después de abrir el entorno, pero no al cerrarlo.

#### Jerarquía ####

Así como en markdown se usa el signo de gato o almohadilla (#) para marcar los títulos o encabezados de un documento en función de su jerarquía, en LaTeX existe un grupo de marcas equivalente, en el caso de un libro serían:

```
\chapter{}        #
\section{}        ##
\subsection{}     ###
\subsubsection{}  ####
\paragraph{}      #####
\subparagraph{}   ######

```

Existe adicionalmente otra marca de nivel superior a \\chapter{} que se puede usar en ciertos casos y es \\part{}. Tal vez estas nociones generales sean suficientes para poder entender lo que necesitamos para trabajar con LaTeX y poder resolver las notas y observaciones hechas.

### Overleaf  ###

#### Te sugiero omitir toda esta sección relacionada con Overleaf (y pasar a la siguiente) ya que el mes pasado cambió sus condiciones de uso y restringió el tiempo de compilación de las cuentas gratuitas a 60 segundos, tiempo que en una instalación local es más que suficiente para un proyecto como este; no así en Overleaf que nunca se ha caracterizado por compilar rápidamente (aunque desde la adquisición de su competidor ShareLaTeX concretada en 2018, mejoró en ese rubro). De este modo Overleaf obliga a sus usuarios a pagar por el servicio o limitarse a documentos muy breves y sin imágenes. ####

[Overleaf](https://es.overleaf.com/) es una solución del tipo SaaS (Software as a Service) que nos ofrece una instalación completa y funcional de LaTeX en la nube accesible desde el navegador.

![](media/36d0654084b8d173be874.png)Esta es la página de inicio de Overleaf.

Para acceder es necesario registrarse y crearse una cuenta, se puede hacer vinculando alguna cuenta existente de entre las opciones que ofrece, o bien con una cuenta de correo diferente y que no esté enlistada, es gratis:

![](media/d952cf48499db799dfc12.png)Pantalla de registro de Overleaf.

Una vez hecho lo anterior podremos acceder a una pantalla con nuestros proyectos, tanto propios como compartidos.

![](media/5cdc405d54bd9c60f87d7.png)Esta es la vista de proyectos, con el tiempo se puede ver así

El proyecto que compete es el siguiente al que se puede acceder mediante este [enlace](https://es.overleaf.com/8967264725dkjgphgnrkvv).

Una vez dentro veremos una pantalla como la que se muestra a continuación:

![](media/d4cc91e05ec30af6429ed.png)Vista del proyecto abierto en Overleaf.

En la barra superior, del lado izquierdo podemos ver un menú que nos permite configurar Overleaf al gusto en tema, atajos de algún tipo (aunque los atajos pueden interferir con los del navegador), compilador, versión de TeXlive que usamos, etc.

En el extremo izquierdo tenemos un control de cambios muy básico, opción de compartir el proyecto con más gente, acceso al historial y un chat. Admito que no he usado nada de eso pero puede ser útil y por eso lo comento.

![](media/dd85c40eb6bc375ddec61.png)Barras de herramientas de Overleaf

Inmediatamente debajo tenemos una segunda barra con algunos íconos a la izquierda para poder desplazarnos en diferentes niveles dentro del proyecto, añadir archivos nuevos, renombrarlos y borrarlos. Todo ello está dentro de la estructura del proyecto inmediatamente debajo de dichos íconos.

Del lado del editor tenemos un switch que nos permite ver el código fuente y un formato en texto enriquecido. Sinceramente nunca le he visto utilidad al texto enriquecido, siento que entorpece todo intentando darle formato al código de una forma deficiente.

Del lado del visor tenemos el botón de compilación, los logs que se generan (útiles en caso de errores) y un ícono para descargar el PDF generado, así como los íconos que maximizan ya sea el editor o el visor de documento.

Debajo de las barras arriba descritas Overleaf nos muestra 3 áreas en que se divide la página y que se muestran a continuación:

![](media/36e39d44fc7f4d4e164b1.png)Área de trabajo de Overleaf.

Del lado izquierdo se pueden ver la estructura del proyecto con sus carpetas que a su vez pueden desplegar las carpetas o archivos que incluyen. En la parte de abajo se puede mostrar el esquema del archivo en caso de que contenga varias etiquetas a objetos tales como apartados, figuras, tablas, etc.

En medio está el editor donde se trabaja y se hacen las modificaciones pertinentes. Finalmente a la derecha puedes ver como luce el documento impreso. Entre el editor y el visor puedes ve que hay 2 iconos de flecha, uno apuntando a la derecha y abajo otro apuntando a la izquierda. Estos íconos son muy útiles porque nos permiten ir del editor al PDF fácilmente. Por ejemplo, si situamos el cursor del editor donde dice Bloom, el ícono de la flecha que apunta hacia la derecha (hacia el PDF) nos va a llevar justo a la parte del documento donde aparece la palabra, y viceversa, podemos elegir alguna palabra en el PDF y con el ícono de flecha que apunta a la izquierda ir al editor a la línea de código donde aparece esa incidencia. De este modo se facilita mucho poder alternar entre el código y el documento generado.

Ahora que sabes esto, estás listo para poder editar y aprobar o modificar las notas realizadas a modo de corrección.

### Papeeria ###

[Papeeria](https://www.papeeria.com/) es otra solución del tipo SaaS (Software as a Service) que, al igual que Overleaf, nos ofrece una instalación completa y funcional de LaTeX en la nube accesible desde el navegador. No es tan popular ni tiene el nivel de desarrollo que su competidor pero ofrece un servicio bastante razonable sin tantas restricciones en sus cuentas gratuitas hasta ahora.

![](media/61066852b8ee2e8643d7e.png)Intefaz de Papeeria.

Se puede registrar gratuitamente ya sea vinculando una cuenta ya existente de entre las opciones disponibles o con un correo electrónico diferente.

![](media/88ac5f99e24394de7cd1d.png)Página de registro en Papeeria.

Una vez registrados nos llevará a una pantalla como la siguiente:

![](media/f9c7212b0eb400aa3da29.png)Panel de control en Papeeria.

El panel de control nos muestra tres áreas: del lado izquierdo la configuración de nuestra cuenta y algunos datos. En la parte central vemos nuestros proyectos tanto públicos como privados. En la cuenta epsilon (gratuita) solamente tenemos derecho a 1 proyecto privado activo, mientras que no hay restricción en la cantidad de proyectos activos que sean públicos. Si tuviéramos proyectos de terceros compartidos con nosotros se pueden mostrar en la pestaña de en medio y finalmente los proyectos recientes en la pestaña derecha. Por último, en el lado izquierdo podemos previsualizar algún proyecto, modificar la configuración de Papeeria en cuanto al compilador, la versión de TeXlive o la codificación de los archivos. Finalmente tiene opciones de control de versiones disponibles para las cuentas delta (de paga).

![](media/0430e4aed96227998f60f.png)Interfaz de trabajo.

Como se puede apreciar en la imagen de arriba, la interfaz de trabajo no difiere mucho de la vista del panel de control. En este caso en el panel de la izquierda podemos ver tres pestañas verticales:

* **Project**: nos muestra la estructura del proyecto como se muestra arriba.
* **Biblio**: muestra la o las bases de datos con las referencias que estamos usando en nuestro proyecto.
* **Plots**: muestra tres ejemplos prefabricados para poder realizar gráficos a partir de datos, en caso de que nuestro proyecto lo necesite.

En la parte de en medio está el editor de texto que nos muestra el código de los archivos que conforman el proyecto, incluso nos permite previsualizar las imágenes.

Finalmente en el lado derecho aparece en visor de pdfs con un acordeón que contiene los atajos de teclado para ciertas operaciones comunes a realizar cuando trabajamos con el pdf que Papeeria genera.

El proyecto que nos atañe y que se muestra en la imagen de arriba es [este](https://www.papeeria.com/join?token_id=2a95a4a1-bfbc-47d3-90b2-98280fe1992f&retry=3).

No voy a entrar en detalles acerca de las opciones que tenemos al trabajar con los proyectos, pero sí quiero comentar algunos detalles interesantes:

* Al igual que en Overleaf, debemos situarnos en Main.tex y tenerlo abierto para poder compilar correctamente.
* El botón Compile nos puede desplegar varias opciones de compilación para no tener que ir al panel de control y hacerlo desde ahí.
* Desafortunadamente (y a diferencia de Overleaf) parece que Papeeria no soporta synctex y por tanto no permite saltar fácilmente y con relativa precisión del código al pdf y viceversa, por lo que la búsqueda de las notas a revisar y corregir que se explican a continuación deberá ser manual y un tanto más laborioso.
* El visor de PDF nos da opción a mantener el PDF generado sin modificar o bien, permitir que se actualice conforme se compilan y se agregan los cambios.
* Papeeria permite insertar comentarios en todas y cada una de las líneas de código lo cual puede ser muy útil en ciertos casos. Por ejemplo, para plantear dudas respecto a lo que hace el código insertado en determinada línea o bien, señalar la ubicación de las notas.

### Todonotes ###

Este paquete de LaTeX nos ayuda a tener un registro de errores, correcciones a revisar, y tareas pendiente que van quedando para que no se nos olviden. Genera un índice de tareas pendientes (que está situado después el índice general y de los de figuras y tablas).

En este índice (ubicado en la página XXIII) verás una lista con unos cuadros de color a modo de viñetas. Esto es porque suelo definir con ciertos colores determinado tipo de notas:

* **Azul**: notas que tienen que ver con estilo, ya sean observaciones acerca de un error de estilo, dudas respecto al uso de ciertos términos o sugerencias no resueltas.
* **Verde**: correcciones que, de ser aprobadas, implican la reescritura de algún pasaje.
* **Rojo intenso**: citas que faltan en algún punto del texto, ya sea de algún autor determinado o que debe ser determinado.
* **Rojo claro**: remisiones faltantes, por corregir o que precisan ser añadidas.
* **Naranja**: notas de cualquier otro tipo en general que no están especificadas en los tipos arriba mencionados.
* **Sin color**: suelen ser figuras que se mencionan en algún punto del texto pero que no han sido incluidas o que se piensa agregar en un futuro pero de momento no están en el documento.

Si bien he intentado ser congruente con el criterio que acabo de describir, quizá no lo he sido a cabalidad. De cualquier modo, todas y cada una de las notas debe ser revisada para poder ser descartada, o confirmada y en este caso resuelta como se verá más adelante.

#### Marcas empleadas para las notas ####

Esto es algo técnico pero quizá necesario para entender el código de las notas insertadas a lo largo del texto. El paquete todonotes ha sido cargado con la siguiente configuración:

```
01 \usepackage[colorinlistoftodos,textsize=scriptsize,spanish]{todonotes}
02 \newcommand{\didit}[1]{\todo[color=red!40]{#1}} % Indica que esta parte ya está concluida
03 \newcommand{\revquotes}[1]{\todo[color=red!95]{Homologar criterio de uso de las comillas.}}
04 \newcommand{\addref}[1]{\todo[color=red!90]{[Cita requerida, #1]}} % Indica que hace falta una cita
05 \newcommand{\rewrite}[1]{\todo[color=green!40]{#1}} % Nota para comentar que hay que reescribir algo
06 \newcommand{\revstyle}[1]{\todo[color=cyan!40]{#1}} % Indica que requiere un ajuste de estilo
07 \makeatletter
08 \if@todonotes@disabled
09 \newcommand{\hlfix}[2]{#1}
10 \else
11 \newcommand{\hlfix}[2]{\texthl{#1}\todo[color=cyan!40]{#2}}
12 \fi
13 \makeatother% Resalta texto a corregir y agrega una nota alusiva al margen

```

#### Explicación ####

La línea 1 indica como se declara el paquete todonotes y con que opciones, en este caso: añade color a la lista de tareas pendientes, el tamaño del texto de las notas es 20% menor al de lasa notas al pie y el idioma es español.

La linea 2 declara una marca (comando) nueva llamada \\didit que sirve para señalar que algo ya está concluido (no se ha usado en el documento).

La línea 3 declara una marca nueva llamada \\revquotes que sirve para indicar alguna inconsistencia en el uso de comillas en el documento (no se usa ya en el documento porque todas las incidencias han sido resueltas).

La línea 4 declara una marca nueva muy útil llamada \\addref que nos sirve para indicar que hace falta una referencia en un punto determinado del texto, y permite añadir un argumento para indicar el autor, libro o algún indicio para saber qué referencia es la faltante y así no tener que leer todas y cada una de las notas para determinarlo.

La línea 5 declara una marca nueva llamada \\rewrite que sirve para señalar alguna expresión o pasaje que probablemente requiera ser reescrito porque en su forma actual no es muy claro.

La línea 6 declara una marca nueva llamada \\revstyle para señalar que alguna expresión requiere corrección de estilo o que y fue hecha una revisión pero se conserva la nota a fin de informar al autor del error para ponerlo al tanto.

De las líneas 7 a 13 muestran una declaración más sofisticada de una marca nueva llamada \\hlfix que permite resaltar alguna palabra o frase en el texto y a continuación escribir una nota al margen que especifica la duda o corrección realizada.

Cabe señalar que el color, en el caso de las notas, tanto \\revstyle como \\hlfix es el mismo, porque he alternado su uso en ciertos casos, encontrando el resaltado bastante útil para indicar en el PDF la frase en cuestión.

Sin embargo, un problema que he encontrado ha sido que \\hlfix por la forma en que ha sido declarado y por las dependencias que tiene, presenta un comportamiento frágil y por ello marca errores de compilación cuando dentro de cualquiera de sus argumentos (tanto el texto resaltado como el texto de la nota) alguna letra lleva tilde. Es por ello que verás que en algunos casos, el texto ha tenido que acentuarse *a la ascii* (es decir, usando la siguiente forma: \\'{vocal}). De modo que una vez resuelta la nota, el texto deberá acentuarse de manera normal.

#### Algunas consideraciones finales ####

El tema está muy interesante, pero no deja de ser un texto de filosofía y algo denso de leer sobre todo si no estás familiarizado con el tema o con los conceptos de varios de los autores citados a lo largo del texto. Eso lo notarás en algunas de mis notas iniciales seguramente y lo que me motivaría a añadir un montón de notas al pie aclaratorias. Pero como finalmente es una tesis y por tanto, el lector potencial será alguien que conozca del tema, todas esas hipotéticas notas carecerían de sentido.

Antes de olvidarlo, para mejorar la legibilidad de las notas volvía dejar el documento en tamaño carta y con Alegreya como tipografía. De este modo es menos latoso de revisar y de lograr que las notas se coloquen en su lugar.

Retomando el contenido del documento, siento que la puntuación y la ortotipografía recurren muchas veces a las convenciones anglosajonas que no necesariamente son de uso común en español. Un ejemplo claro de ello es el abuso en el uso de la mayúscula inicial en sustantivos comunes que en español se escriben a minúscula cerrada. Quiero entender o creer que lo haces con ciertas categorías que sería bueno determinar para hacer un uso consistente de las mayúsculas.

Otro caso frecuente es el abuso con los guiones para formar palabras compuestas por más de 2 palabras como forma-de-vida que no es correcto en español y cuyo uso a lo largo del texto es inconsistente.

Falta también discernir a cabalidad que epigrafes sí lo son y si se mantienen y cuales son citas.

Por último, dado que en LaTeX las figuras y tablas suelen ser objetos flotantes que se colocan donde LaTeX considera que mejor conviene de acuerdo a ciertos parámetros de diseño editorial que usa, conviene colocar en cada uno de estos objetos una leyenda o pie de imagen/tabla que a su vez irá al índice correspondiente. Es necesario que elijas una leyenda en cada caso para igualmente poder hacer las remisiones pertinentes.

Creo que me extendido ya demasiado y por ello lo dejo hasta aquí. Todas las demás dudas podemos verlas por Telegram, en el chat de Overleaf, por teléfono o como quieras.