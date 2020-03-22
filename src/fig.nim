import httpclient, os, parseopt, strutils

type URLArray = array[5, string]

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

proc downloadFile(urls: URLArray) =
  for url in urls:
    let splitUrl = url.split('/')
    let fileName = splitUrl[splitUrl.len() - 1]

    var client = newHttpClient()
    try:
      var file = open(fileName, fmWrite)
      defer: file.close()
      file.write(client.getContent(url))
      echo("Success - downloaded template to " & fileName)
    except IOError as err:
      echo("Failed to download template: " & err.msg)

proc cli() =
  var urls: URLArray = [
    "https://raw.githubusercontent.com/knipferrc/fig/master/configs/.prettierrc.js",
    "https://raw.githubusercontent.com/knipferrc/fig/master/configs/.editorconfig",
    "https://raw.githubusercontent.com/knipferrc/fig/master/configs/.eslintrc.js",
    "https://raw.githubusercontent.com/knipferrc/fig/master/configs/.prettierignore",
    "https://raw.githubusercontent.com/othneildrew/Best-README-Template/master/README.md"
  ]

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
      else:
        discard
    else:
      discard

    downloadFile(urls)

when isMainModule:
  cli()
