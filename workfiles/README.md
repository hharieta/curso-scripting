# Bash para manipular archivos

## Recursos ⚠️
NO empieces a mover datos sin saber los recursos que tienes disponibles

* Conocer el espacio en disco

```bash
df -h
```

* Conocer la capacidad en RAM disponible

```bash
free -h
 ```

* Conocer el número de CPUs disponibles

```bash
nproc
```

* Información de las CPUs
```bash
lscpu
cat /proc/cpuinfo
```

## Leer ficheros de texto

Los formatos más habituales son .csv y .json

* Número de lí­neas de un fichero(con -w encontrarás el número de palabras)
```bash
wc -l <fichero>
```

* Leer las 5 primeras filas de un fichero
```bash
head -5 <fichero>
```

* Leer las 5 últimas filas de un fichero
```
tail -5 <fichero>
```

* Leer la fila 28 de un fichero
```bash
head -28 <fichero> | tail -1
```

* Obtener valores de un documento JSON
```bash
echo '{ "foo": 123, "bar": 456 }' | jq '.foo'
```

## Unir|dividir ficheros

Otra funcionalidad que debemos dominar es la de dividir y después unir ficheros ya que es habitual tener que dividir la información para cargarla en clusters o simplemente enviarla mas fácilmente.

* Dividir un fichero binario en bloques de 1000000 bytes(Nos generará ficheros con el nombre 'divididoaa,dibididoab, etc.')
```bash
split -b 1000000 <fichero_original> <fichero_dividido>
```

* Dividir un fichero de texto en bloques de 2000000 lí­neas.
```bash
split -l 200000 <fichero_original> <fichero_dividido>
```

* Unir ficheros
```bash
cat dividido* > <fichero_original>
```

## Compresión y descompresión de ficheros
El formato mas usado para comprimir y descomprimir ficheros BigData es el Gzip(.gz). Para comprimir y descomprimir ⚠️ Comprime y descomprime sin dejar el fichero original ⚠️

* Comprimir
```bash
gzip <fichero_original>
```

* Descomprimir
```bash
gzip -d <fichero_original>
```

