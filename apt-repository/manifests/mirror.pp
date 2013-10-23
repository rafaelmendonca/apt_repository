define apt_repository::mirror (	
		$sections	= ['main', 'contrib', 'non-free'],
		$codename 	= ["${::lsbdistcodename}"],
		$os	        = 'debian',
		$url_repo,

	) { 
	file {'/etc/apt/sources.list':
		ensure      => present,
		mode    	=> 0644,
		content     => template('apt_repository/mirror.erb'),
	}
	exec{'apt_repository::update':
		command		=>	'/usr/bin/apt-get update',
		subscribe	=> 	File['/etc/apt/sources.list'],
	}
}
