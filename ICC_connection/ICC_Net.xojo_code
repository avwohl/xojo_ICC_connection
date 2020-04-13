#tag Class
Protected Class ICC_Net
Inherits TCPSocket
	#tag Event
		Sub Connected()
		  icchub.NetEventConnected
		End Sub
	#tag EndEvent

	#tag Event
		Sub DataAvailable()
		  icchub.NetEventDataReceived
		End Sub
	#tag EndEvent

	#tag Event
		Sub Error(err As RuntimeException)
		  icchub.NetEventError(err)
		End Sub
	#tag EndEvent

	#tag Event
		Sub SendComplete(userAborted as Boolean)
		  icchub.NetEventSendCompleted(userAborted)
		End Sub
	#tag EndEvent

	#tag Event
		Function SendProgress(bytesSent as Integer, bytesLeft as Integer) As Boolean
		  rem return true to cancel sending
		  return icchub.NetEventSendProgressed(bytesSent,bytesLeft)
		End Function
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Constructor(ahub as ICC_Hub)
		  // Calling the overridden superclass constructor.
		  // Note that this may need modifications if there are multiple constructor choices.
		  // Possible constructor calls:
		  // Constructor() -- From TCPSocket
		  // Constructor() -- From SocketCore
		  icchub=ahub
		  Super.Constructor
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub shutdown()
		  Disconnect
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub start_connection(aport as integer, host as string)
		  Address=host
		  Port=aport
		  Connect
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		icchub As ICC_Hub
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Address"
			Visible=true
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue=""
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
			Name="Port"
			Visible=true
			Group="Behavior"
			InitialValue="0"
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
	#tag EndViewBehavior
End Class
#tag EndClass
