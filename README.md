# alttp-bingo
Bingo Generator for A Link to the Past Speedrunners

## Installation
- Create a MySQL database and run `install/install.sql`
- Upload all files to host
- Copy `inc/db.php.template` to `inc/db.php` and edit the `$db_config` variable to match your environment
- Set up your vhost for apache (or configure your desired web server with PHP support) and point your domain there