package Test::Filename;
use 5.004;
use strict;
use vars qw/$VERSION @ISA @EXPORT/;
use Config;
use Test::Builder::Module;

BEGIN { 
    $VERSION = '0.01'; 
    @ISA = qw/Test::Builder::Module/; 
    @EXPORT = qw(
        filename_is 
        filename_isnt
    ); 
}

my $CLASS = __PACKAGE__;

#--------------------------------------------------------------------------#
# public API
#--------------------------------------------------------------------------#

sub filename_is {
    my($got, $expected, $label) = @_;
    return $CLASS->builder->is_eq(_path($got), _path($expected), $label);
}

sub filename_isnt {
    my($got, $expected, $label) = @_;
    return $CLASS->builder->isnt_eq(_path($got), _path($expected), $label);
}

#--------------------------------------------------------------------------#
# private functions
#--------------------------------------------------------------------------#

my $path_sep = quotemeta($Config{path_sep});

sub _path {
    my ($path) = @_;
    $path =~ s{$path_sep}{/}g;
    return $path;
}


1; #modules must return true

__END__

#--------------------------------------------------------------------------#
# pod documentation 
#--------------------------------------------------------------------------#

=begin wikidoc

= NAME

Test::Filename - Portable filename comparison

= VERSION

This documentation describes version %%VERSION%%.

= SYNOPSIS

  use Test::Filename tests => 2;
  
  filename_is  ( "some\path", "some/path", "should pass" );
  filename_isnt( "some\path", "some/path", "should fail" );

= DESCRIPTION

Many cross-platform test failures -- particularly on Win32 -- are due to
hard-coded file paths being used in comparison tests.

  my $file = get_file();     # returns "foo\bar.t";
  is( $file, "foo/bar.t" );  # fails on Win32

This simple module provides some handy functions to convert all those
path separators automatically so filename tests will just DWIM.

The alternative is to write your own utility subroutine and use it everywhere
or just keep on littering your test code with calls to File::Spec -- yuck!

  is( $file, File::Spec->canonpath("some/path"), "should pass" );

Since this module is so simple, you might not think it worth including
as a {build_requires} dependency.  After all, it's not ~that~ hard to
always remember to use [File::Spec], right? But odds are that, at some point, 
you'll be so busy writing tests that you'll forget and hard-code a path in
your haste to show what a clever programmer you are.

So just use this module and stop worrying about it.  You'll be happier
and so will anyone trying to install your modules on Win32.

= USAGE

Just like Test::More, you have the option of providing a test plan
as arguments when you {use} this module. The following functions are 
imported by default.

== filename_is
== filename_isnt

    filename_is  ( $got, $expected, $label );
    filename_isnt( $got, $expected, $label );

These functions work just like {is()} and {isnt()} from Test::More, but
the first argument will have native path separators converted to forward 
slashes before comparison.  The {$expected} argument must use unix-style
forward slashes as path separators.

= BUGS

Please report any bugs or feature using the CPAN Request Tracker.  
Bugs can be submitted through the web interface at 
[http://rt.cpan.org/Dist/Display.html?Queue=Test-Filename]

When submitting a bug or request, please include a test-file or a patch to an
existing test-file that illustrates the bug or desired feature.

= SEE ALSO

* [perlport]
* [File::Spec]
* [Test::More]

= AUTHOR

David A. Golden (DAGOLDEN)

= COPYRIGHT AND LICENSE

Copyright (c) 2007 by David A. Golden

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at 
[http://www.apache.org/licenses/LICENSE-2.0]

Files produced as output though the use of this software, including
generated copies of boilerplate templates provided with this software,
shall not be considered Derivative Works, but shall be considered the
original work of the Licensor.

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

=end wikidoc

=cut
