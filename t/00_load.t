use strict;
BEGIN{ if (not $] < 5.006) { require warnings; warnings->import } }

select(STDERR); $|=1;
select(STDOUT); $|=1;

use Test::More;

my @api = qw(
    filename_is
    filename_isnt
    filename_like
    filename_unlike
);

plan tests =>  1 + 2 * @api;

#--------------------------------------------------------------------------#

require_ok( 'Test::Filename' );

can_ok( 'Test::Filename', $_ ) for @api;

package Foo;

Test::Filename->import();

can_ok( 'Foo', $_ ) for @api;

