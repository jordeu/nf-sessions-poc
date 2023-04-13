nextflow.enable.dsl = 2

process session {
  input:
    val cmd
  script:
    """
    ${cmd}
    """
}

workflow {
  session(params.cmd)
}
