# PFT5447-005V-4-TecnoBencina
Trabajo Potafolio
[>>Enunciado<<](https://github.com/iformas/Proyectos-Duoc/blob/master/Proyecto%20Final%20TecnoBencina/PFT5447-005V-4/Enunciado%20Caso%204.pdf)

Estructura de un archivo App.Config
```
<?xml version="1.0" encoding="utf-8"?>
<configuration>
  <connectionStrings>
    <add name="TecnoBencinaEntities" connectionString="metadata=res://*/TecnoBencinaEDM.csdl|res://*/TecnoBencinaEDM.ssdl|res://*/TecnoBencinaEDM.msl;provider=Oracle.DataAccess.Client;provider connection string=&quot;DATA SOURCE=localhost;PASSWORD=toor;USER ID=TECNOBENCINA&quot;" providerName="System.Data.EntityClient" />
  </connectionStrings>
</configuration>
```

Para el funcionamiento de la aplicacion de android y de escritorio 
se necesita que el dispositivo 
se encuentre configurado para apuntar a un servidor dns local que resuelva el 
dominio intranet.tecnobencina.cl hacia el host IIS que contiene el servicio,
de tal forma que pueda ser accedido a el mediante la url
http://intranet.tecnobencina.cl/tecnobencina/Servicio.svc

Herramientas

Toad Data Modeler
```
    http://www.toadworld.com/m/freeware/
```

Git
```
    https://git-scm.com/downloads
```

Oracle 11g r 2
```
    http://www.oracle.com/technetwork/database/database-technologies/express-edition/overview/index.html
```

Oracle SQL Developer
```
    www.oracle.com/technetwork/developer-tools/sql-developer/downloads/index.html
```

Herramientas y Connector Oracle
```
	ODAC 11.2 Release 5 and Oracle Developer Tools for Visual Studio (11.2.0.3.20)
	http://www.oracle.com/technetwork/topics/dotnet/utilsoft-086879.html
	ODTwithODAC1120320_32bit.zip
    
```

Visual Studio 2010 Ultimate 
```
	Su dreamspark mas cercano
```

Eclipse Mars
```
	https://eclipse.org/downloads/
```

Android Studio Bundle
```
    https://developer.android.com/studio/index.html
```
A continuación Se encuentran unas notas para el grupo

El funcionamiento local en git se divide en 3 areas

    A Working Directory: Donde constantemente estas realizando cambios
    A Staging Area: donde listas los cambios realizadios en el espacio de trabajo (git add)
    A Repository: Repositorio git local(git commit)

Comandos git útiles

Clona un repositorio para trabajarlo de forma local
```
    git clone https://github.com/......git
```

Muestra los directorios de configuración
```
    git config --list --show-origin
```

Perpara el contenido para el proximo commit
```
    git add .
    git add file.txt
```

Realiza commit para agregarlo a repositorio local
```
    git commit -m "mensaje de cambios"
```

Cambia el programa para editar el mensaje de cambios (ej para visual studio code)
```
    git config --global core.editor "code --wait"
```

Agrega los commits al repositorio externo
```
    git push
```

Actualiza los cambios relizados desde el repositorio externo
```
    git pull
```

Fusiona los cambios de forma automatica si no hay problemas de conflictos
```
    git merge
```

Fusionar cambios si hay problemas
```
git mergetool
```

cambiar herramienta para mergetool (ej para kdiff3)
```
git config --global merge.tool kdiff3
```

Muestra la lista de commits
```
    git log
```

Regresar a una version anterior (https://git-scm.com/docs/git-reset)
```
    git reset commit_key 
    donde commit_key es el codigo del commit accesible via git log
```

Archivos útiles
```
    .gitignore
    Encargado de añadir carpetas o archivos a la lista de elementos ignorados
```


