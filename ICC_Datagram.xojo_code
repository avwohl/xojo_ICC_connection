#tag Class
Protected Class ICC_Datagram
	#tag Method, Flags = &h0
		Sub compute_nums()
		  for i as integer = 0 to ntokens-1
		    var val as text=tokens(i)
		    nums(i)=0
		    if AVW_util.isIntegerText(val) then
		      nums(i)=val(tokens(i))
		    end if
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  ntokens=0
		  state=ICC_Datagram.parse_states.ST_text
		  tokens.ResizeTo(ICC_Parse_12.MAX_P12_TOKENS)
		  Nums.ResizeTo(ICC_Parse_12.MAX_P12_TOKENS)
		  var empty_string as string = DefineEncoding("",Encodings.ASCII)
		  var empty_text as text = empty_string.ToText
		  for i as integer = 0 to ICC_Parse_12.MAX_P12_TOKENS-1
		    nums(i)=0
		    tokens(i)=empty_text
		  next i
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		ntokens As Integer = 0
	#tag EndProperty

	#tag Property, Flags = &h0
		nums() As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		state As parse_states = parse_states.ST_text
	#tag EndProperty

	#tag Property, Flags = &h0
		tokens() As Text
	#tag EndProperty


	#tag Enum, Name = parse_states, Type = Integer, Flags = &h0
		ST_text
		  ST_text_ctly
		  ST_open_l1
		  ST_open_l1_name
		  ST_in_l1
		  ST_in_l1_ctly
		  ST_nest_l1
		  ST_open_l2
		  ST_in_l2
		  ST_in_l2_in_sqiggly_quoted
		  ST_l2_ctly
		  ST_l2_quoted
		ST_l2_quoted_ctly
	#tag EndEnum


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
			Name="ntokens"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="state"
			Visible=false
			Group="Behavior"
			InitialValue="parse_states.ST_text"
			Type="parse_states"
			EditorType="Enum"
			#tag EnumValues
				"0 - ST_text"
				"1 - ST_text_ctly"
				"2 - ST_open_l1"
				"3 - ST_open_l1_name"
				"4 - ST_in_l1"
				"5 - ST_in_l1_ctly"
				"6 - ST_nest_l1"
				"7 - ST_open_l2"
				"8 - ST_in_l2"
				"9 - ST_in_l2_in_sqiggly_quoted"
				"10 - ST_l2_ctly"
				"11 - ST_l2_quoted"
				"12 - ST_l2_quoted_ctly"
			#tag EndEnumValues
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
