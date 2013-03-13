use strict;
use warnings;
use Test::More;

use_ok('WWW::Github::Files');

my $gitfiles = WWW::Github::Files->new(
    author => 'semuel',
    resp => 'perlmodule-WWW-Github-Files',
    branch => 'master',
);

ok($gitfiles, "object created");

my @files = $gitfiles->open('/')->readdir();

ok(scalar(@files), "read root directory");

my ($manifest) = grep { $_->name eq 'MANIFEST' } @files;

ok($manifest, "found manifest file");

my $c = $manifest->read();

ok($c =~ m/^README$/m, "successfully read manifest file");

my ($t_dir) = grep { $_->name eq 't' } @files;

ok($t_dir, "found t directory");

my @t_files = $t_dir->readdir();

ok(scalar(@t_files), "read files from t dir");

$manifest = $gitfiles->open('/MANIFEST');

ok($manifest, "found manifest file - direct");

$c = $manifest->read();

ok($c =~ m/^README$/m, "successfully read manifest file - direct");

done_testing();
