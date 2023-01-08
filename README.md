# Trabajo-MCVA
En este repositorio se encuentran dos implementaciones, una en NetLogo y otra en Python, para la creación de arte generativo mediante técnicas de vida artificial.

La implementación en Netlogo toma como referencia los modelos Kaleidoscope y Geometron Top-Down de la librería Art de dicho software. En el modelo propuesto para este trabajo, se utilizan las tortugas de NetLogo para dibujar figuras geométricas de manera periódica, dando la sensación de estar viendo un caleidoscopio, utilizando unas reglas que siguen los agentes para crear patrones artísticos. Los cambios que se proponen a los modelos originales aportan interactividad con el espectador de la obra y aleatoriedad en el resultado, ya que se añaden botones para elegir distintos parámetros como la forma geométrica y la orientación y se implementan funciones para cambiar el color de manera imprevisible.

En la implementación en Python, que hace uso de librerías como numpy y PIL, se crea una matriz de las dimensiones que se deseen para la obra. Cada una de las posiciones guarda el color que se mostrará en ese lugar, utilizando el sistema RGB. Estos colores se generan de manera aleatoria, dando lugar a composiciones muy diferentes entre sí, pero que siguen el mismo estilo, como si fueran una colección del mismo autor. Se proponen diferentes usos de las funciones de numpy para modificar la creación de la obra de arte.

Trabajo realizado por Laura Díaz y Gema Chamizo para la asignatura de Modelos Computacionales de Vida Artificial del Máster de Lógica, Computación e Inteligencia Artificial de la Universidad de Sevilla.



