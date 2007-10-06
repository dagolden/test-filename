use strict;
use lib 'inc';
eval "require Pod::WikiDoc";
my $class = $@ ? "Module::Build" : "Module::Build::WikiDoc";
eval "require $class";
$class->new( 
    module_name         => 'Test::Filename',
    dist_author         => 'David A. Golden <dagolden@cpan.org>',
    license             => 'apache',
    create_readme       => 1,
    create_makefile_pl  => 'traditional',
    requires        => {
        # module requirements here
        'File::Basename'        => 0,
        'File::Spec'            => 3.19,
        'Test::More'            => 0.62, # various features/fixes
    },
    build_requires  => {
        'Test::Tester'          => 0.08,
    },
    meta_add            => { 
        no_index => { 
            directory => [ qw{
                examples
                inc
            }],
        } 
    },
)->create_build_script;
