<?php
// @link https://github.com/svandragt/elasticsearch-vvv-utility
add_filter( 'ep_index_prefix', function() {
	return md5(home_url());
} );
