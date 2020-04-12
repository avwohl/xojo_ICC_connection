# xojo_ICC_connection - library to connect to Internet Chess Club written in xojo

### Author Aaron Wohl https://github.com/avwohl

### Where to find the latest stable version of this file:
[https://github.com/avwohl/xojo_ICC_connection/blob/stable/README.md](https://github.com/avwohl/xojo_ICC_connection/blob/stable/README.md)

### Documentation using git and submodules and these libs in xojo:
[https://github.com/avwohl/xojo_documentation/tree/stable](https://github.com/avwohl/xojo_documentation/tree/stable)

### Download the stable version of this git submodule for settings for xojo:
[https://github.com/avwohl/xojo_ICC_connection/tree/stable](https://github.com/avwohl/xojo_ICC_connection/tree/stable)

xojo_ICC_connection is a library to connect to Internet Chess Club.  It takes care of the tcp connection and parsing the data from ICC.

To use the library the main thing is to subclass ICC_Hub and customize the subclass to implement your bot.  For examples of using xojo_ICC_connection see:

- [https://github.com/avwohl/xojo_ICC_test_bot/blob/stable/README.md](https://github.com/avwohl/xojo_ICC_test_bot/blob/stable)
- [https://github.com/avwohl/uci_icc_player_bot/blob/stable/README.md](https://github.com/avwohl/uci_icc_player_bot/blob/stable)