class mymodule {
	file {"/usr/share/xfce4/backdrops/wallE.jpg":
		source =>"puppet:///modules/mymodule/oma.jpg",
	}
	file {"/usr/share/xfce4/backdrops/xubuntu-wallpaper.png":
		ensure => "link",
		target => "/usr/share/xfce4/backdrops/wallE.jpg",
		notify => Service ["lightdm"],
	}
	service {"lightdm":
		ensure => "running",
		enable => "true",
		require => File['/home/cube/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-desktop.xml'],
		provider => "systemd",
	}
	file { "/home/cube/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-desktop.xml":
		content => template("mymodule/xfce4-desktop.xml"),
		require => File['/usr/share/xfce4/backdrops/xubuntu-wallpaper.png'],
	}
}
