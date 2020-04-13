#tag Class
Protected Class ICC_DG_data_jboard
	#tag Method, Flags = &h0
		Function get_color_on_move() As text
		  Return color_on_move
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub other_player_is_up(myg as ICC_DG_data_game_unified)
		  Var my_color As Text=myg.get_game_relation.get_my_color
		  If my_color <> get_color_on_move Then
		    Return
		  End If
		  color_on_move=myg.get_game_relation.get_opponent_color
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub set_color_on_move(new_color as text)
		  color_on_move=new_color
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		board As text
	#tag EndProperty

	#tag Property, Flags = &h0
		castle_kingside_black As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		castle_kingside_white As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		castle_queenside_black As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		castle_queenside_white As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		clock_black As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		clock_white As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		color_on_move As text
	#tag EndProperty

	#tag Property, Flags = &h0
		double_push As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		flip As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		game_num As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		last_move_algeb As text
	#tag EndProperty

	#tag Property, Flags = &h0
		last_move_smith As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		move_number As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		played_status As Integer
	#tag EndProperty


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
		#tag ViewProperty
			Name="board"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="text"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="game_num"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="castle_kingside_black"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="castle_kingside_white"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="castle_queenside_black"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="castle_queenside_white"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="clock_black"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="clock_white"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="color_on_move"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="text"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="double_push"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="flip"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="last_move_algeb"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="text"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="last_move_smith"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="move_number"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="played_status"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
