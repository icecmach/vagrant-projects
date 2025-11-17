# Install the repository RPM
sudo dnf install -y https://download.postgresql.org/pub/repos/yum/reporpms/EL-10-x86_64/pgdg-redhat-repo-latest.noarch.rpm

# Disable the built-in PostgreSQL module:
sudo dnf -qy module disable postgresql

# Install PostgreSQL:
sudo dnf install -y postgresql18-server

PGHOME=$(echo ~postgres)
# Create script directory
mkdir -p $PGHOME/scripts
chown postgres:postgres $PGHOME/scripts

# Optionally initialize the database and enable automatic start:
sudo /usr/pgsql-18/bin/postgresql-18-setup initdb
sudo systemctl enable postgresql-18
sudo systemctl start postgresql-18

# Prepare postgres user environment
cp /vagrant/scripts/setEnv.sh $PGHOME/scripts
cp -f -p /vagrant/scripts/.bash_profile $PGHOME

# Set permissions
chown -R postgres:postgres $PGHOME
chmod u+x $PGHOME/scripts/*.sh
