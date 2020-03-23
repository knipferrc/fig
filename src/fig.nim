import httpclient, os, parseopt, strutils

import projecttypes

proc writeHelp() =
  echo """
  Fig (download common config files)

  Allowed arguments:

  - h | --help : show help
  - v | --version : show version
  - d | --default : dowloads "basic configs for javascript projects"
    """

proc writeVersion() =
  echo "FIG config file downloader 0.1.0"

proc downloadTemplate(urls: seq[string]) =
  for url in urls:
    let splitUrl = url.split('/')
    let fileName = splitUrl[splitUrl.len() - 1]

    var client = newHttpClient()
    try:
      var file = open(fileName, fmWrite)
      defer: file.close()
      file.write(client.getContent(url))
      echo("Success - downloaded file to " & fileName)
    except IOError as err:
      echo("Failed to download file: " & err.msg)

proc cli() =
  var currentTemplate = "react-javascript"

  if paramCount() == 0:
    writeHelp()
    quit(0)

  for kind, key, val in getopt():
    case kind
    of cmdLongOption, cmdShortOption:
      case key
      of "help", "h":
        writeHelp()
        quit()
      of "version", "v":
        writeVersion()
        quit()
      of "d", "default": discard
      of "t", "template":
        echo val
        currentTemplate = val
      else:
        discard
    else:
      discard

  case currentTemplate
  of "react-typescript":
    downloadTemplate(reactTypescriptTemplate)
  of "react-javascript":
    downloadTemplate(reactJavascriptTemplate)
  of "svelte":
    downloadTemplate(svelteTemplate)
  else:
    echo("Invalid template")
    quit(0)

when isMainModule:
  cli()
