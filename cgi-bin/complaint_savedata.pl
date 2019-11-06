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

if (defined $fd{regname})
    {
        my $STH = $DBH -> do("INSERT INTO complaint.users (user_name,password) VALUES('".$fd{regname}."', '".$fd{regpass}."');") or report_error("Error preparing SQL:".$DBH->errstr());
        $result{check} = 0;
        $result{message} = "User registered successfully";
    }
if (defined $fd{uid})
    {
        if(defined $fd{c_type})
        {
            my $STH = $DBH -> do("INSERT INTO complaint.fact_complaints (u_id, mobile, problem_date, comments,c_type) VALUES('".$fd{uid}."','".$fd{phone}."', '".$fd{PODATE}."', '".$fd{c_comments}."','".$fd{c_type}."')") or report_error("Error preparing SQL:".$DBH->errstr());
            $result{check} = 0;
            $result{message} = "Complaint registered successfully";
        }
    }

if($fd{TYPE} eq "UPDATE")
    {
        my $STH = $DBH -> do("UPDATE complaint.fact_complaints SET status='".$fd{status}."' where c_id='".$fd{c_id}."'") or report_error("Error preparing SQL:".$DBH->errstr());
        $result{check} = 0;
        $result{message} = "Complaint registered successfully";
    }

print encode_json \%result;
exit 0;

sub report_error
{
$result{check}=1;
$result{message}=$_[0];
print encode_json \%result;
exit 0;
}