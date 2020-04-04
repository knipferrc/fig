import os, parseopt

import templates

proc writeHelp() =
  echo """
  Fig (download common config files)

  Allowed arguments:

  - h | --help : show help
  - v | --version : show version
  - d | --default : dowloads "basic configs for different projects"
  - t | --template : downloads configs based on a template
                      
      Available templates
      ---------------------
      -t=react-typescript
      -t=react-javascript
      -t=svelte
    """

proc writeVersion() =
  echo "FIG config file downloader 0.0.3"

proc writeConfigs(configs: seq[Template]) =
  for config in configs:
    try:
      var file = open(config.filename, fmWrite)
      defer: file.close()
      file.write(config.content)
      echo("Success - wrote config to " & config.filename)
    except IOError as err:
      echo("Failed to generate config: " & err.msg)

  echo("Success, finished generating configs")

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
  of "react-javascript":
    writeConfigs(reactJavascriptTemplate)
  of "react-typescript":
    writeConfigs(reactTypescriptTemplate)
  of "svelte":
    writeConfigs(svelteTemplate)
  else:
    echo("Invalid template")
    quit(0)

when isMainModule:
  cli()
