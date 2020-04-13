#tag Class
Protected Class ICC_DG_debug
Inherits ICC_DX_debug_base
	#tag Method, Flags = &h0
		Sub add_constants()
		  #if INCLUDE_DATAGRAM_NAMES
		    set_max(189)
		    add_constant("DG_WHO_AM_I",0)
		    add_constant("DG_COR_LOGIN",1)
		    add_constant("DG_COR_START",2)
		    add_constant("DG_COR_END",3)
		    add_constant("DG_COR_LIST",4)
		    add_constant("DG_COR_OFFER_ABORT",5)
		    add_constant("DG_COR_OFFER_DRAW",6)
		    add_constant("DG_BUGHOUSE",7)
		    add_constant("DG_TIMESTAMP",8)
		    add_constant("DG_TITLES",9)
		    add_constant("DG_OPEN",10)
		    add_constant("DG_STATE",11)
		    add_constant("DG_GAME_STARTED",12)
		    add_constant("DG_GAME_RESULT",13)
		    add_constant("DG_EXAMINED_GAME_IS_GONE",14)
		    add_constant("DG_MY_GAME_STARTED",15)
		    add_constant("DG_MY_GAME_RESULT",16)
		    add_constant("DG_MY_GAME_ENDED",17)
		    add_constant("DG_STARTED_OBSERVING",18)
		    add_constant("DG_STOP_OBSERVING",19)
		    add_constant("DG_PLAYERS_IN_MY_GAME",20)
		    add_constant("DG_OFFERS_IN_MY_GAME",21)
		    add_constant("DG_TAKEBACK",22)
		    add_constant("DG_BACKWARD",23)
		    add_constant("DG_SEND_MOVES",24)
		    add_constant("DG_MOVE_LIST",25)
		    add_constant("DG_KIBITZ",26)
		    add_constant("DG_PEOPLE_IN_MY_CHANNEL",27)
		    add_constant("DG_CHANNEL_TELL",28)
		    add_constant("DG_MATCH",29)
		    add_constant("DG_MATCH_REMOVED",30)
		    add_constant("DG_PERSONAL_TELL",31)
		    add_constant("DG_SHOUT",32)
		    add_constant("DG_MOVE_ALGEBRAIC",33)
		    add_constant("DG_MOVE_SMITH",34)
		    add_constant("DG_MOVE_TIME",35)
		    add_constant("DG_MOVE_CLOCK",36)
		    add_constant("DG_BUGHOUSE_HOLDINGS",37)
		    add_constant("DG_SET_CLOCK",38)
		    add_constant("DG_FLIP",39)
		    add_constant("DG_ISOLATED_BOARD",40)
		    add_constant("DG_REFRESH",41)
		    add_constant("DG_ILLEGAL_MOVE",42)
		    add_constant("DG_MY_RELATION_TO_GAME",43)
		    add_constant("DG_PARTNERSHIP",44)
		    add_constant("DG_SEES_SHOUTS",45)
		    add_constant("DG_CHANNELS_SHARED",46)
		    add_constant("DG_MY_VARIABLE",47)
		    add_constant("DG_MY_STRING_VARIABLE",48)
		    add_constant("DG_JBOARD",49)
		    add_constant("DG_SEEK",50)
		    add_constant("DG_SEEK_REMOVED",51)
		    add_constant("DG_MY_RATING",52)
		    add_constant("DG_SOUND",53)
		    add_constant("DG_PLAYER_ARRIVED_SIMPLE",55)
		    add_constant("DG_MSEC",56)
		    add_constant("DG_BUGHOUSE_PASS",57)
		    add_constant("DG_IP",58)
		    add_constant("DG_CIRCLE",59)
		    add_constant("DG_ARROW",60)
		    add_constant("DG_MORETIME",61)
		    add_constant("DG_PERSONAL_TELL_ECHO",62)
		    add_constant("DG_SUGGESTION",63)
		    add_constant("DG_NOTIFY_ARRIVED",64)
		    add_constant("DG_NOTIFY_LEFT",65)
		    add_constant("DG_NOTIFY_OPEN",66)
		    add_constant("DG_NOTIFY_STATE",67)
		    add_constant("DG_MY_NOTIFY_LIST",68)
		    add_constant("DG_LOGIN_FAILED",69)
		    add_constant("DG_FEN",70)
		    add_constant("DG_TOURNEY_MATCH",71)
		    add_constant("DG_GAMELIST_BEGIN",72)
		    add_constant("DG_GAMELIST_ITEM",73)
		    add_constant("DG_IDLE",74)
		    add_constant("DG_ACK_PING",75)
		    add_constant("DG_RATING_TYPE_KEY",76)
		    add_constant("DG_GAME_MESSAGE",77)
		    add_constant("DG_UNACCENTED",78)
		    add_constant("DG_STRINGLIST_BEGIN",79)
		    add_constant("DG_STRINGLIST_ITEM",80)
		    add_constant("DG_DUMMY_RESPONSE",81)
		    add_constant("DG_CHANNEL_QTELL",82)
		    add_constant("DG_PERSONAL_QTELL",83)
		    add_constant("DG_SET_BOARD",84)
		    add_constant("DG_MATCH_ASSESSMENT",85)
		    add_constant("DG_LOG_PGN",86)
		    add_constant("DG_NEW_MY_RATING",87)
		    add_constant("DG_LOSERS",88)
		    add_constant("DG_UNCIRCLE",89)
		    add_constant("DG_UNARROW",90)
		    add_constant("DG_WSUGGEST",91)
		    add_constant("DG_TEMPORARY_PASSWORD",93)
		    add_constant("DG_MESSAGELIST_BEGIN",94)
		    add_constant("DG_MESSAGELIST_ITEM",95)
		    add_constant("DG_LIST",96)
		    add_constant("DG_SJI_AD",97)
		    add_constant("DG_BLITZIN_REG",98)
		    add_constant("DG_QRETRACT",99)
		    add_constant("DG_MY_GAME_CHANGE",100)
		    add_constant("DG_POSITION_BEGIN",101)
		    add_constant("DG_ALLOW_GUESS",102)
		    add_constant("DG_TOURNEY",103)
		    add_constant("DG_REMOVE_TOURNEY",104)
		    add_constant("DG_DIALOG_START",105)
		    add_constant("DG_DIALOG_DATA",106)
		    add_constant("DG_DIALOG_DEFAULT",107)
		    add_constant("DG_DIALOG_END",108)
		    add_constant("DG_DIALOG_RELEASE",109)
		    add_constant("DG_POSITION_BEGIN2",110)
		    add_constant("DG_PAST_MOVE",111)
		    add_constant("DG_PGN_TAG",112)
		    add_constant("DG_IS_VARIATION",113)
		    add_constant("DG_PASSWORD",114)
		    add_constant("DG_BANNER",115)
		    add_constant("DG_WILD_KEY",116)
		    add_constant("DG_FORM_FEEDBACK",117)
		    add_constant("DG_KEY_VERSION",119)
		    add_constant("DG_SWITCH_SERVERS",120)
		    add_constant("DG_CRAZYHOUSE",121)
		    add_constant("DG_PLUGIN_TRUSTED",122)
		    add_constant("DG_SPEAK",123)
		    add_constant("DG_SET2",124)
		    add_constant("DG_FIVEMINUTE",125)
		    add_constant("DG_ONEMINUTE",126)
		    add_constant("DG_QIMPART",127)
		    add_constant("DG_MUGSHOT",128)
		    add_constant("DG_TRANSLATIONSOKAY",129)
		    add_constant("DG_CLIENT_TRUST_LEVEL",130)
		    add_constant("DG_UID",131)
		    add_constant("DG_KNOWS_FISCHER_RANDOM",132)
		    add_constant("DG_FREE_WAS_CHECKERS",133)
		    add_constant("DG_WEB_AUTH",134)
		    add_constant("DG_ICCLOGBOT",135)
		    add_constant("DG_COMMAND",136)
		    add_constant("DG_TOURNEY_GAME_STARTED",137)
		    add_constant("DG_TOURNEY_GAME_ENDED",138)
		    add_constant("DG_MY_TURN",139)
		    add_constant("DG_CORRESPONDENCE_RATING",140)
		    add_constant("DG_DISABLE_PREMOVE",141)
		    add_constant("DG_PSTAT",142)
		    add_constant("DG_BOARDINFO",143)
		    add_constant("DG_MOVE_LAG",144)
		    add_constant("DG_FIFTEENMINUTE",145)
		    add_constant("DG_PHRASELIST_UPDATE",146)
		    add_constant("DG_PHRASELIST_ITEM",147)
		    add_constant("DG_MENU_SPEAK",148)
		    add_constant("DG_THREEMINUTE",149)
		    add_constant("DG_FORTYFIVEMINUTE",150)
		    add_constant("DG_CHESS960",151)
		    add_constant("DG_COUNTRY",152)
		    add_constant("DG_FEATURES",153)
		    add_constant("DG_ERROR",154)
		    add_constant("DG_GROUP_INFO",155)
		    add_constant("DG_CHANNEL_INFO",156)
		    add_constant("DG_CHECKERS",157)
		    add_constant("DG_CLIENT_INFO",158)
		    add_constant("DG_ZRATING",159)
		    add_constant("DG_CORRESPONDENCE_MOVE",160)
		    add_constant("DG_CORRESPONDENCE_GAME",161)
		    add_constant("DG_NO_CORRESPONDENCE_GAME",162)
		    add_constant("DG_LIST_HEAD",163)
		    add_constant("DG_LIST_END",164)
		    add_constant("DG_LIST_ITEM",165)
		    add_constant("DG_LIST_ADDED",166)
		    add_constant("DG_LIST_REMOVED",167)
		    add_constant("DG_FAIL",168)
		    add_constant("DG_NOTE",169)
		    add_constant("DG_FIELD",170)
		    add_constant("DG_RATING",171)
		    add_constant("DG_END_PROFILE",172)
		    add_constant("DG_PSTAT2",173)
		    add_constant("DG_EXAMINERS_IN_GAME",174)
		    add_constant("DG_POOL_JOINED",175)
		    add_constant("DG_POOL_LEFT",176)
		    add_constant("DG_25_5",177)
		    add_constant("DG_LOGIN_LIST_FRIENDS",178)
		    add_constant("DG_LOGIN_LIST_ALIASES",179)
		    add_constant("DG_LOGIN_LIST_MESSAGES",180)
		    add_constant("DG_LOGIN_LIST_ROOMS",181)
		    add_constant("DG_LOGIN_LIST_ADJOURNED_GAMES",182)
		    add_constant("DG_LOGIN_LIST_LIBRARY_GAMES",183)
		    add_constant("DG_LOGIN_LIST_HISTORY_GAMES",184)
		    add_constant("DG_LOGIN_LIST_CENSORS",185)
		    add_constant("DG_AUTH_URL",186)
		    add_constant("DG_PGN",187)
		    add_constant("DG_IN_CHANNEL",188)
		    add_constant("DG_TABLE_SIZE",189)
		  #EndIf
		End Sub
	#tag EndMethod


	#tag ViewBehavior
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
