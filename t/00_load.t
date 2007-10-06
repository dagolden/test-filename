use strict;
BEGIN{ if (not $] < 5.006) { require warnings; warnings->import } }

select(STDERR); $|=1;
select(STDOUT); $|=1;

use Test::More;

my @api = qw(
    filename_is
    filename_isnt
);

plan tests =>  1 + 2 * @api;

#--------------------------------------------------------------------------#

require_ok( 'Test::Filename' );

can_ok( 'Test::Filename', $_ ) for @api;

package ThisPackage;

Test::Filename->import();

main::can_ok( 'ThisPackage', $_ ) for @api;

