class blank::custom inherits blank {
    
    notice("Processing ${name} class,...")
    notice("Version ${version} by ${author} on ${updated}")

    blank::defined { 'custom':
        version => '3.0.0',
    }

}
