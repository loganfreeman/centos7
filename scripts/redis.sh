echo "Installing Redis: STABLE"

mkdir /opt/redis
cd /opt/redis
wget http://download.redis.io/redis-stable.tar.gz
tar xvzf redis-stable.tar.gz
cd redis-stable
make

cp src/redis-server /usr/local/bin/
cp src/redis-cli /usr/local/bin/

mkdir /etc/redis
mkdir /var/redis

cp utils/redis_init_script /etc/init.d/redis_6379
cp redis.conf /etc/redis/6379.conf
mkdir /var/redis/6379

# Set daemonize to yes
sed -i 's/daemonize no/daemonize yes/' /etc/redis/6379.conf
# Set the pidfile to /var/run/redis_6379.pid
sed -i s,pidfile\ /var/run/redis.pid,pidfile\ /var/run/redis_6379.pid, /etc/redis/6379.conf
# Set your preferred loglevel
sed -i s,loglevel\ notice,loglevel\ debug, /etc/redis/6379.conf
# change the logfile
sed -i s,logfile.*,logfile\ /var/log/redis_6379.log, /etc/redis/6379.conf
# set the Directory
sed -i s,^dir.*,dir\ /var/redis/6379, /etc/redis/6379.conf

/etc/init.d/redis_6379 start
