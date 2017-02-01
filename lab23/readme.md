In this lab, you will explore Java 8 _lambdas_ and the _Nashorn_ JavaScript engine.

Download `FileLoader.java` from the course website and implement the 4 given methods.  Implement these methods using `java.io.File`.  The `java.io.File.listFiles` and `java.io.File.isDirectory` methods might be particularly helpful.

`listSubdirectoriesLambda` takes the name of a directory and prints out the names of its subdirectories.  Before Java 8, the standard approach would be to use a FileFilter.  Instead, use a **lambda**.

`listSubdirectoriesRef` does the same thing as the previous method.  Implement this version using a **method reference** instead.

`listFiles` prints out a list of the files in the specified directory with the specified extension.  Use a **lambda** rather than a FilenameFilter.

`listFilesByScript` should use **Nashorn** rather than lambdas.  The script assumes that a `'$files'` variable holds the list of all files in the specified directory.  Run the script to return the list of files that you want to print out.
