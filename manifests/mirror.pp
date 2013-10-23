define apt-repository::mirror (	
		$sections	= ['main', 'contrib', 'non-free'],
		$codename 	= ["${::lsbdistcodename}"],
		$os	= 'debian',
		$url_repo,
	) { 
	file {"/etc/apt/sources.list.d/${name}.list":
		ensure => present,
		mode	=> 0644,
		content => template('apt-repository/mirror.erb'),
	 }
	exec{"apt-repository::update::${name}":
		command		=>	'/usr/bin/apt-get update',
		subscribe	=>	File["/etc/apt/sources.list.d/${name}.list"],
	}

}

