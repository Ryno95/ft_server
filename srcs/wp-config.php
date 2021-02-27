<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** MySQL database username */
define( 'DB_USER', 'rynosaurus' );

/** MySQL database password */
define( 'DB_PASSWORD', '950207' );

/** MySQL hostname */
define( 'DB_HOST', 'localhost' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

//  To prevent redirect to example.com
define( 'WP_SITEURL', 'https://localhost/wordpress');
define( 'WP_HOME', 'https://localhost/wordpress');
/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         'T~_76r}]!+1#l88:+&F2@UW*z|sW-~6J9{RgE} C_(Z3+6qo=kQj[CUJD~kkCdTJ' );
define( 'SECURE_AUTH_KEY',  '],&Ha#`2TKkl{Lb/ZX*|Ww}WvL6$AWb$&DSLIRq$H_|2I|1r(N<-84>lWw+Y^|6y' );
define( 'LOGGED_IN_KEY',    '84JyruiAnmP_LMtZOJr>`NyHP+n8-&g4-+B~z:=~`$S]:wK%/bw@(5M|`+dy@_o8' );
define( 'NONCE_KEY',        'M/#+!/^Lj:=u]>,l|MTt[z&UQ1B2)P5q!8;Y:d$bj}$,8Q+rx)s<m%ZT<|tpjZ+v' );
define( 'AUTH_SALT',        'V>iSH]k9Lt.{b-or{g+~W}n3gFe]A0md1i@,}jz,XR==H)6*+ 8-^^w+O<VZKqTN' );
define( 'SECURE_AUTH_SALT', 'XL*j^,E5_>q*kp+Ap)+/@}aw3pc|]@-JX@h;}_Ry1@P<nt;xk-a+`%rJwz2$+eQJ' );
define( 'LOGGED_IN_SALT',   'NOXp4&]W;vSyx0P(j:c0-&9uX-:zQ*~)Q&&{7R8nYQHH(j/v=b#<cFRHKo+ P3vL' );
define( 'NONCE_SALT',       '|-h7cb RUP{[F@lRZ,sneQ<!M_=)tAGNJ5k@y#*mBhSTLpHBzE7E#M2E*GCG/xA|' );

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';