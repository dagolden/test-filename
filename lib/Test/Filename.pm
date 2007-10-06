package Test::Filenames;
use strict;

$Test::Filenames::VERSION = '0.01'; 

use Test::Builder;
use File::Basename qw/basename/;
use File::Spec::Functions qw/canonpath/;

use vars qw/@ISA @EXPORT/;
use Exporter ();
BEGIN { @ISA = qw/Exporter/ }
@EXPORT = qw(
    filename_is 
    filename_isnt
    filename_like
    filename_unlike
);

my $TB = Test::Builder->new();

#--------------------------------------------------------------------------#
# import -- cribbed from Test::Builder
#--------------------------------------------------------------------------#

sub import {
    my ($self, @args) = @_;
    my $pack = caller;

    $Test->exported_to($pack);
    $Test->plan(@_);

    $self->export_to_level(1, $self, $_) for @EXPORT;
}

#--------------------------------------------------------------------------#
# public API
#--------------------------------------------------------------------------#

sub filename_is {

}

sub filename_isnt {

}

sub filename_like {

}

sub filename_unlike {

}

#--------------------------------------------------------------------------#
# private functions
#--------------------------------------------------------------------------#


1; #modules must return true

__END__

#--------------------------------------------------------------------------#
# pod documentation 
#--------------------------------------------------------------------------#

=begin wikidoc

= NAME

Test::Filenames - Portable tests for filenames

= VERSION

This documentation describes version %%VERSION%%.

= SYNOPSIS


= DESCRIPTION

= USAGE

= BUGS

Please report any bugs or feature using the CPAN Request Tracker.  
Bugs can be submitted through the web interface at 
[http://rt.cpan.org/Dist/Display.html?Queue=Test-Filenames]

When submitting a bug or request, please include a test-file or a patch to an
existing test-file that illustrates the bug or desired feature.

= SEE ALSO


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
