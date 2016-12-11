class mymodule {
	file {"/usr/share/xfce4/backdrops/wallE.jpg":
		source =>"puppet:///modules/mymodule/oma.jpg",
	}
	file {"/usr/share/xfce4/backdrops/xubuntu-wallpaper.png":
		ensure => "link",
		target => "/usr/share/xfce4/backdrops/wallE.jpg",
	}
	service {"lightdm":
		ensure => "running",
		enable => "true",
		require => File['/home/cube/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-desktop.xml'],
		provider => "systemd",
	}
	file { "/home/cube/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-desktop.xml":
		content => template("mymodule/xfce4-desktop.xml"),
	}
	file { "/home/cube/.config/xfce4/terminal/terminalrc":
		content => template("mymodule/terminalrc"),
	}
	file { "/etc/lightdm/lightdm-gtk-greeter.conf":
		content => template("mymodule/lightdm-gtk-greeter.conf"),
	}
	package { "google-chrome-stable_current_amd64.deb":
		provider => dpkg,
		source => "/etc/puppet/modules/mymodule/files/google-chrome-stable_current_amd64.deb",
		require => Package ["libappindicator1"],
	}
	Package {ensure => "installed", allowcdrom => "true"}
	
	package {libappindicator1:}
	package {google-chrome-stable:}
}
