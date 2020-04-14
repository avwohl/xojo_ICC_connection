#tag Class
Protected Class ICC_Hub
	#tag Method, Flags = &h0
		Sub ask_keepalive(user_name as string)
		  send_line("/tell "+user_name+" keep_alive")
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  dg_map=New ICC_connection.ICC_DG_debug
		  xcn_map=New ICC_XCN_debug
		  rem allow connect to have the full keepalive time to work
		  got_keep_alive
		  rem send a keepalive request as soon as possible
		  update_next_keep_alive_ticks_time=0
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub debug_print(atxt as text)
		  rem implemented in a subclass that can tell where to send the debug output
		  #pragma Unused atxt
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub debug_print_string(astr as string)
		  debug_print(astr.ToText)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub got_keep_alive()
		  Var die_if_no_response_in_ticks As Integer=app.settings.get_integer("die_if_no_icc_response_seconds")*60
		  keep_alive_timeout=System.Ticks+die_if_no_response_in_ticks
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub handle_timeouts()
		  maybe_ask_keepalive
		  timeout_keep_alive
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function jam(jam_code as integer, jam_text as text) As Boolean
		  rem debugging output uses vars in sub class in an app dependant way
		  #pragma unused jam_code
		  #pragma unused jam_text
		  return true
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub make_ICC_Net()
		  rem if using a subclass of ICC_Net have your hub override this method to create it
		  iccnet=New ICC_net(Self)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub maybe_ask_keepalive()
		  rem If Not icc_net.IsConnected Then
		  rem Return
		  rem End If
		  rem wait till connected and username comes in
		  If user_name.length<1 Then
		    Return
		  End If
		  If System.Ticks < update_next_keep_alive_ticks_time Then
		    Return
		  End If
		  ask_keepalive(user_name)
		  update_next_keep_alive_ticks
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub NetEventConnected()
		  rem fill in this function in a subclass not here
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub NetEventDataReceived()
		  Var inbuf As String
		  inbuf=iccnet.readall
		  rem var c as TextConverter
		  rem c=GetTextConverter(GetTextEncoding(&h0201),Encodings.UTF8)
		  rem atext=c.convert(astr).ToText
		  Var atext As Text
		  If(inbuf.length < 1) Then
		    debug_print_string("readall returned no characters")
		    Return
		  end if
		  rem atext=inbuf.defineEncoding(Encodings.ASCII).ToText
		  atext=inbuf.DefineEncoding(Encodings.WindowsANSI).ToText
		  if iccparse.consume_input(atext) then
		    parse_failed(atext)
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub NetEventError(err as RuntimeException)
		  rem This function is to be filled in in a subclass so param unused here
		  #pragma Unused err
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub NetEventSendCompleted(userAborted as Boolean)
		  rem This function is to be filled in in a subclass so param unused here
		  #pragma Unused userAborted
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function NetEventSendProgressed(bytesSent as Integer, bytesLeft as Integer) As Boolean
		  rem This function is to be filled in in a subclass so param unused here
		  #pragma Unused bytesSent
		  #pragma Unused bytesLeft
		  rem return false to keep going true to quit sending
		  return false
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub parse_failed(atext as text)
		  rem consume input jammed on this input
		  rem should not happen
		  rem this function is to be filled in a subclass so args not used here
		  #pragma unused atext
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub print_dg(description as string, dg_name as text, a_dg as ICC_connection.ICC_Datagram)
		  var result as text
		  result=AVW_util.to_text(description)+AVW_util.to_text(" ")+dg_name
		  if a_dg.ntokens> 0 then
		    for i as integer=0 to a_dg.ntokens
		      result=result+AVW_util.to_text(" '")+a_dg.tokens(i)+AVW_util.to_text("'")
		    next i
		  end if
		  debug_print(result)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub recieve_L1(a_dg As ICC_connection.ICC_Datagram)
		  rem this function is to be filled in a subclass so args not used here
		  #pragma unused a_dg
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function recieve_L2(a_dg as ICC_connection.ICC_Datagram) As boolean
		  Var dgram_num As Integer = a_dg.nums(0)
		  print_dg("L2",dg_map.get_datagram_name(dgram_num),a_dg)
		  If dgram_num = ICC_connection.ICC_DG.DG_WHO_AM_I Then
		    Return recieve_L2_who_am_i(a_dg.tokens(1),a_dg.tokens(2)) 
		  End If
		  If dgram_num = ICC_connection.ICC_DG.DG_PERSONAL_TELL Then
		    Return recieve_L2_personal_tell(a_dg.tokens(1),a_dg.tokens(2),a_dg.tokens(3),a_dg.nums(4))
		  End If
		  If dgram_num = ICC_connection.ICC_DG.DG_MY_GAME_STARTED Then
		    Var myg As ICC_connection.ICC_DG_data_my_game_started = New ICC_connection.ICC_DG_data_my_game_started
		    myg.game_num=a_dg.nums(1)
		    myg.white_username=a_dg.tokens(2)
		    myg.black_username=a_dg.tokens(3)
		    myg.wild=a_dg.nums(4)
		    myg.rating_name=a_dg.tokens(5)
		    myg.is_rated=a_dg.nums(6)
		    myg.white_time=a_dg.nums(7)
		    myg.white_inc=a_dg.nums(8)
		    myg.black_time=a_dg.nums(9)
		    myg.black_inc=a_dg.nums(10)
		    myg.is_examined=a_dg.nums(11)
		    myg.examine_description=a_dg.tokens(12)
		    myg.rating_white=a_dg.nums(13)
		    myg.rating_black=a_dg.nums(14)
		    myg.game_id=a_dg.nums(15)
		    myg.title_white=a_dg.tokens(16)
		    myg.title_black=a_dg.tokens(17)
		    myg.title_white=a_dg.tokens(18)
		    myg.irregular_legality=a_dg.nums(19)
		    myg.irregular_semantics=a_dg.nums(20)
		    myg.uses_plunkers=a_dg.nums(21)
		    myg.pgn_time_control=a_dg.tokens(22)
		    myg.promote_to_king_ok=a_dg.nums(23)
		    Return recieve_L2_my_game_started(myg)
		  End If
		  If dgram_num = ICC_connection.ICC_DG.DG_MY_GAME_RESULT Then
		    Var myr As ICC_connection.ICC_DG_data_my_game_result=New ICC_connection.ICC_DG_data_my_game_result
		    myr.game_num=a_dg.nums(1)
		    myr.examined=a_dg.nums(2)
		    myr.result=a_dg.tokens(3)
		    myr.score=a_dg.tokens(4)
		    myr.description=a_dg.tokens(5)
		    myr.eco=a_dg.tokens(6)
		    Return recieve_L2_my_game_result(myr)
		  End If
		  If dgram_num = ICC_connection.ICC_DG.DG_MY_RELATION_TO_GAME Then
		    Var myre As ICC_connection.ICC_DG_data_game_relation
		    myre.game_num=a_dg.nums(1)
		    myre.relation=a_dg.tokens(2)
		    Return recieve_L2_my_relation_to_game(myre)
		  End If
		  If dgram_num = ICC_connection.ICC_DG. DG_JBOARD Then
		    Var myj As ICC_connection.ICC_DG_data_jboard = New ICC_connection.ICC_DG_data_jboard
		    myj.game_num=a_dg.nums(1)
		    myj.board=a_dg.tokens(2)
		    myj.color_on_move=a_dg.tokens(3)
		    myj.move_number=a_dg.nums(4)
		    myj.double_push=a_dg.nums(5)
		    myj.last_move_algeb=a_dg.tokens(6)
		    myj.last_move_smith=a_dg.nums(7)
		    myj.clock_white=a_dg.nums(8)
		    myj.clock_black=a_dg.nums(9)
		    myj.played_status=a_dg.nums(10)
		    myj.flip=a_dg.nums(11)
		    Return recieve_L2_jboard(myj)
		  End If
		  If dgram_num = ICC_connection.ICC_DG.DG_MATCH Then
		    Var adat As ICC_connection.ICC_DG_data_match = New ICC_connection.ICC_DG_data_match
		    adat.challenger_username=a_dg.tokens(1)
		    adat.challenger_rating=a_dg.nums(2)
		    adat.challenger_rating_annotation=a_dg.nums(3)
		    adat.challenger_title=a_dg.tokens(4)
		    adat.recv_username=a_dg.tokens(5)
		    adat.recv_rating=a_dg.nums(6)
		    adat.recv_rating_annotation=a_dg.nums(7)
		    adat.recv_title=a_dg.tokens(8)
		    adat.match_wild=a_dg.nums(9)
		    adat.match_rated=a_dg.nums(10)
		    adat.match_resume=a_dg.nums(11)
		    adat.match_time=a_dg.nums(12)
		    adat.match_inc=a_dg.nums(13)
		    adat.match_rtime=a_dg.nums(14)
		    adat.match_rinc=a_dg.nums(15)
		    adat.match_color=a_dg.nums(16)
		    adat.match_delta_rating1=a_dg.nums(17)
		    adat.match_delta_rating2=a_dg.nums(18)
		    adat.match_delta_rating3=a_dg.nums(19)
		    Return recieve_L2_match(adat)
		  End If
		  If dgram_num = ICC_connection.ICC_DG.DG_MSEC Then
		    // todo
		    Return False
		  End If
		  If dgram_num = ICC_connection.ICC_DG.DG_ILLEGAL_MOVE Then
		    rem todao
		    Return False
		  End If
		  If dgram_num = ICC_connection.ICC_DG.DG_OFFERS_IN_MY_GAME Then
		    // todo
		    Return false
		  End If
		  print_dg("UNHANDLED L2",dg_map.get_datagram_name(dgram_num),a_dg)
		  Return False
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function recieve_L2_jboard(myj as ICC_connection.ICC_DG_data_jboard) As Boolean
		  rem abstract method
		  #Pragma unused myj
		  Return False
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function recieve_L2_match(adat as ICC_connection.ICC_DG_data_match) As Boolean
		  rem abstract method
		  #Pragma unused adat
		  Return false
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function recieve_L2_my_game_result(myr as ICC_connection.ICC_DG_data_my_game_result) As boolean
		  rem abstract method
		  #pragma unused myr
		  Return False
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function recieve_L2_my_game_started(myg AS ICC_connection.ICC_DG_data_my_game_started) As boolean
		  rem abstract method
		  #Pragma unused myg
		  Return False
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function recieve_L2_my_relation_to_game(myr as ICC_connection.ICC_DG_data_game_relation) As boolean
		  // abstract method
		  #Pragma unused myr
		  Return True
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function recieve_L2_personal_tell(from as text, title as text, mesg as text, tell_type as integer) As boolean
		  If from=user_name Then
		    Return recieve_self_tell(title,mesg,tell_type)
		  End If
		  Return False
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function recieve_L2_who_am_i(handle as text, titles as text) As boolean
		  #pragma unused titles
		  user_name=handle
		  Return True
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function recieve_self_tell(title as string, mesg as string, tell_type as integer) As boolean
		  rem recieve a tell to myself used for keepalive
		  #Pragma unused tell_type
		  #pragma unused title
		  If(mesg = "keep_alive") Then
		    got_keep_alive
		    Return True
		  End If
		  Return False
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function recieve_text(atext as text) As boolean
		  rem this function is to be filled in a subclass so args not used here
		  #pragma unused atext
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub send_line(astr as string)
		  iccnet.Write(astr+Chr(10))
		  If app.settings.get_integer("debug_data_to_icc")>0 Then
		    debug_print_string("icc>"+astr)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setup_L2(some_L2 as integer)
		  while (login_L2_settings.Length()<=some_L2)
		    login_L2_settings=login_L2_settings+"0"
		  wend
		  var astr as string=login_L2_settings.Left(some_L2)+"1"+login_L2_settings.Middle(some_L2+1)
		  login_L2_settings=astr
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub shutdown()
		  if iccnet<>nil then
		    iccnet.shutdown
		  end if
		  iccnet=nil
		  logged_in=false
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub startup()
		  login_L2_settings="0"
		  shutdown()
		  iccparse=New ICC_Parse_12(Self)
		  make_ICC_Net
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub timeout_keep_alive()
		  If System.Ticks<keep_alive_timeout Then
		    Return
		  End If
		  Raise New ICC_Net_error_keep_alive("keep alive failure")
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub update_next_keep_alive_ticks()
		  rem send a keepalive every 50 seconds
		  Var keep_alive_tick_often As Integer=app.settings.get_integer("ask_icc_every_seconds")*60
		  update_next_keep_alive_ticks_time=System.Ticks+keep_alive_tick_often
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected dg_map As ICC_connection.ICC_DG_debug
	#tag EndProperty

	#tag Property, Flags = &h0
		iccnet As ICC_Net
	#tag EndProperty

	#tag Property, Flags = &h0
		iccparse As ICC_Parse_12
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected keep_alive_timeout As Integer = 0
	#tag EndProperty

	#tag Property, Flags = &h0
		logged_in As Boolean = false
	#tag EndProperty

	#tag Property, Flags = &h0
		login_L2_settings As String
	#tag EndProperty

	#tag Property, Flags = &h0
		update_next_keep_alive_ticks_time As Integer = 0
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected user_name As Text
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected xcn_map As ICC_XCN_debug
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
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
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
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
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="logged_in"
			Visible=false
			Group="Behavior"
			InitialValue="false"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="login_L2_settings"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="update_next_keep_alive_ticks_time"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
