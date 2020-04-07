#tag Class
Protected Class ICC_DG_data_my_game_result
	#tag Property, Flags = &h0
		description As text
	#tag EndProperty

	#tag Property, Flags = &h0
		eco As text
	#tag EndProperty

	#tag Property, Flags = &h0
		examined As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		game_num As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		result As text
	#tag EndProperty

	#tag Property, Flags = &h0
		score As text
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
	#tag EndViewBehavior
End Class
#tag EndClass
