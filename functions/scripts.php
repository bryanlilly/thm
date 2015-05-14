<?php

/*--------------------------------------------------------*\
	Styles and Scripts
\*--------------------------------------------------------*/

function jquery_init() {
	if ( !is_admin() ) {
		wp_dequeue_script('jquery');
	}
}
add_action('init', 'jquery_init');

function wti_enqueue_scripts() {
	wp_enqueue_script( 'main', THEME_DIR . '/bld/app.min.js', null, '1', true);
}
add_action('wp_enqueue_scripts', 'wti_enqueue_scripts');