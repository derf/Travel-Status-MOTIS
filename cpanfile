requires 'Class::Accessor';
requires 'DateTime';
requires 'DateTime::Format::ISO8601';
requires 'Getopt::Long';
requires 'JSON';
requires 'List::Util';
requires 'LWP::UserAgent';
requires 'LWP::Protocol::https';

on test => sub {
	requires 'File::Slurp';
	requires 'Test::Compile';
	requires 'Test::More';
	requires 'Test::Pod';
};
