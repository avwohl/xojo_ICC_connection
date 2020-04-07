#tag Class
Protected Class ICC_Parse_12
	#tag Method, Flags = &h0
		Sub alloc_token()
		  If(cur_dg.ntokens >= MAX_P12_TOKENS) Then
		    Return
		  End If
		  cur_dg.ntokens=cur_dg.ntokens+1
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(ahub as ICC_Hub)
		  icchub=ahub
		  init
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function consume_input(inbuf as Text) As boolean
		  Var inbuf_last As Integer = inbuf.Length-1
		  For idx As Integer = 0 To inbuf_last
		    Var ch As Integer
		    ch=Asc(inbuf.Mid(idx,1))
		    
		    Const CONTROL_J As Integer = 10
		    Const CONTROL_M As Integer = 13
		    Const CONTROL_Y As Integer = 25
		    Const LEFT_SQUARE As Integer = 91
		    Const RIGHT_SQUARE As Integer = 93
		    Const LEFT_PAREN As Integer =  40
		    Const RIGHT_PAREN As Integer = 41
		    Const LEFT_SQUIG As Integer = 123
		    Const RIGHT_SQUIG As Integer = 125
		    Const CHAR_SPACE As Integer = 32
		    Const CHAR_0 As Integer = 48
		    If ch=CONTROL_M Then
		      #If TargetWindows Then
		        ch=CONTROL_J
		      #ElseIf TargetMacOS
		        Continue
		      #ElseIf TargetLinux Then
		        ch=CONTROL_J
		      #Else
		        Continue
		      #EndIf
		    End If
		    Select Case cur_dg.state
		    Case ICC_Datagram.parse_states.ST_text
		      If (ch = CONTROL_Y) Then
		        finish_st_text
		        cur_dg.state=ICC_Datagram.parse_states.ST_text_ctly
		      Elseif (ch = CONTROL_J) Then
		        finish_st_text
		      Else
		        stuff_char(ch)
		      End If
		    Case ICC_Datagram.parse_states.ST_text_ctly
		      If(ch=RIGHT_SQUARE) Then
		        stuff_char(0)
		        If(cur_dg.ntokens > 0) Then
		          recieve_L1(cur_dg)
		        End If
		        If pop_cur_dg_fails("parse ] in text control-y") Then
		          Return True
		        End If
		      Elseif (ch = LEFT_SQUARE) Then
		        parser_recurse(ICC_Datagram.parse_states.ST_text,ICC_Datagram.parse_states.ST_open_l1)
		      Elseif (ch = LEFT_PAREN) Then
		        parser_recurse(ICC_Datagram.parse_states.ST_text,ICC_Datagram.parse_states.ST_open_l2)
		      End If
		    Case ICC_Datagram.parse_states.ST_open_L1
		      If (ch = CONTROL_Y) Then
		        Return jam(ch,"unexpected control-y inside L1")
		      End If
		      If(ch = CHAR_SPACE) Then
		        cur_dg.state=ICC_Datagram.parse_states.ST_open_l1_name
		      End If
		      If(AVW_util.IsDigit(ch)) Then
		        cur_dg.nums(cur_dg.ntokens-1)=cur_dg.nums(cur_dg.ntokens-1)*10+(ch-Char_0)
		        Var ach As String = Chr(ch)
		        cur_dg.tokens(cur_dg.ntokens-1)=cur_dg.tokens(cur_dg.ntokens-1)+ach.ToText
		      End If
		    Case ICC_Datagram.parse_states.ST_open_L1_name
		      If(ch=Control_Y) Then
		        Return jam(ch,"control y inside open L1 name")
		      End If
		      If (ch=Control_j) Then
		        cur_dg.state=ICC_Datagram.parse_states.ST_in_l1
		        stuff_char(0)
		        alloc_token
		      Else
		        stuff_char(ch)
		      End If
		    Case ICC_Datagram.parse_states.ST_in_L1 
		      If(ch=Control_Y) Then
		        cur_dg.state=ICC_Datagram.parse_states.ST_in_l1_ctly
		      Else
		        stuff_char(ch)
		      End If
		    Case ICC_Datagram.parse_states.ST_in_L1_ctly
		      If (ch=Left_SQUARE) Then
		        parser_recurse(ICC_Datagram.parse_states.ST_text,ICC_Datagram.parse_states.ST_open_l1)
		      Elseif (ch=RIGHT_SQUARE) Then
		        stuff_char(0)
		        recieve_L1(cur_dg)
		        If pop_cur_dg_fails("parse ] in L1 control-y") Then
		          Return True
		        End If
		      Elseif (ch=LEFT_PAREN) Then
		        parser_recurse(ICC_Datagram.parse_states.ST_in_L1,ICC_Datagram.parse_states.ST_open_l2)
		      Else
		        Return jam(ch,"in L1")
		      End If
		    Case ICC_Datagram.parse_states.ST_nest_l1
		      Return jam(ch,"in nest L1 1")
		    Case ICC_Datagram.parse_states.ST_open_l2
		      If(ch=Control_Y) Then
		        Return jam(ch,"in nest L1 2")
		      End if	
		      If(AVW_util.IsDigit(ch)) Then
		        cur_dg.nums(cur_dg.ntokens-1)=cur_dg.nums(cur_dg.ntokens-1)*10+(ch-Char_0)
		        Var ach As String = Chr(ch)
		        cur_dg.tokens(cur_dg.ntokens-1)=cur_dg.tokens(cur_dg.ntokens-1)+ach.ToText
		      End If
		      If(ch = CHAR_SPACE) Then
		        cur_dg.state=ICC_Datagram.parse_states.ST_in_L2
		      End If
		    Case ICC_Datagram.parse_states.ST_in_l2
		      If(ch=Control_Y) Then
		        cur_dg.state=ICC_Datagram.parse_states.ST_l2_ctly
		      Elseif (ch=LEFT_SQUIG) Then
		        cur_dg.state=ICC_Datagram.parse_states.ST_in_l2_in_sqiggly_quoted
		      Elseif (ch=RIGHT_SQUIG) Then
		        Return jam(ch,"right } in L2")
		      Elseif (ch=CHAR_SPACE) Then
		        stuff_char(0)
		        alloc_token
		      Else
		        stuff_char(ch)
		      End If
		    Case ICC_Datagram.parse_states.ST_in_l2_in_sqiggly_quoted
		      If(ch=Control_Y) Then
		        cur_dg.state=ICC_Datagram.parse_states.ST_l2_ctly
		      Elseif (ch=LEFT_SQUIG) Then
		        Return jam(ch,"left { in L2")
		      Elseif (ch=RIGHT_SQUIG) Then
		        rem don't make a blank token
		        rem alloc_token
		        cur_dg.state=ICC_Datagram.parse_states.ST_in_L2
		      Else
		        stuff_char(ch)
		      End If
		    Case ICC_Datagram.parse_states.ST_l2_ctly
		      If (ch=LEFT_SQUIG) Then
		        cur_dg.state=ICC_Datagram.parse_states.ST_l2_quoted
		      Elseif (ch=RIGHT_PAREN) Then
		        stuff_char(0)
		        cur_dg.compute_nums
		        ignore_boolean(recieve_L2(cur_dg))
		        If pop_cur_dg_fails("parse ] in L2 control-y") Then
		          Return True
		        End If
		      Else
		        Return jam(ch,"control-Y unexpect char")
		      End If
		    Case ICC_Datagram.parse_states.ST_l2_quoted
		      If (ch=Control_Y) Then
		        cur_dg.state=ICC_Datagram.parse_states.ST_l2_quoted_ctly
		      Else
		        stuff_char(ch)
		      End If
		    Case ICC_Datagram.parse_states.ST_l2_quoted_ctly
		      If (ch <> RIGHT_SQUIG) Then
		        Return jam(ch,"right squig in L2 quoted controly")
		      End If
		      cur_dg.state=ICC_Datagram.parse_states.ST_in_l2
		    Case Else
		      Return jam(ch,"bad state in main parse loop")
		    End
		  Next
		  rem flush output during login so the partial line login: show sup
		  If cur_dg.state = ICC_Datagram.parse_states.ST_text Then
		    stuff_char(0)
		  End If
		  Return False
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub finish_st_text()
		  If(cur_dg.tokens(0).length > 0) Then
		    stuff_char(0)
		    Var ok As Boolean
		    ok=recieve_text(cur_dg.tokens(0))
		  End If
		  init
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub init()
		  cur_dg=New ICC_Datagram
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function jam(badstuff as integer,jam_description as text) As boolean
		  Var result As Boolean=icchub.jam(badstuff,jam_description)
		  init
		  Return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub parser_recurse(backtrack_to as ICC_Datagram.parse_states, new_state as ICC_Datagram.parse_states)
		  cur_dg.state=backtrack_to
		  saved_parse.AddRow(cur_dg)
		  cur_dg=New ICC_Datagram
		  alloc_token
		  cur_dg.nums(cur_dg.ntokens-1)=0
		  cur_dg.tokens(cur_dg.ntokens-1)=""
		  cur_dg.state=new_state
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function pop_cur_dg_fails(fail_mesg as string) As Boolean
		  If saved_parse.Count < 1 Then
		    Var jam_result As Boolean=jam(23,fail_mesg.ToText)
		    rem maybe find a way to return this
		    #Pragma Unused jam_result
		    Return True
		  End If
		  cur_dg=saved_parse.pop
		  Return False
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub recieve_L1(a_dg As ICC_Datagram)
		  icchub.recieve_L1(a_dg)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function recieve_L2(a_dg as ICC_Datagram) As boolean
		  rem don't add code here for your datagrams
		  rem in the example look for XojoTestBotHub function recieve_L2
		  Return icchub.recieve_L2(a_dg)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function recieve_text(astr as text) As boolean
		  return icchub.recieve_text(astr)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub stuff_char(ch as integer)
		  rem the c++ code used this to handle end of string not needed here
		  rem maybe remove and remove sutff_char(0) calls
		  ch=bitand(ch,127)
		  If ( ch = 0 ) Then
		    Return
		  End If
		  If(cur_dg.tokens(cur_dg.ntokens).length >=MAX_P12_LEN) Then
		    Return
		  End If
		  cur_dg.tokens(cur_dg.ntokens)=cur_dg.tokens(cur_dg.ntokens)+Encodings.ASCII.Chr(ch).ToText
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		cur_dg As ICC_Datagram
	#tag EndProperty

	#tag Property, Flags = &h0
		icchub As ICC_Hub
	#tag EndProperty

	#tag Property, Flags = &h0
		saved_parse() As ICC_Datagram
	#tag EndProperty


	#tag Constant, Name = MAX_P12_LEN, Type = Double, Dynamic = False, Default = \"90000", Scope = Public
	#tag EndConstant

	#tag Constant, Name = MAX_P12_TOKENS, Type = Double, Dynamic = False, Default = \"30", Scope = Public
	#tag EndConstant


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
	#tag EndViewBehavior
End Class
#tag EndClass
