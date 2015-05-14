<?php 

/*--------------------------------------------------------*\
	Post Thumbnails
\*--------------------------------------------------------*/

if ( function_exists( 'add_theme_support' ) ) {
	add_theme_support( 'post-thumbnails' );
	set_post_thumbnail_size();
}

/*--------------------------------------------------------*\
	Clean Up
\*--------------------------------------------------------*/

function removeHeadLinks() {
	remove_action('wp_head', 'rsd_link');
	remove_action('wp_head', 'wlwmanifest_link');
}
add_action('init', 'removeHeadLinks');
remove_action('wp_head', 'wp_generator');