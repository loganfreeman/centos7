SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

source ${DIR}/functions.sh
echo 'enter docroot (default: current directory)'
read docroot
echo 'enter userid'
read userid
echo 'enter domain'
read 'domain'
if [ -z $docroot ]; then
  docroot=`pwd`
fi
create-site-dir
setupVhost $domain $userid $docroot
