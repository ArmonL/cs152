**Create a plugin** for Sublime Text 3 to work with `compiler.rb` and `vm.rb` from the Ruby VM lab.

First create a _new plugin through the menu_ `(Tools > Developer > New Plugin)`.  Save it to the `Packages/User/` directory.  Be sure to give it a `.py` extension.  Open the console with `"ctrl+backtick"` and run the example with `view.run_command('example')`.

Add a _menu item "My Scheme"_ that has a child of "Run" that calls your plugin.  Update your plugin to execute the current file (if it has a `.byco` extension) using your `vm.rb` file.  You will probably need to use `"subprocess.Popen"` for this part.  Write the output to the console.

_Add a key binding_ (perhaps `"control+shift+e"`) to run this command

Next, _add an `EventListener`_ to compile any `.myscm` file to a `.byco` file whenever you save.  Use `compiler.rb` for this part.  Give the `.byco` file the same name as the `.myscm` file (so that `example.myscm` will compile to `example.byco`).
