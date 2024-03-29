---
date: 2015-06-17T01:04:19
lang: en
tags: [ wordpress, info, tips, tricks, how to ]
title: WordPress
summary: Small information nuggets and recipies about WordPress
showToc: true
tocOpen: true
---

*(most recent on top)*

## Dequeue scripts and styles from the parent theme

* [How do I dequeue a parent theme css file? - WordPress Answers](http://wordpress.stackexchange.com/questions/65523/how-do-i-dequeue-a-parent-theme-css-file/65526#65526)

```php
// Dequeue styles & scripts from the parent theme
wp_dequeue_style( 'parenttheme-style' );
wp_dequeue_script( 'parenttheme-script' );
```

```php
// Deregister handles to reuse them when enqueuing your own stuff
wp_deregister_style( 'parenttheme-style' );
wp_deregister_script( 'parenttheme-script' );
```

## Create custom post types (in code)

* [Function Reference/register post type « WordPress Codex](http://codex.wordpress.org/Function_Reference/register_post_type)
* [register_post_type() cheat sheet](http://justintadlock.com/archives/2013/09/13/register-post-type-cheat-sheet)
* [Custom Post Type Snippets to make you smile • Yoast](https://yoast.com/custom-post-type-snippets/)
* [Dashicons icon font](http://melchoyce.github.io/dashicons/)

## Code conventions

* [**WordPress Coding Standards « Make WordPress Core**](http://make.wordpress.org/core/handbook/coding-standards/)
* [PHP Coding Standards](http://make.wordpress.org/core/handbook/coding-standards/php/)
* [HTML Coding Standards](http://make.wordpress.org/core/handbook/coding-standards/html/)
* [CSS Coding Standards](http://make.wordpress.org/core/handbook/coding-standards/css/)
* [JavaScript Coding Standards](http://make.wordpress.org/core/handbook/coding-standards/javascript/)

## String translation, i18n and l10n

* [Internationalization: You're probably doing it wrong » Otto on WordPress](http://ottopress.com/2012/internationalization-youre-probably-doing-it-wrong/)
* [Translating WordPress Plugins and Themes: Don't Get Clever | Mark on WordPress](http://markjaquith.wordpress.com/2011/10/06/translating-wordpress-plugins-and-themes-dont-get-clever/)

*… returns the translated string*

```php
__( 'Phrase to translate', 'text-domain' );
_x( 'Phrase to translate', 'context comment for translators', 'text-domain' );
_n( '1 singular', '%s plural', $the-number, 'text-domain' );
_nx( '1 singular', '%s plural', $the-number, 'context comment for translators', 'text-domain' );
```

*… echoes the translated string*

```php
_e( 'Phrase to translate', 'text-domain' );
_ex( 'Phrase to translate', 'comment context for translators', 'text-domain' );
```

## Manually activate as user

1. Get the activation key for the user from table `wp-signup`
2. Go to url: `/wp-activate.php?key=...`

## Wordpress installation url

 *… HF: Always use this first one*

```php
bloginfo(‘wpurl’)       // same as setting "WordPress address (URL)"
bloginfo(‘url’)         // same as setting "Site address (URL)"
```

## `wp-config` settings

### Auth keys

* Generator: <https://api.wordpress.org/secret-key/1.1/salt/>

### Override domain (dev)

* [wp-config.php | Common APIs Handbook | WordPress Developer Resources](https://developer.wordpress.org/apis/wp-config-php/#advanced-options)

```php
define( 'WP_SITEURL', 'http://' . $_SERVER['SERVER_NAME'] );
define( 'WP_HOME',    'http://' . $_SERVER['SERVER_NAME'] );
```

### Debug settings (dev)

* [5 Ways to Debug WordPress – Nacin](http://andrewnacin.com/2010/04/23/5-ways-to-debug-wordpress/)

```php
define( 'WP_DEBUG', true );
define( 'WP_DEBUG_LOG', true );         # error_log( "debug message" );
define( 'WP_DEBUG_DISPLAY', false );
define( 'SCRIPT_DEBUG', true );
define( 'SAVEQUERIES', true );
```

## Plugins

### Global paths

* [10 Things Every WordPress Plugin Developer Should Know — Smashing Magazine](http://wp.smashingmagazine.com/2011/03/08/ten-things-every-wordpress-plugin-developer-should-know)

```php
if ( !defined( 'MYPLUGIN_XXXXX' ))
    define( 'MYPLUGIN_MYPLUGIN_XXXXX', ABSPATH . _____ );
```

<mark>HF: Best way to retrieve `THEME_DIR`, `PLUGIN_NAME`, `PLUGIN_DIR`, `PLUGIN_URL`?</mark>

### Define version

```php
if ( !defined( 'MYPLUGIN_VERSION_KEY' )) define( 'MYPLUGIN_VERSION_KEY', 'myplugin_version' );
if ( !defined( 'MYPLUGIN_VERSION_NUM' )) define( 'MYPLUGIN_VERSION_NUM', '1.0.0' );
add_option( MYPLUGIN_VERSION_KEY, MYPLUGIN_VERSION );
```

<mark>HF: Does this need to be duplicated somewhere in the plugin "metadata"?</mark>

### Version upgrades

```php
$new_version = '2.0.0';
if ( get_option( MYPLUGIN_VERSION_KEY ) != $new_version ) {
    // Execute your upgrade logic here
    update_option( MYPLUGIN_VERSION_KEY, $new_version );
}
```
