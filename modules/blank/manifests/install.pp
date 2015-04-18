class blank::install inherits blank {

    notice("Processing ${name} class,...")
    notice("Version ${version} by ${author} on ${updated}")

    Package { allow_virtual => false }

}
