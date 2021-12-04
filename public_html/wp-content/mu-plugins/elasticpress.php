<?php

add_filter( 'ep_index_prefix', function() {
	return md5(home_url());
} );