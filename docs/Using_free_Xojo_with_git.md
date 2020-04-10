### Using free (unlicensed) xojo with git
Using these (or any) git xojo source code libraries with the feee (unlicensed) xojo IDE is very complicated.  If you look at the git repositories the seem quite normal and like any other programming language.  However, the repositories where created with a paid/licensed copy of xojo.

The free version of xojo saves all files of a project in one large binary file. So if you load a git project and make some changes none of the changes will save back to the source files.

You can check the binary project file into git.  However, you cannot diff versions.  Also if a new version of the a library comes out you can't pickup the changes with git.

I suppose if you worked with the free version to develop a project you could then (when using a paid version later) export each of the files from the binary.

As soon as you get a licensed version:
- on the Xojo fo