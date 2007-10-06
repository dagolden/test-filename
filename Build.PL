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
        'Test::More'            => 0.62, # various features/fixes
    },
    build_requires  => {
        'File::Spec'            => 0,
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
