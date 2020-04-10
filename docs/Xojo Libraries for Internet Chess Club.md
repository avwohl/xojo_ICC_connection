ReadMe ICC Bot Library

**GET A COPY OF THE LIBRARY**

With git clone the repository [https://github.com/avwohl/xojo_test_bot.git](https://github.com/avwohl/xojo_test_bot.git). This document is the Microsoft word .docx file in that directory.

**OVERVIEW OF THIS LIBARY**

This folder is a library of code to connect to internet chessclubchessclub.com. It handles the data connection and parsing the datagrams from the chess server. It is useful for creating clients for chess playing or robots to provide services. For a chess playing client you would also want the time lag correction provided by timestamp. This library is open source where as timestamp is not to help prevent cheating.

This library was written by Aaron Wohl [wohl@chessclub.com](mailto:wohl@chessclub.com). Although a long time ICC employee/consultant, this project was not funded by ICC. The library was written to provide a foundation to make it easy to create robots that work with ICC.Any opinions expressed in this project are those of Aaron Wohl. This project is in no way blessed or supported by Internet Chess Club chessclub.com or Xojo.com

The files in this directory that begin with ICC should not be modified for your application. These files are designed to be subclassed to customize them for a particular application. When a new verion of this directory is released the new version can replace this one and be compatible. If you make changes to the ICC files they could easily be lost. 

If you find a bug in this library or wish to extend it to be more useful and share those changes with other users then it would make sense to make changes here and submit the changes.

**WHAT IS XOJO?**

Xojo is a programming language.   It used to be called Real Basic but was renamed to not scare off Basic-a-phobes. It is available from[www.xojo.com](http://www.xojo.com). There is a free version for development, see the gotchas section below. The pay version is required to ship a compiled executable.

**WHY WRITE A LIBRARY IN XOJO?**

- Xojo can build an application for Macintosh OS, Microsoft Windows, apple IOS, linux interactive, windows command line, linux command line, web server, and soon android. The price for the full xojo version is about $700/year. This is a lot less than say xmarin which can ship to a similar number of platforms.
- Xojo is fun environment to develop and debug in.

**HOW TO MORPH THE TEST PROJECT INTO A STARTER OF YOUR APPLICATION**

To use this project as a template to make your own bot, it works best to rename XojoTestBot files and edit the refrences in them with some tool such as sed for linux/mac. For each file with a name startingwith XojoTestBotedit it as follows. Note leave the files named with ICC* alone, they don’t change. Forexample if you where goin to make a tetris bot and wanted to use the XojoTestBot as a starting point:

sed s/XojoTestBot/TetrisBot/ < XojoTestBot.xojo_code > TetrisBot.xojo_code

sed s/XojoTestBot/TetrisBot/ < XojoTestBot.xojo_project > TetrisBot.xojo_project

and so on for each XojoTestBot file except the resources file. Just copy that one.

I found trying to all the above renames from within the project to be more painful and required detailed knowledge about this library and Xojo.

**DATAGRAMS**

The usual flow is the user sends in command and the chess server sends back a response. The default format for the response is for a human to read. There is a more program friendly format known as a level 1 datagram. It holds:

- The CN_ command number of the command done (see formats.txt for a list)
- The user doing the command, usually you. But if someone matches you for example it would be their handle
- The text of the command output in the language set for the current login.

Before login level1 can be enabled by entering level=1(end of line) at the login prompt before entering the user and password. After login level1 can be set with the chess server command “set level1 1”

There is another kind of datagram, a L2 or level 2 datagram. Those can arrive at any time. They notify the user of some current status. See formats.txt for a list of DG_ level 2 datagrams. Before login the level 2 datagrams can be enabled with alevel2settings=. See thesend_login function in XojoTestBot_Hub for some typical settings for logging in.

For which datagrams are set at login see the startup method in XojoTestBot_Hub. Some datagrams can generate a huge amount of data, enough to overflow your output buffer in the chess server and cause data loss. It is best to limit the number of datagrams turned on before login. After login bots such as tomato typically send themselves a tell like boot1, boot2, etc. When they receive such a tell they know that boot phase1 has finished and they go on to phase 2 etc. Each phase can turn on another datagram to spread out the output load.Also some users have a privilege to have larger input and output buffers for handling more data. The tomato bots (which are all TDs, tournament direcitors) do the following during startup:

		  set tcp_input_size 60000

		  set tcp_output_size 60000

If you receive a control-O character you are not expecting from the chess server it means that your output buffer overflowed and some data was lost. Try increasing your output buffer size or decreasing the amount of data you having sent to you.

**WHERE DO I PUT MY GLOBAL VARIABES?**

You may notice that in the library and sample program there are fewglobal variables. In the library there is anICC_Hubobject. The hub receives information about events happening and passes them on to interested objects. Each instance of the hub is tied to a particular connection. This allows talking to multiple chess servers (main and queen) at the same time. It also provides a clear place to store data that will be cleaned up when a connection is closed / drops.

Global variables are somewhat a thing of the past, from a time when a program ran from the command line. Nowadays much of the data that used to beglobal is now per connection data. Forexample,for a typical bot that has a connection to main and one to the queen chess server the data associated with each connection would be stored separately. If this model works for you thing you are looking at isICC_Hub.  However files with names starting with ICC are all library files that should not be modified. The custom version for your project isXojoTestBut_Hub (which maybe you renamed to say PongBot_Hubif you are making a pong bot). If you add a property to that Hub file it will have the same lifetime as the connection.So if you connect to main and queen you will get two instances of that Hub file.

That said there are times when you really do want a global. Forexampleif you where showing stats on users logged in to all ICC chess servers. There are two ways to do that. One is to add a property to the App object.For example the dg_map property of the XojoTestBot app subclass.  The other is to create a new module then add a property to that new module. Such a module property has a global lifetime for the life of the program run.

**HOW DO I WRITE A PROGRAM IN XOJO?**

If you visit the xojo.com website and google for xojo related questions there are many resources for getting started in xojo.  Also, there are many sample programs that come with XOJO.  Unfortunately, if you are using the free version of XOJO those samples are all in a binary format.  I prefer to read a print out or continuous listing of all the parts of a program which doesn’t seem to exist for the free version.

**TEXT VS STRING**

A string is an old data type. Is isan array of characters. A text object is designed to do the same thing as a string, but in addition to the data it alsoholdcharacter set info. XOJO is in the process of transitioning from string to text. Not all the functions are converted yet. Beware that the first index of a string is 1 while the first index of a text is zero.So if translating algorithms for a string to text beware of being off by one.

**COMING FROM A DIFFERENT PROGRAMMING LANGUAGE**

- Xojo was once called realbasic. In mostbasics arrays get a default dimension and can be redimensioned. InXojoa new array has zero dimensions. You can add rows to it orredim it.
- Xojo arrays start at 1, c arrays start at 0. The new text string object starts at 0. For arrays there is a lower and upper index property so you never need to remember.

**BEWARE OF YOUR AVAILABLE BANDWITH AND USAGE**

If you are using xojoto make a program that runs on cell phone that maybe has a 2G or 3G connection and you are turning on all the datagrams you can find it probably is going to get buffer overflows and not work. If you are targeting a low bandwidthenvironment I would suggest testing that during development from a windows/mac/linuxmachines. The pf firewall (fromopenbsd, but available in linuxnow) can setup bandwidth limited routing paths. I have found this useful when testing clients to see how they will handle in the boondocks.

**IF LOOKING TO SOLVE A PROBLEM READ ALL THE CHESS SERVER OUTPUT**

In a lot of modern clientsthe chess server output gets routed to update various status items in the user interface. If something is going wrong it can be useful to log then read each datagram received. And all the chess server output. Often there is some command that didn’t work quite right or gave unexpected output.

**ON OVERRIDING A FUNCTION/SUBOUTINE**

The various classes in this test bot may or must be overridden to make a version for your bot. Forexample the XojoTestBot_Hub is a subclass with app specific customizations of ICC_Hub. In such cases when you make a custom version of a method that is in both bots there are some cases to consider.

- For recieve_L2  method the subroutine in ICC_Hubdoes nothing. It is just a place holder so other ICC_* can type check and have prototype to call. In this case the receive_L2 method inXoJoTestBot_Hub replaces the one in ICC_Hub
- In other casesyour custom routine may want to do some pre processing then call the default routine. If you are in routine foo thenSUPER.foo would call your parent class.  Likewiseyou may want to call the parent class first then do some work afterwards. Ingeneralif you look at the parent routine and it is not an empty place holder you probably want to call it. Some purists always call the parent routine even if the current implementation does nothing.

XOJO VS C++

If you are coming to xojo programming from c++ there some things the examples and docs may not make clear:

- Xojo object are like a pointer to a c++class. The maid difference is that there is no structure assignment. If you want to copy an object with 5 fields you get to copy each field
- There is no xojo clone object (ok well that was a smalltalk thing, at least it solves the should clone be shallow or deep debate)
- Xojoarrays and string indexes generally start at 1 not zero. But the new text object to replace string seems zero based. There methods on arrays to get the upper and lower bounds so it is best notuse 1 or 0 when indexing
- Xojo uses interfaces like Java rather than c++ multiple inheritance
