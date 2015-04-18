define blank::defined (

    $author     = $blank::params::author,
    $version    = $blank::params::version,
    $updated    = $blank::params::updated,

) {
    
    notice("Processing ${name} class,...")
    notice("Version ${version} by ${author} on ${updated}")

}
