CoffeeScript-ThreeJS-Boilerplate
================================

Simple boilerplate for Coffeescript and Threejs initially built for Ludem Dare.

Coffeescript source files are located in src/


Compiling
---------
Install coffeescript via nodejs
Open terminal in src/ directory
Run command: `coffee -wcm -o ../js .`

LiveReload
----------
Install the livereload via nodejs
Install the livereload browser plugin
  http://feedback.livereload.com/knowledgebase/articles/86242-how-do-i-install-and-use-the-browser-extensions-
Include the following script in any pages you want livereload to work on:
  `<script>document.write('<script src="http://' + (location.host || 'localhost').split(':')[0] +
':35729/livereload.js?snipver=2"></' + 'script>')</script>`
Open terminal in your root WebGL/Coffeescript App directory
  run command livereloadx
