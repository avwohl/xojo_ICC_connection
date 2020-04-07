#tag Class
Protected Class ICC_DX_debug_base
	#tag Method, Flags = &h0
		Sub add_constant(dg_name as string, dg_num as integer)
		  name_map(dg_num)=dg_name
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub add_constants()
		  rem place holder for override in subclass
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  add_constants
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function get_datagram_name(dg_num as integer) As text
		  var result as text = ""
		  if dg_num >= 0 and dg_num <= name_map.LastRowIndex then
		    result=AVW_util.to_text(name_map(dg_num))
		  end if
		  if result.Length() < 1 then
		    result=AVW_util.to_text("dgx_"+str(dg_num))
		  end if
		  return result
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub set_max(amax as integer)
		  name_map.ResizeTo(amax)
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		name_map() As string
	#tag EndProperty


	#tag Constant, Name = INCLUDE_DATAGRAM_NAMES, Type = Boolean, Dynamic = False, Default = \"true", Scope = Public
	#tag EndConstant


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
