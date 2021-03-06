# spaceShip
Nave espacial en el sistema solar

Autor: Samuel Trujillo Santana.

## Descripción
Este programa es una ampliación del programa del sistema solar https://github.com/SamuelTrusant/solarSystem con el añadido de una "nave espacial" que puede desplazarse por este.

## Funcionamiento
En el programa puedes cambiar entre una vista del sistema solar y una vista en primera persona de la nave. La nave se ve quieta en la vista del sistema pero al entrar en primera persona puedes desplazarte hacia adelante, atrás y los lados con "wsad", y mover la orientación de la cámara con el ratón. Puedes volver a la vista del sistema con la tecla 'c' y puedes pausar el movimiento de los planetas con la tecla 'p'.

## Vista del programa funcionando

![](export.gif)

## Trabajo realizado
El programa tiene lo mismo que la entrega anterior mas unos añadidos que setean la cámara en función de si es modo primera persona o no. Se ha creado la clase spaceShip la cual posee todos los parámetros de la nave y los métodos para moverse y rotar.

La rotación de la cámara me ha dado muchos problemas, he probado de muchas formas y al final el resultado lo que hace es setear la cámara en la posición de la nave y rotar en el eje Y el centro de la escena en función de la posición de la cámara. Con respecto al arriba y abajo lo que hacemos es desplazar la posición del centro de la escena sobre el eje Y.

Durante el proceso de rotación guardamos el vector que indica la dirección a la que mira la cámara y aplicamos el desplazamiento en función de ella.

Al principio el programa disponía la foto del espacio de fondo y eso causaba que al girar la cámara si perdías de vista el sistema solar no se notaba que estuviese rotando. Por ello intenté crear una esfera lo más grande posible y ponerle la textura del espacio, y meter el sistema solar dentro, así se nota más el efcto de rotación pero processing al dibujar una esfera tan grande, por alguna razón al dibujarla si te vas a un extremo de la esfera, el extremo opuesto desaparece, supongo que processing solo dibuja hasta una distancia limitada.

## Referencias

Guión de prácticas de CIU

Referencias Processing https://processing.org/reference/

Librería GifAnimation https://github.com/extrapixel/gif-animation
