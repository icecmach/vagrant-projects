echo "---- Install dependencies ----"
dnf install -y make gcc tar gzip flex bison perl libicu-devel readline-devel

echo "---- Install postgres from source ----"
cd /home/vagrant
cp /vagrant/software/postgresql-18.1.tar.gz .
tar -zxf postgresql-18.1.tar.gz
cd postgresql-18.1

echo "---- Build ----"
./configure
make -s
make install

echo "---- Create user and directories ----"
adduser postgres
mkdir -p /usr/local/pgsql/data
chown -R postgres:postgres /usr/local/pgsql
mkdir /home/postgres/scripts
cp /vagrant/scripts/setEnv.sh /home/postgres/scripts
/bin/cp -f -p /vagrant/scripts/.bash_profile /home/postgres
chmod u+x /home/postgres/scripts/*.sh
chown -R postgres:postgres /home/postgres/

echo "---- Initialize db ----"
su - postgres <<'EOF'
/usr/local/pgsql/bin/initdb -D /usr/local/pgsql/data
/usr/local/pgsql/bin/pg_ctl -D /usr/local/pgsql/data -l logfile start
/usr/local/pgsql/bin/createdb test
/usr/local/pgsql/bin/pg_ctl -D /usr/local/pgsql/data -l logfile stop
EOF

echo "---- Create systemd service ----"
/bin/cp -f -p /vagrant/scripts/postgresql.service /etc/systemd/system/
systemctl daemon-reload
systemctl start postgresql.service
systemctl enable postgresql.service
