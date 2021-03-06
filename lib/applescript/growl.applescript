on run argv
	
	
	tell application "GrowlHelperApp"
		set the msg to item 1 of argv

		set myPath to POSIX path of (path to me as string) -- gets it in "/" form
		set ASTID to AppleScript's text item delimiters -- save 'em
		set AppleScript's text item delimiters to "/"
		set theFolder to (text 1 thru text item -2 of myPath) & "/" as Unicode text
		set AppleScript's text item delimiters to ASTID -- restore 'em

		-- Make a list of all the notification types 
		-- that this script will ever send:
		set the allNotificationsList to ¬
			{"Fire.app Notification"}
		
		-- Make a list of the notifications 
		-- that will be enabled by default.      
		-- Those not enabled by default can be enabled later 
		-- in the 'Applications' tab of the growl prefpane.
		set the enabledNotificationsList to ¬
			{"Fire.app Notification"}
		
		-- Register our script with growl.
		-- You can optionally (as here) set a default icon 
		-- for this script's notifications.
		register as application ¬
			"Fire.app" all notifications allNotificationsList ¬
			default notifications enabledNotificationsList ¬
			 icon of application "Script Editor"

		
		--       Send a Notification...
		notify with name ¬
			"Fire.app Notification" title ¬
			"Fire.app" description ¬
			msg application name "Fire.app" ¬ 
			image from location theFolder & "64.png"
		
		
	end tell
end run
