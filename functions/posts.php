<?php 

/*--------------------------------------------------------*\
	Register Post Types
\*--------------------------------------------------------*/

add_action('init', 'gvs_posts_register');

function gvs_posts_register() {

	$labels = array(
		'name' => _x('News', 'post type general name'),
		'singular_name' => _x('News', 'post type singular name'),
		'add_new' => _x('Add New', 'News'),
		'add_new_item' => __('Add New News'),
		'edit_item' => __('Edit News'),
		'new_item' => __('New News'),
		'view_item' => __('View News'),
		'search_items' => __('Search News'),
		'not_found' => __('Nothing found'),
		'not_found_in_trash' => __('Nothing found in Trash'),
		'parent_item_colon' => ''
	);
	 
	$args = array(
		'labels' => $labels,
		'public' => true,
		'publicly_queryable' => true,
		'show_ui' => true,
		'query_var' => true,
		'capability_type' => 'post',
		'hierarchical' => false,
		'has_archive' => false,
		'menu_position' => null,
		'supports' => array('title', 'editor', 'thumbnail'),
		'rewrite' => true,
		'show_in_nav_menus' => true,
	);
	
	register_post_type('news' , $args);

	$labels = array(
		'name' => _x('Press', 'post type general name'),
		'singular_name' => _x('Press', 'post type singular name'),
		'add_new' => _x('Add New', 'Press'),
		'add_new_item' => __('Add New Press'),
		'edit_item' => __('Edit Press'),
		'new_item' => __('New Press'),
		'view_item' => __('View Press'),
		'search_items' => __('Search Press'),
		'not_found' => __('Nothing found'),
		'not_found_in_trash' => __('Nothing found in Trash'),
		'parent_item_colon' => ''
	);
	 
	$args = array(
		'labels' => $labels,
		'public' => true,
		'publicly_queryable' => true,
		'show_ui' => true,
		'query_var' => true,
		'capability_type' => 'post',
		'hierarchical' => false,
		'has_archive' => true,
		'menu_position' => null,
		'supports' => array('title', 'editor', 'thumbnail'),
		'rewrite' => true,
		'show_in_nav_menus' => true,
	);
	
	register_post_type('press' , $args);

	$labels = array(
		'name' => _x('Team', 'post type general name'),
		'singular_name' => _x('Team', 'post type singular name'),
		'add_new' => _x('Add New', 'Team'),
		'add_new_item' => __('Add New Team'),
		'edit_item' => __('Edit Team'),
		'new_item' => __('New Team'),
		'view_item' => __('View Team'),
		'search_items' => __('Search Team'),
		'not_found' => __('Nothing found'),
		'not_found_in_trash' => __('Nothing found in Trash'),
		'parent_item_colon' => ''
	);
	 
	$args = array(
		'labels' => $labels,
		'public' => true,
		'publicly_queryable' => true,
		'show_ui' => true,
		'query_var' => true,
		'capability_type' => 'post',
		'hierarchical' => false,
		'has_archive' => false,
		'taxonomies' => false,
		'menu_position' => null,
		'supports' => array('title', 'editor', 'thumbnail'),
		'rewrite' => true,
		'show_in_nav_menus' => true,
	);
	
	register_post_type('team' , $args);

	$labels = array(
		'name' => _x('Companies', 'post type general name'),
		'singular_name' => _x('Companies', 'post type singular name'),
		'add_new' => _x('Add New', 'Companies'),
		'add_new_item' => __('Add New Companies'),
		'edit_item' => __('Edit Companies'),
		'new_item' => __('New Companies'),
		'view_item' => __('View Companies'),
		'search_items' => __('Search Companies'),
		'not_found' => __('Nothing found'),
		'not_found_in_trash' => __('Nothing found in Trash'),
		'parent_item_colon' => ''
	);
	 
	$args = array(
		'labels' => $labels,
		'public' => true,
		'publicly_queryable' => true,
		'show_ui' => true,
		'query_var' => true,
		'capability_type' => 'post',
		'hierarchical' => false,
		'has_archive' => false,
		'taxonomies' => false,
		'menu_position' => null,
		'supports' => array('title', 'editor', 'thumbnail'),
		'rewrite' => true,
		'show_in_nav_menus' => true,
	);
	
	register_post_type('companies' , $args);
}

/*--------------------------------------------------------*\
	Register Custom Taxonomies
\*--------------------------------------------------------*/

add_action('init', 'register_tax');

function register_tax() {
	register_taxonomy ( 
		'team_categories', 
		'team', 
		array(
			'labels' => array(
				'name' => 'Category',
				'add_new_item' => 'Add New Category',
				'new_item_name' => 'New Category'
			),
			'show_ui' => true,
			'hierarchical' => true,
			'show_tagcloud' => false
		) 
	);

	register_taxonomy ( 
		'companies_sectors', 
		'companies', 
		array(
			'labels' => array(
				'name' => 'Sector',
				'add_new_item' => 'Add New Sector',
				'new_item_name' => 'New Sector'
			),
			'show_ui' => true,
			'hierarchical' => true,
			'show_tagcloud' => false
		) 
	);

	register_taxonomy ( 
		'companies_investors', 
		'companies', 
		array(
			'labels' => array(
				'name' => 'Equity Investor',
				'add_new_item' => 'Add New Equity Investor',
				'new_item_name' => 'New Equity Investor'
			),
			'show_ui' => true,
			'hierarchical' => true,
			'show_tagcloud' => false
		) 
	);
}