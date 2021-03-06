while getopts u:p: option; do
	case "${option}" in
	    u) username=${OPTARG}
		;;
	    p) password=${OPTARG}
		;;
	esac
done
if [ -z ${username} ]; then
  echo "username not entered"
  exit 1
fi

if [ -z ${password} ]; then
    password=${username}
fi 
su postgres -c "create role ${username}"
su postgres -c "alter role ${username} with LOGIN"
su postgres -c "alter role ${username} with password ${password}"
su postgres -c "create database ${username}"
su postgres -c "grant all on database ${username} to ${username}"
