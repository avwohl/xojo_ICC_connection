#tag Class
Protected Class ICC_DG_data_match
	#tag Property, Flags = &h0
		challenger_rating As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		challenger_rating_annotation As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		challenger_title As Text
	#tag EndProperty

	#tag Property, Flags = &h0
		challenger_username As text
	#tag EndProperty

	#tag Property, Flags = &h0
		match_color As integer
	#tag EndProperty

	#tag Property, Flags = &h0
		match_delta_rating1 As integer
	#tag EndProperty

	#tag Property, Flags = &h0
		match_delta_rating2 As integer
	#tag EndProperty

	#tag Property, Flags = &h0
		match_delta_rating3 As integer
	#tag EndProperty

	#tag Property, Flags = &h0
		match_inc As integer
	#tag EndProperty

	#tag Property, Flags = &h0
		match_rated As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		match_rating_type As text
	#tag EndProperty

	#tag Property, Flags = &h0
		match_resume As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		match_rinc As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		match_rtime As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		match_time As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		match_wild As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		recv_rating As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		recv_rating_annotation As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		recv_title As Text
	#tag EndProperty

	#tag Property, Flags = &h0
		recv_username As text
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
			Name="challenger_rating"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="challenger_rating_annotation"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="challenger_title"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Text"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="challenger_username"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="text"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="recv_rating"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="recv_rating_annotation"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="recv_username"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="text"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="match_wild"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="match_rating_type"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="text"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="match_time"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="match_inc"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="match_rtime"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="match_rinc"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="match_color"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="match_delta_rating1"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="match_delta_rating2"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="match_delta_rating3"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="match_rated"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="match_resume"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="recv_title"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Text"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
