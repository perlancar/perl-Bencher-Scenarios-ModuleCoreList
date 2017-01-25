package Bencher::Scenario::ModuleCoreListMore;

use 5.010001;
use strict;
use warnings;
use FindBin '$Bin';
use lib "$Bin/../lib";

use Benchmark::Dumb qw(cmpthese);
use Module::CoreList;
use Module::CoreList::More;

cmpthese(0, {
    'MC->removed_from(CGI)'   => sub { Module::CoreList->removed_from      ("CGI") },
    'MC->removed_from(Foo)'   => sub { Module::CoreList->removed_from      ("Foo") },
    'MCM->removed_from(CGI)'  => sub { Module::CoreList::More->removed_from("CGI") },
    'MCM->removed_from(Foo)'  => sub { Module::CoreList::More->removed_from("Foo") },
});
say "";

cmpthese(0, {
    'MC->removed_from_by_date(CGI)'   => sub { Module::CoreList->removed_from_by_date      ("CGI") },
    'MC->removed_from_by_date(Foo)'   => sub { Module::CoreList->removed_from_by_date      ("Foo") },
    'MCM->removed_from_by_date(CGI)'  => sub { Module::CoreList::More->removed_from_by_date("CGI") },
    'MCM->removed_from_by_date(Foo)'  => sub { Module::CoreList::More->removed_from_by_date("Foo") },
});
say "";

cmpthese(0, {
    'MC->first_release(Foo)'   => sub { Module::CoreList->first_release      ("Foo"      ) },
    'MC->first_release(CGI)'   => sub { Module::CoreList->first_release      ("Benchmark") },
    'MCM->first_release(Foo)'  => sub { Module::CoreList::More->first_release("Foo"      ) },
    'MCM->first_release(CGI)'  => sub { Module::CoreList::More->first_release("Benchmark") },
});
say "";

cmpthese(0, {
    'MC->first_release_by_date(Foo)'   => sub { Module::CoreList->first_release_by_date      ("Foo"      ) },
    'MC->first_release_by_date(CGI)'   => sub { Module::CoreList->first_release_by_date      ("Benchmark") },
    'MCM->first_release_by_date(Foo)'  => sub { Module::CoreList::More->first_release_by_date("Foo"      ) },
    'MCM->first_release_by_date(CGI)'  => sub { Module::CoreList::More->first_release_by_date("Benchmark") },
});
say "";

cmpthese(0, {
    'MC->is_core(Foo)'         => sub { Module::CoreList->is_core            ("Foo"      , undef, 5.010001) },
    'MCM->is_core(Foo)'        => sub { Module::CoreList::More->is_core      ("Foo"      , undef, 5.010001) },
    'is_still_core(Foo)'       => sub { Module::CoreList::More->is_still_core("Foo"      , undef, 5.010001) },
});
say "";

cmpthese(0, {
    'MC->is_core(Benchmark)'   => sub { Module::CoreList->is_core            ("Benchmark", undef, 5.010001) },
    'MCM->is_core(Benchmark)'  => sub { Module::CoreList::More->is_core      ("Benchmark", undef, 5.010001) },
    'is_still_core(Benchmark)' => sub { Module::CoreList::More->is_still_core("Benchmark", undef, 5.010001) },
});
say "";

cmpthese(0, {
    'MC->is_core(CGI)'         => sub { Module::CoreList->is_core            ("CGI"      , undef, 5.010001) },
    'MCM->is_core(CGI)'        => sub { Module::CoreList::More->is_core      ("CGI"      , undef, 5.010001) },
    'is_still_core(CGI)'       => sub { Module::CoreList::More->is_still_core("CGI"      , undef, 5.010001) },
});
say "";

cmpthese(0, {
    'list_core_modules(5.010001)'       => sub { Module::CoreList::More->list_core_modules(5.010001) },
    'list_core_modules(5.020002)'       => sub { Module::CoreList::More->list_core_modules(5.020002) },
    'list_still_core_modules(5.010001)' => sub { Module::CoreList::More->list_still_core_modules(5.010001) },
    'list_still_core_modules(5.020002)' => sub { Module::CoreList::More->list_still_core_modules(5.020002) },
});
