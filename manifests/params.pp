class basepack::params {
  $osr_array = split($::operatingsystemrelease,'[\/\.]')
  $distrelease = $osr_array[0]
  if ! $distrelease {
    fail("Class['basepack::params']: Unparsable \$::operatingsystemrelease: ${::operatingsystemrelease}")
  }

  if($::fqdn) {
    $servername = $::fqdn
  } else {
    $servername = $::hostname
  }

  if $::osfamily == 'RedHat' or $::operatingsystem == 'amazon' {
    $basepack_list	= [ "make", "crontabs", "sysstat", "cronie", "cronie-anacron", "mailx", "logwatch", "dos2unix", "unix2dos", "sudo", "setools-console", "perl" ]
  } else {
    fail("Class['basepack::params']: Unsupported osfamily: ${::osfamily}")
  }
}

