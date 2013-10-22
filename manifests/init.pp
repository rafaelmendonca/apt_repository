# == Class: apt_repository
#
#  Module to manage repository Debian.
# A Debian repository is a set of Debian packages organized in a special 
# directory tree which also contains a few additional files containing indexes and checksums of the packages.
# If a user adds a repository to his /etc/apt/sources.list file, he can easily view and install all the packages available in it just like the packages contained in Debian
#
# === Parameters
# [sections] 
#   Which sessions to update to repository. Example: 
#   .........................................
#   sections => ['main', 'contrib'],
#   .........................................
#  *** Default is ['main', 'contrib', 'non-free'],
#   
# [codename] 
#  The codename of distribution. Example (Debian): 
#   .........................................
#   codename => ['wheezy'],
#   .........................................
#  *** Default is value of facter "lsbdistcodename".
# 
# [os] 
#  What system operating ? . Example (Debian): 
#   .........................................
#   os => 'debian',
#   .........................................
#  *** Default is 'debian'
#
# [url_repo] 
#  Is the url of repository ? . Example (Debian): 
#   .........................................
#   url_repo => ['ftp.debian.org'],
#   .........................................
#  *** Default is null.
#

# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if it
#   has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should not be used in preference to class parameters  as of
#   Puppet 2.6.)
#
# === Examples
#
# class apt_repository {
#        case $::operatingsystem {
#                debian: {
#	  		apt_repository::mirror {'Debian Repository':
#				url_repo => ['ftp.debian.org'],
#       	    os       => 'debian',
#				codename => ['wheezy','wheezy-backports'],
#			}	
#                }
#                ubuntu: {
#	  		apt_repository::mirror {'Ubuntu Repository':
#				url_repo => ['br.archive.ubuntu.com'],
#               os       => 'ubuntu',
#				codename => ['precise','precise-updates'],
#				sections => ['main','contrib'],
#			}	
#
#                }
#        }
#
# === Authors
#
# Rafael Mendonca <rafaelmendonca3f@gmail.com>
#
# === Copyright
#
# Copyright 2013 Rafael Mendonca.
#
class apt_repository {
        case $::operatingsystem {
                debian: {
	  		apt_repository::mirror {'Debian Repository':
				url_repo => ['ftp.debian.org'],
       	        os       => 'debian',
				codename => ['wheezy'],
			}	
                }
                ubuntu: {
	  		apt_repository::mirror {'Ubuntu Repository':
				url_repo => ['br.archive.ubuntu.com','security.ubuntu.com'],
       	        os       => 'ubuntu',
				codename => ['precise','precise-updates'],
			}	

                }
        }
}
