#
# Blank template based around Puppetlabs recommended module design
#

class blank (

    $author         = $blank::params::author,
    $version        = $blank::params::version,
    $updated        = $blank::params::updated,

) inherits blank::params {

    notice("Processing ${name} class,...")
    notice("Version ${version} by ${author} on ${updated}")

    anchor { 'blank::begin': }
    -> class { 'blank::install': }
    -> class { 'blank::config': }
    ~> class { 'blank::service': }
    -> class { 'blank::custom': }
    -> anchor { 'blank::end': }

}
