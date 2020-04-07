#tag Class
Protected Class ICC_DG_data_game_unified
	#tag Method, Flags = &h0
		Function being_played() As boolean
		  Var rel As ICC_DG_data_game_relation=get_game_relation
		  //                         Var jbo As ICC_DG_data_jboard=get_jboard
		  If Not rel.being_played Then
		    Return False
		  End If
		  Return True
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  game_relation=New ICC_DG_data_game_relation
		  game_started_dg=New ICC_DG_data_my_game_started
		  jboard=New ICC_DG_data_jboard
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function get_game_relation() As ICC_DG_data_game_relation
		  return game_relation
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function get_game_started() As ICC_DG_data_my_game_started
		  return game_started_dg
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function get_jboard() As ICC_DG_data_jboard
		  return jboard
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function need_move_computed() As Boolean
		  If Not game_relation.being_played Then
		    Return False
		  End If
		  If jboard=Nil Then
		    Return False
		  End If
		  If Not ready_for_move Then
		    Return False
		  End If
		  Return True
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ready_for_move() As boolean
		  If Not being_played Then
		    Return False
		  End If
		  Var rel As ICC_DG_data_game_relation=get_game_relation
		  Var jbo As ICC_DG_data_jboard=get_jboard
		  Var my_color As Text=rel.get_my_color
		  Var color_on_move As Text=jbo.get_color_on_move
		  Return my_color=color_on_move
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub set_game_relation(arel as ICC_DG_data_game_relation)
		  rem ready_for_move=false
		  rem relation may change from PW say to SW (play white to simul white)
		  rem so setting relation doesn't hose ready_for_move
		  game_relation=arel
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub set_game_started(ags as ICC_DG_data_my_game_started)
		  game_started_dg=ags
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub set_jboard(ajb as ICC_DG_data_jboard)
		  jboard=ajb
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected game_relation As ICC_DG_data_game_relation
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected game_started_dg As ICC_DG_data_my_game_started
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected jboard As ICC_DG_data_jboard
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
