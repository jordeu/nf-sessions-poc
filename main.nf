#!/usr/bin/env nextflow

process notebook {
  container 'jupyter/minimal-notebook'
  script:
    """
    # Download boringproxy
    wget https://github.com/boringproxy/boringproxy/releases/download/v0.6.0/boringproxy-linux-x86_64 -q -O /tmp/bp

    # Make it executable
    chmod +x /tmp/bp

    # Start a reverse proxy connection on background
    /tmp/bp client -token ${params.token} -server bpdemo.brng.pro -user ${params.mail} -client-name nextflow -acme-email ${params.mail} &

    # Start the notebook
    start-notebook.sh
    """
}
