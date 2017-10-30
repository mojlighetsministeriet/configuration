# Configuration

This is a sample configuration to simplify deployment of Möjlighetsministeriets administration platform.

## Run installation

1. Update docker-compose.persistence.yml file under mariadb.environment with database credentials
2. Update docker-compose.services.yml file under identity-provider.environment with email settings
3. Update ./secrets/database-connection to match MYSQL_USER/MYSQL_PASSWORD/MYSQL_DATABASE from docker-compose.persistence.yml
5. Update ./secrets/smtp-password to match with the email account set in docker-compose.services.yml identity-provider.environment
4. Create a new RSA private key in ./secrets/private-key with (https://github.com/mojlighetsministeriet/rsa-private-key-generator)

    $ go get github.com/mojlighetsministeriet/rsa-private-key-generator
    $ rsa-private-key-generator 4096 > private-key

5. Update HTTPS/TLS certificates in ./tls (you can use Let's Encrypt https://letsencrypt.org/)
6. Install the services with:

    $ ./install.sh

Verify that the services starts with:

    $ docker ps

or by visiting:

    https://yourdomain:8081

## License

All the code in this project goes under the license GPLv3 (https://www.gnu.org/licenses/gpl-3.0.en.html).
