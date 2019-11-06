#!C:\\Strawberry\\perl\\bin\\perl
use DBI;
use strict;
use JSON::XS;

require 'C:\\Users\\Z0042KME\\xampp\\htdocs\\PWC\\cgi-bin\\functions.pl';
my %fd=init_cgi();
my $DBH=init_dbh("public");
my %result;
$result{check} = 0;
print "Content-type: application/json\n\n";

if (defined $fd{loguser})
    {
        # my %data;
        my @ROW=get_data($DBH,"SELECT id,user_name from complaint.users WHERE user_name = '".$fd{loguser}."'and password='".$fd{logpass}."'");
        # $data{user} = ${$ROW[0]}[0];
        print encode_json \@ROW;
    }

elsif ($fd{TYPE} eq "GETCOMPLAIN")
{
    my @ROW=get_data($DBH,"select id,c_type from complaint.lkp_complaint");
    print encode_json \@ROW;
}
elsif ($fd{TYPE} eq "LISTCOMPLAINT")
{
    my @ROW=get_data($DBH,"select c_id,user_name,mobile,v.c_type,u.comments from complaint.fact_complaints u inner join complaint.lkp_complaint v on u.c_type=v.id inner join complaint.users z on z.id = u.u_id where u.status is null");
    print encode_json \@ROW;
}
if ($fd{TYPE} eq "REPORT")
{
    my @ROW=get_data($DBH,"select c_type,comments,coalesce(status,'Not initiated') from complaint.fact_complaints where u_id='".$fd{uid}."';");
    print encode_json \@ROW;
}

exit 0;

sub report_error
{
$result{check}=1;
$result{message}=$_[0];
print encode_json \%result;
exit 0;
}