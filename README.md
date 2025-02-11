# Automatic qBittorrent Port Updater for ProtonVPN

## fork changes
restart qbittorrent if crash window detected
https://github.com/qbittorrent/qBittorrent/issues/17082

This application will monitor the Windows ProtonVPN client log files for port changes and pass them via the qBittorrent WebUI.

In order to clone this repository you need to use the following command, or it wont clone the linked submodules
"git clone --recurse-submodules https://github.com/UHAXM1/Quantum"

Quantum uses the linked submodule qBittorrent-net-client found here
https://github.com/fedarovich/qbittorrent-net-client

Tested with ProtonVPN version 3.3.2

Requires .Net 8

Simply install and provide connection information to qBittorrent, Quantum will automatically try to find the ProtonVPN log directory

Quantum will check the logs files once every minute.

Detailed setup steps:

qBittorrent Setup

	Open qBittorrent:
		Launch qBittorrent on your computer.
 
	Access Preferences:
		Go to Tools > Options or press Alt + O to open the preferences window.

	Enable WebUI:
		In the preferences window, select the Web UI section.
		Check the box for Enable Web User Interface (Remote control).
		You can leave the default IP address (usually 127.0.0.1 for local access) and Port (default is 8080), or change them if needed.

	Set Authentication:
		Under Authentication, check the box for Use a username and password.
		Enter a Username (default is admin).
		Enter and confirm a Password.
		Optionally you can enable Bypass authentication for clients on localhost, if you just set this you can leave the username and password blank.

	Configure IP and Port:
		If you want to access the WebUI from other devices on your network, you may need to change the IP address to 0.0.0.0 to allow access from all network interfaces.
		Make sure the port you are using is not blocked by your firewall.

	Security Options:
		Optionally, you can set up an IP filter to restrict which IP addresses can access the WebUI.
		You can also enable HTTPS to secure the connection by providing an SSL certificate and key.

	Apply and Save:
		Click Apply and then OK to save your settings.

	Access the WebUI:
		Open a web browser and go to http://: (e.g., http://127.0.0.1:8080 for local access).
		Log in with the username and password you set.
	
Quantum setup

	Open Quantum:
		Launch Quantum on your computer, if this is your first time running Quantum it will popup on screen, if it does not appear check the system tray and double-click the icon.
		
	Startup:
		Enable or Disable Quantum from running when the user logs into the computer, this is account specific.
		
	Log File Location:
		Quantum will try to find the ProtonVPN log file automatically, however if you prefer you can select the location manually, note that you do it manually you need to update the location each time after you update ProtonVPN, I suggest you leave this setting on automatic.
		
	qBittorrent Configuration:
		Host: this should be 'http://127.0.0.1:8080' by default, if you are not using the default port or want to connect to a remote instance change the ip and port number here, if you are using SSL you need to change http to https.
		Username and Password: Input the username and password you setup in the qBittorrent setup above, if you have enabled Bypass authentication for client on localhost and are local you can leave this blank.
		
	Test/Save/Update Port Now:
		This button is dynamic and changes function depending on what has been selected above.
		'Test\Save' will test then save the current configuration if it connects, you will get a popup telling you if the connection is a successful.
		'Update Port Now' will force Quantum to update the port right away without waiting for the timer to count down.

Setup should now be complete, you can close Quantum by clicking the close window button (it will minimize to the system tray).