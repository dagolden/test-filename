use 5.006;
use strict;
use warnings;
package Test::Filename;
# ABSTRACT: Portable filename comparison
# VERSION

use Test::Builder::Module;
use Path::Tiny;

our @ISA = qw/Test::Builder::Module/; 
our @EXPORT = qw(
    filename_is 
    filename_isnt
); 

my $CLASS = __PACKAGE__;

#--------------------------------------------------------------------------#
# public API
#--------------------------------------------------------------------------#

sub filename_is {
    my($got, $expected, $label) = @_;
    return $CLASS->builder->is_eq(path($got), path($expected), $label);
}

sub filename_isnt {
    my($got, $expected, $label) = @_;
    return $CLASS->builder->isnt_eq(path($got), path($expected), $label);
}


1;

__END__

=head1 SYNOPSIS

  use Test::Filename tests => 2;
  
  filename_is  ( "some\path", "some/path", "should pass" );
  filename_isnt( "some\path", "some/path", "should fail" );

=head1 DESCRIPTION

Many cross-platform test failures -- particularly on Win32 -- are due to
hard-coded file paths being used in comparison tests.

  my $file = get_file();     # returns "foo\bar.t";
  is( $file, "foo/bar.t" );  # fails on Win32

This simple module provides some handy functions to convert all those
path separators automatically so filename tests will just DWIM.

The alternative is to write your own utility subroutine and use it everywhere
or just keep on littering your test code with calls to File::Spec -- yuck!

  is( $file, File::Spec->canonpath("some/path"), "should pass" );

Since this module is so simple, you might not think it worth including as a
dependency.  After all, it's not I<that> hard to always remember to use
L<File::Spec>, L<Path::Tiny> or some other file utility, right? But odds are
that, at some point, you'll be so busy writing tests that you'll forget and
hard-code a path in your haste to show what a clever programmer you are.

So just use this module and stop worrying about it.  You'll be happier
and so will anyone trying to install your modules on Win32.

=head1 USAGE

Just like Test::More, you have the option of providing a test plan
as arguments when you use this module. The following functions are 
imported by default.

=head2 filename_is
=head2 filename_isnt

    filename_is  ( $got, $expected, $label );
    filename_isnt( $got, $expected, $label );

These functions work just like C<is()> and C<isnt()> from Test::More, but
the first two argument will be cleaned up and normalized to Unix-style
paths using L<Path::Tiny>.  This means that C<.\foo.txt> will get normalized
to C<foo.txt> and so on.

=head1 SEE ALSO

=for :list
* L<perlport>
* L<File::Spec>
* L<Path::Tiny>
* L<Test::More>

=cut
