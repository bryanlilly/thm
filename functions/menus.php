<?php 

/*--------------------------------------------------------*\
	Register Navigation Menu
\*--------------------------------------------------------*/

function wti_register_menus() {
	register_nav_menus(
		array(
			'nav' => 'Navigation',
		)
	);
}

add_action( 'init', 'wti_register_menus' );