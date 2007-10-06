use strict;
BEGIN{ if (not $] < 5.006) { require warnings; warnings->import } }

select(STDERR); $|=1;
select(STDOUT); $|=1;

use File::Spec::Functions qw/canonpath/;

#--------------------------------------------------------------------------#

my $expected_file = "t/00-load.t";
my $got_file = canonpath( $expected_file );

#--------------------------------------------------------------------------#

use Test::Tester 'no_plan';
use Test::Filename;

check_test(
    sub {
        filename_is( $got_file, $expected_file, "foo" );
    },
    {
        ok => 1,
        name => "foo",
        diag => q{},
    },
    "filename_is"
);

