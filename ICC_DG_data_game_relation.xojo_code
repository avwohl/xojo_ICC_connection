#tag Class
Protected Class ICC_DG_data_game_relation
	#tag Method, Flags = &h0
		Function being_played() As Boolean
		  if game_num<0 then
		    return false
		  end if
		  if relation.length<2 then
		    return false
		  end if
		  var first_relation as text=relation.left(1)
		  rem playing?
		  if first_relation = "P" then
		    return true
		  end if
		  rem simul
		  if first_relation = "S" then
		    return true
		  end if
		  return false
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function get_my_color() As text
		  If Not being_played Then
		    Return "X"
		  End If
		  Return relation.Mid(1,1)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function get_opponent_color() As Text
		  Var myc As Text=get_my_color
		  If myc="W" Then
		    Return "B"
		  End If
		  If myc="B" Then
		    Return "W"
		  End If
		  Return myc
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		game_num As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		relation As text
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
			Name="relation"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="text"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
