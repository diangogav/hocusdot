
# Dotfiles

Dotfiles para el manejo de scripts y alias de terminal, y por suspuesto, para lucirnos personalizandola.



## Instalación

- Asegurate de tener instalado `zsh`.
- Instala la Nerd Font que mas te guste: https://www.nerdfonts.com/font-downloads
- Instala starship, nos servirá para personalizar nuestra terminal: 
```bash
`curl -sS https://starship.rs/install.sh | sh`
```
- Asegurate de tener instala `python`
- Ejecuta el archivo `install` que corresponda según tu sistema operativo.

```bash
Para usuarios Arch Linux
./install_arch 

Para usuarios Ubuntu
./install_ubuntu
```

Opcionalmente se recomienda usar la terminal `kitty` https://github.com/kovidgoyal/kitty


## Comandos por defecto

### Listar scripts
```bash
scripts
```

### Ejecutar un script
Puedes ejecutar un comando seleccionandolo a través de la lista generada por el comando de Listar Scripts o ejecutar.

```
dot <context> <script>
```

donde context es la carpeta contenedora de un conjunto de scripts dentro de la carpeta scripts y script es el nombre del archivo a ejecutar.

## Agregar un script

Simplemente se debe crear un archivo dentro de la carpeta scripts y darles los permisos requeridos para su ejecución e inmediatamente saldrá en la lista de scripts y estará disponible a través del comando dot

## Agregar un alias

Los alias se agregan dentro del archivo /terminal/aliases


## Roadmap

- Agregar selección de temas

- Incluir un instalador interactivo


## License

[MIT](https://choosealicense.com/licenses/mit/)


## Acknowledgements

 - [Curso Todo sobre dotfiles de CodelyTv](https://pro.codely.com/library/todo-sobre-los-dotfiles-54672/137187/about/)
