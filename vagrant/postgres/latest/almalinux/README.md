# Postgres on AlmaLinux 10-kitten

This build compiles Postgres from source code

### Required Software

- [Postgres source](https://www.postgresql.org/ftp/source/)

Place the software in the "software" directory before calling the vagrant up command.

Directory contents when software is included.

```bash
➜ tree
.
├── README.md
├── scripts
│   ├── postgresql.service
│   ├── setEnv.sh
│   └── setup.sh
├── software
│   └── postgresql-17.5.tar.gz
└── Vagrantfile

3 directories, 6 files
```

Start the build:

```bash
➜ vagrant up
```

Login with user postgres:

```bash
➜ vssh
[vagrant@vbox ~]$ sudo su - postgres
Last login: Tue Apr 15 00:26:04 UTC 2025
==================== PostgreSQL System Info ====================
PostgreSQL Service Status: pg_ctl: server is running (PID: 15171)
/usr/local/pgsql/bin/postgres "-D" "/usr/local/pgsql/data"
------------------------------------------------------------
PGData Usage: 46M	/usr/local/pgsql/data
------------------------------------------------------------
Memory Usage: Total memory used by PostgreSQL (in KB): 82.9219 MB
==================== End of PostgreSQL Info ====================
```
