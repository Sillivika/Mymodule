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
		provider => "systemd",
	}
}
