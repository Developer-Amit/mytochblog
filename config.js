// # Ghost Configuration
// Setup your Ghost install for various [environments](http://support.ghost.org/config/#about-environments).

// Ghost runs in `development` mode by default. Full documentation can be found at http://support.ghost.org/config/

var path = require('path'),
    config;

config = {
    // ### Production
    // When running Ghost in the wild, use the production environment.
    // Configure your URL and mail settings here
    production: {
        url: 'localhost:2368',
        mail: {},
        database: {
            client: 'mysql',
            connection: {
                host: 'localhost',
                user: 'root',
                password: '',
                database: 'mytoch-blog',
                charset: 'utf8'
            },
            debug: true
        },

        server: {
            host: 'localhost',
            port: '2368'
        }
    },

    // ### Development **(default)**
    development: {
        // The url to use when providing links to the site, E.g. in RSS and email.
        // Change this to your Ghost blog's published URL.
        url: 'http://localhost:2368',

        // Example refferer policy
        // Visit https://www.w3.org/TR/referrer-policy/ for instructions
        // default 'origin-when-cross-origin',
        // referrerPolicy: 'origin-when-cross-origin',

        // Example mail config
        // Visit http://support.ghost.org/mail for instructions
        // ```
        //  mail: {
        //      transport: 'SMTP',
        //      options: {
        //          service: 'Mailgun',
        //          auth: {
        //              user: '', // mailgun username
        //              pass: ''  // mailgun password
        //          }
        //      }
        //  },

        // mail: {
        //     transport: 'SMTP',
        //     options: {
        //         service: 'Gmail',
        //         auth: {
        //             user: 'ideamediaservices@gmail.com',
        //             pass: 'Linkites123'
        //         }
        //     }
        // }
        // mail: {
        //     from: '"Mytoch Blog" <amitmishra@linkites.com>',
        // }

        // ```

        // #### Database
        // Ghost supports sqlite3 (default), MySQL & PostgreSQL
       database: {
            client: 'mysql',
            connection: {
                host: 'localhost',
                user: 'root',
                password: '',
                database: 'ghost_testing',
                charset: 'utf8'
            },
            debug: true
        },
        // #### Server
        // Can be host & port (default), or socket
        server: {
            // Host to be passed to node's `net.Server#listen()`
            host: 'localhost',
            // Port to be passed to node's `net.Server#listen()`, for iisnode set this to `process.env.PORT`
            port: '2368'
        },
        // #### Paths
        // Specify where your content directory lives
        paths: {
            contentPath: path.join(__dirname, '/content/')
        }
    },

    // **Developers only need to edit below here**

    // ### Testing
    // Used when developing Ghost to run tests and check the health of Ghost
    // Uses a different port number
    testing: {
        url: 'http://localhost:2369',
        database: {
            client: 'sqlite3',
            connection: {
                filename: path.join(__dirname, '/content/data/ghost-test.db')
            },
            pool: {
                afterCreate: function (conn, done) {
                    conn.run('PRAGMA synchronous=OFF;' +
                    'PRAGMA journal_mode=MEMORY;' +
                    'PRAGMA locking_mode=EXCLUSIVE;' +
                    'BEGIN EXCLUSIVE; COMMIT;', done);
                }
            },
            useNullAsDefault: true
        },
        server: {
            host: 'localhost',
            port: '2369'
        },
        logging: false
    },

    // ### Testing MySQL
    // Used by Travis - Automated testing run through GitHub
    'testing-mysql': {
        url: 'http://localhost:2369',
        database: {
            client: 'mysql',
            connection: {
                host     : 'localhost',
                user     : 'root',
                password : '',
                database : 'ghost_testing',
                charset  : 'utf8'
            }
        },
        server: {
            host: 'localhost',
            port: '2369'
        },
        logging: false
    },

    // ### Testing pg
    // Used by Travis - Automated testing run through GitHub
    'testing-pg': {
        url: 'http://localhost:2369',
        database: {
            client: 'pg',
            connection: {
                host     : 'localhost',
                user     : 'postgres',
                password : '',
                database : 'ghost_testing',
                charset  : 'utf8'
            }
        },
        server: {
            host: 'localhost',
            port: '2369'
        },
        logging: false
    }
};

module.exports = config;
