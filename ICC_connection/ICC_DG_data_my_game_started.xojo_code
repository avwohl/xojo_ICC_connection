#tag Class
Protected Class ICC_DG_data_my_game_started
	#tag Property, Flags = &h0
		black_inc As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		black_time As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		black_username As text
	#tag EndProperty

	#tag Property, Flags = &h0
		examine_description As Text
	#tag EndProperty

	#tag Property, Flags = &h0
		game_id As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		game_num As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		irregular_legality As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		irregular_semantics As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		is_examined As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		is_rated As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		pgn_time_control As text
	#tag EndProperty

	#tag Property, Flags = &h0
		promote_to_king_ok As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		rating_black As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		rating_name As text
	#tag EndProperty

	#tag Property, Flags = &h0
		rating_white As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		title_black As text
	#tag EndProperty

	#tag Property, Flags = &h0
		title_white As text
	#tag EndProperty

	#tag Property, Flags = &h0
		uses_plunkers As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		white_inc As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		white_time As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		white_username As text
	#tag EndProperty

	#tag Property, Flags = &h0
		wild As Integer
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
			Name="game_num"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="white_username"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="text"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="black_username"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="text"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="wild"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="rating_name"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="text"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="is_rated"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="white_time"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="white_inc"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="black_time"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="is_examined"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="examine_description"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Text"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="rating_white"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="rating_black"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="game_id"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="title_white"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="text"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="title_black"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="text"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="irregular_legality"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="irregular_semantics"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="uses_plunkers"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="pgn_time_control"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="text"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="promote_to_king_ok"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="black_inc"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
