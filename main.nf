
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
